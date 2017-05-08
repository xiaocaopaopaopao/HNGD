package com.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.esri.arcgis.geodatabase.Field;
import com.esri.arcgis.geodatabase.ICursor;
import com.esri.arcgis.geodatabase.IFeature;
import com.esri.arcgis.geodatabase.IFeatureClass;
import com.esri.arcgis.geodatabase.IFeatureCursor;
import com.esri.arcgis.geodatabase.IFieldEdit2;
import com.esri.arcgis.geodatabase.IQueryFilter;
import com.esri.arcgis.geodatabase.IRow;
import com.esri.arcgis.geodatabase.ITable;
import com.esri.arcgis.geodatabase.QueryFilter;
import com.esri.arcgis.geodatabase.Workspace;
import com.esri.arcgis.geodatabase.esriFieldType;
import com.esri.arcgis.system.AoInitialize;
import com.esri.arcgis.system.EngineInitializer;
import com.util.EngineUtils;
import com.util.StaticVar;

public class AreaRatioStatisticsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// String in_features = "['BOUA6','LCA']";
		// String in_field = "['NAME','CC_1']";
		// String range_features = req.getParameter("range_features");
		// String distance = req.getParameter("distance");
		// String tool = req.getParameter("tool");
		// Utils utils = new Utils();

		// // ��װִ��python�ű�����
		// String cmd = "python " + StaticVar.python_path + tool + " "
		// + StaticVar.intput_path + " " + in_features + " " + in_field
		// + " " + StaticVar.output_path + " " + StaticVar.output_path2;
		// PrintWriter out = resp.getWriter();
		System.out.println("start");
		try {
			// �������ļ���
			// utils.clearDir(StaticVar.output_path);
			// System.out.println(cmd);
			// Process pr = Runtime.getRuntime().exec(cmd);
			// BufferedReader in = new BufferedReader(new InputStreamReader(
			// pr.getInputStream()));
			// String line = null;
			// while ((line = in.readLine()) != null) {
			// // ��ȡͳ�Ʊ�
			// if (line.equals("success")) {
			// ��ʼ��engineӦ��
			EngineUtils engineUtils = new EngineUtils();
			EngineInitializer.initializeEngine();
			AoInitialize aoInit = new AoInitialize();
			engineUtils.initializeArcGISLicenses(aoInit);

			// ��ShapeFile���ݹ����ռ�
			String inShp = StaticVar.output_path;
			Workspace workspaceShp = engineUtils.getShapeFileWorkspace(inShp
					.substring(0, inShp.length() - 1));

			// ���ļ����ݿ⹤���ռ�
			String inFGDB = StaticVar.output_path2;
			Workspace workspaceFGDB = engineUtils.getFileGDBWorkspace(inFGDB
					.substring(0, inFGDB.length() - 1));

			// ͳ����Ϣ�ܱ�
			Map<String, Map<String, Double>> map = new HashMap<String, Map<String, Double>>();

			// ��������������Ϣ��Ӧ��
			Map<String, String> map2 = new HashMap<String, String>();
			map2.put("01", "����");
			map2.put("02", "԰��");
			map2.put("03", "�ֵ�");
			map2.put("04", "�ݵ�");
			map2.put("05", "���ݽ���������");
			map2.put("06", "��·");
			map2.put("07", "������");
			map2.put("08", "�˹��Ѿ��");
			map2.put("09", "��Į����¶�ر�");
			map2.put("10", "ˮ��");

			// ��ȡ����
			ITable mtable = workspaceFGDB.openTable("stats");
			IQueryFilter mQueryFilter = new QueryFilter();
			ICursor mCursor = mtable.ITable_search(mQueryFilter, true);
			IRow mRow = mCursor.nextRow();
			while (mRow != null) {
				String key = (String) mRow.getValue(1);
				String typeNum = (String) mRow.getValue(2);
				String typeName = map2.get(typeNum.substring(0, 2));
				if (map.containsKey(key)) {
					Map<String, Double> subMap = map.get(key);
					if (subMap.containsKey(typeName)) {
						double value = subMap.get(typeName);
						subMap.put(typeName, value + (Double) mRow.getValue(4));
					} else
						subMap.put(typeName, (Double) mRow.getValue(4));
				} else {
					Map<String, Double> subMap = new HashMap<String, Double>();
					subMap.put(typeName, (Double) mRow.getValue(4));
					map.put(key, subMap);
				}
				mRow = mCursor.nextRow();
			}
			System.out.println(map.toString());

			// �½��ֶ�
			IFeatureClass toFeatureClass = workspaceShp
					.openFeatureClass("BOUA6.shp");
			for (String fieldName : map2.values()) {
				IFieldEdit2 pFieldEdit = new Field();
				pFieldEdit.setName(fieldName);
				pFieldEdit.setType(esriFieldType.esriFieldTypeDouble);
				toFeatureClass.addField(pFieldEdit);
			}

			// ��������
			IQueryFilter pQueryFilter = new QueryFilter();
			IFeatureCursor pFeatureCursor = toFeatureClass.search(pQueryFilter,
					true);
			IFeature pFeature = pFeatureCursor.nextFeature();
			for (Map.Entry<String, Map<String, Double>> entry : map.entrySet()) {
				String key = entry.getKey();
				Map<String, Double> subMap = entry.getValue();
				while (pFeature != null) {
					if (pFeature.getValue(
							pFeature.getFields().findField("NAME")).equals(key)) {
						for (Map.Entry<String, Double> subEntry : subMap
								.entrySet()) {
							String subKey = subEntry.getKey();
							double subValue = subEntry.getValue();
							pFeature.setValue(
									pFeature.getFields().findField(subKey),
									subValue);
						}
						pFeature.store();
						pFeatureCursor = toFeatureClass.search(pQueryFilter,
								true);
						pFeature = pFeatureCursor.nextFeature();
						break;
					}
					pFeature = pFeatureCursor.nextFeature();
				}
			}
			workspaceShp.release();
			workspaceFGDB.release();
			aoInit.shutdown();
			System.out.println("end");
		} catch (Exception e) {
			e.printStackTrace();
			// out.write(StaticVar.fail);
		} finally {
			// out.close();

		}
	}
}
