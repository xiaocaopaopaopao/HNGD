package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.esri.arcgis.geodatabase.IFeatureClass;
import com.esri.arcgis.geodatabase.IFeatureCursor;
import com.esri.arcgis.geodatabase.IField;
import com.esri.arcgis.geodatabase.IQueryFilter;
import com.esri.arcgis.geodatabase.IRow;
import com.esri.arcgis.geodatabase.QueryFilter;
import com.esri.arcgis.geodatabase.Workspace;
import com.esri.arcgis.system.AoInitialize;
import com.esri.arcgis.system.EngineInitializer;
import com.util.EngineUtils;
import com.util.StaticVar;

public class AreaStatisticsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String in_features_name = req.getParameter("in_features_name");
		String in_field = req.getParameter("in_field");

		PrintWriter out = null;
		AoInitialize aoInit = null;

		try {
			// 初始化engine应用
			EngineUtils engineUtils = new EngineUtils();
			EngineInitializer.initializeEngine();
			aoInit = new AoInitialize();
			engineUtils.initializeArcGISLicenses(aoInit);

			// 数据连接
			String inFGDB = StaticVar.intput_path;
			Workspace workspace = engineUtils.getFileGDBWorkspace(inFGDB
					.substring(0, inFGDB.length() - 1));
			IFeatureClass pFeatureClass = workspace
					.openFeatureClass(in_features_name);
			IQueryFilter queryFilter = new QueryFilter();
			IFeatureCursor pFeatureCursor = pFeatureClass.search(queryFilter,
					true);
			IRow pRow = pFeatureCursor.nextFeature();

			// 分类字段和面积字段的索引值
			IField area_field = pFeatureClass.getAreaField();
			int area_field_index = pRow.getFields().findField(
					area_field.getName());
			int in_field_index = pRow.getFields().findField(in_field);

			// 将同类型的面积值叠加放入Map
			Map<String, Double> map = new HashMap<String, Double>();
			while (pRow != null) {
				String type = (String) pRow.getValue(in_field_index);
				if (map.containsKey(type)) {
					double value = map.get(type);
					map.put(type,
							value + (Double) pRow.getValue(area_field_index));
				} else
					map.put(type, (Double) pRow.getValue(area_field_index));
				pRow = pFeatureCursor.nextFeature();
			}

			// 对统计数据排序
			List<Map.Entry<String, Double>> list = new ArrayList<Map.Entry<String, Double>>(
					map.entrySet());
			Collections.sort(list, new Comparator<Map.Entry<String, Double>>() {
				public int compare(Entry<String, Double> o1,
						Entry<String, Double> o2) {
					if (o1.getValue() == o2.getValue())
						return 0;
					return o1.getValue() < o2.getValue() ? -1 : 1;
				}
			});

			// 将统计结果组装成json返回
			JSONArray jsonArray = new JSONArray();
			JSONArray jsonArray2 = new JSONArray();
			for (Entry<String, Double> entry : list) {
				jsonArray.put(entry.getKey());
				jsonArray2.put(entry.getValue());
			}
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("title", "表面面积统计结果");
			jsonObject.put("name", "表面面积");
			jsonObject.put("data1", jsonArray);
			jsonObject.put("data2", jsonArray2);

			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json; charset=utf-8");
			out = resp.getWriter();
			out.write(jsonObject.toString());
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (out != null)
				out.close();
			if (aoInit != null)
				aoInit.shutdown();
		}
	}
}
