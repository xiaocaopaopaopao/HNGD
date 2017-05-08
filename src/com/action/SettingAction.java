package com.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dao.SettingDao;
import com.opensymphony.xwork2.ActionSupport;

public class SettingAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private SettingDao settingDao = new SettingDao();

	/***
	 * ��ȡ��������������Ϣ
	 * 
	 * @param response
	 */
	public void readServer() {
		String message = settingDao.readServer();

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(message);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null)
				out.close();
		}
	}

	/***
	 * �������������
	 */
	public void saveServer() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String data = request.getParameter("data");
		settingDao.saveServer(data);
	}

	/***
	 * ��ȡ�Զ�ͬ��Ĭ������
	 */
	public void readAutoSync() {
		String message = settingDao.readAutoSync();

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(message);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null)
				out.close();
		}
	}

	public void saveAutoSync() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String data = request.getParameter("data");
		settingDao.saveAutoSync(data);
	}
}
