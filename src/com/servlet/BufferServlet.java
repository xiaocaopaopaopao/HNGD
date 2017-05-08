package com.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.StaticVar;
import com.util.Utils;

public class BufferServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String in_features_name = req.getParameter("in_features_name");
		String distance = req.getParameter("distance");
		String tool = req.getParameter("tool");
		Utils utils = new Utils();
		// 组装执行python脚本命令
		String cmd = "python " + StaticVar.python_path + tool + " "
				+ StaticVar.intput_path + " " + in_features_name + " "
				+ distance + " " + StaticVar.output_path;
		PrintWriter out = resp.getWriter();
		try {
			// 清空输出文件夹
			utils.clearDir(StaticVar.output_path);
			System.out.println(cmd);
			Process pr = Runtime.getRuntime().exec(cmd);
			BufferedReader in = new BufferedReader(new InputStreamReader(
					pr.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				out.write(line);
			}
			in.close();
			pr.waitFor();
		} catch (Exception e) {
			out.write(StaticVar.fail);
		} finally {
			out.close();
		}
	}
}
