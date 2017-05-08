package com.util;

import com.esri.arcgis.geodatabase.ICursor;
import com.esri.arcgis.geodatabase.IQueryFilter;
import com.esri.arcgis.geodatabase.IRow;
import com.esri.arcgis.geodatabase.ITable;
import com.esri.arcgis.geodatabase.QueryFilter;
import com.esri.arcgis.geodatabase.Workspace;
import com.esri.arcgis.system.AoInitialize;
import com.esri.arcgis.system.EngineInitializer;

public class Test {
	public static void main(String[] args) {
		try {
			// 初始化engine应用
			EngineUtils engineUtils = new EngineUtils();
			EngineInitializer.initializeEngine();
			AoInitialize aoInit = new AoInitialize();
			engineUtils.initializeArcGISLicenses(aoInit);

			// 数据连接
			String inFGDB = StaticVar.output_path2;
			Workspace workspace = engineUtils.getFileGDBWorkspace(inFGDB
					.substring(0, inFGDB.length() - 1));
			ITable table = workspace.openTable("stats");
			IQueryFilter queryFilter = new QueryFilter();
			ICursor pCursor = table.ITable_search(queryFilter, true);
			IRow pRow = pCursor.nextRow();
			while (pRow != null) {
				System.out.println(pRow.getValue(4));
				pRow = pCursor.nextRow();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
