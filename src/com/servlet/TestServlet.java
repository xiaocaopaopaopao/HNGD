package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.esri.arcgis.geodatabase.ICursor;
import com.esri.arcgis.geodatabase.IQueryFilter;
import com.esri.arcgis.geodatabase.IRow;
import com.esri.arcgis.geodatabase.ITable;
import com.esri.arcgis.geodatabase.QueryFilter;
import com.esri.arcgis.geodatabase.Workspace;
import com.esri.arcgis.system.AoInitialize;
import com.esri.arcgis.system.EngineInitializer;
import com.util.EngineUtils;
import com.util.StaticVar;

public class TestServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = null;
		AoInitialize aoInit = null;

		try {
			// 初始化engine应用
			EngineUtils engineUtils = new EngineUtils();
			EngineInitializer.initializeEngine();
			aoInit = new AoInitialize();
			engineUtils.initializeArcGISLicenses(aoInit);

			// 数据连接
			String inFGDB = StaticVar.output_path2;
			Workspace workspace = engineUtils.getFileGDBWorkspace(inFGDB
					.substring(0, inFGDB.length() - 1));
			ITable table = workspace.openTable("stats");
			IQueryFilter queryFilter = new QueryFilter();
			ICursor pCursor = table.ITable_search(queryFilter, true);
			IRow pRow = pCursor.nextRow();

			Map<String, Double> map = new HashMap<String, Double>();
			Map<String, String> map2 = new HashMap<String, String>();
			map2.put("01", "耕地");
			map2.put("02", "园地");
			map2.put("03", "林地");
			map2.put("04", "草地");
			map2.put("05", "房屋建筑（区）");
			map2.put("06", "道路");
			map2.put("07", "构筑物");
			map2.put("08", "人工堆掘地");
			map2.put("09", "荒漠与裸露地表");
			map2.put("10", "水域");

			while (pRow != null) {
				if (pRow.getValue(1).equals("白鹤山乡")) {
					String typeNum = (String) pRow.getValue(2);
					String typeName = map2.get(typeNum.substring(0, 2));
					if (map.containsKey(typeName)) {
						double value = map.get(typeName);
						map.put(typeName, value + (Double) pRow.getValue(4));
					} else
						map.put(typeName, (Double) pRow.getValue(4));
				}
				pRow = pCursor.nextRow();
			}

			// 将统计结果组装成json返回
			JSONArray jsonArray = new JSONArray();
			JSONArray jsonArray2 = new JSONArray();
			for (Entry<String, Double> entry : map.entrySet()) {
				JSONObject jsonObject = new JSONObject();
				jsonArray.put(entry.getKey());
				jsonObject.put("value", entry.getValue());
				jsonObject.put("name", entry.getKey());
				jsonArray2.put(jsonObject);
			}
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("title", "土地利用类型面积占比");
			jsonObject.put("name", "面积比");
			jsonObject.put("data1", jsonArray);
			jsonObject.put("data2", jsonArray2);

			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");
			out = response.getWriter();
			out.write(jsonObject.toString());
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
				aoInit.shutdown();
			}
		}
	}
}
