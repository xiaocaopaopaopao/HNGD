package com.util;

import com.esri.arcgis.datasourcesGDB.FileGDBWorkspaceFactory;
import com.esri.arcgis.datasourcesfile.ShapefileWorkspaceFactory;
import com.esri.arcgis.geodatabase.IWorkspaceFactory;
import com.esri.arcgis.geodatabase.Workspace;
import com.esri.arcgis.system.AoInitialize;
import com.esri.arcgis.system.esriLicenseProductCode;
import com.esri.arcgis.system.esriLicenseStatus;

public class EngineUtils {

	/***
	 * ��ʼ��ArcGIS���
	 * 
	 * @param aoInit
	 */
	public void initializeArcGISLicenses(AoInitialize aoInit) {
		try {
			if (aoInit
					.isProductCodeAvailable(esriLicenseProductCode.esriLicenseProductCodeEngine) == esriLicenseStatus.esriLicenseAvailable)
				aoInit.initialize(esriLicenseProductCode.esriLicenseProductCodeEngine);
			else if (aoInit
					.isProductCodeAvailable(esriLicenseProductCode.esriLicenseProductCodeBasic) == esriLicenseStatus.esriLicenseAvailable)
				aoInit.initialize(esriLicenseProductCode.esriLicenseProductCodeBasic);
			else
				System.exit(-1);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/***
	 * ���FileGDB�Ĺ����ռ�
	 * 
	 * @param inFGDB
	 * @return
	 */
	public Workspace getFileGDBWorkspace(String inFGDB) {
		FileGDBWorkspaceFactory factory = null;
		Workspace workspace = null;
		try {
			factory = new FileGDBWorkspaceFactory();
			workspace = new Workspace(factory.openFromFile(inFGDB, 0));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return workspace;
	}

	/**
	 * ���ShapeFile�Ĺ����ռ�
	 * 
	 * @param inShp
	 * @return
	 */
	public Workspace getShapeFileWorkspace(String inShp) {
		IWorkspaceFactory pWorkspaceFactory = null;
		Workspace workspace = null;
		try {
			pWorkspaceFactory = new ShapefileWorkspaceFactory();
			workspace = (Workspace) pWorkspaceFactory.openFromFile(inShp, 0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return workspace;
	}
}
