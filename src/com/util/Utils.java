package com.util;

import java.io.File;

public class Utils {

	/***
	 * Çå¿ÕÎÄ¼þ¼Ð
	 * 
	 * @param path
	 * @return
	 */
	public boolean clearDir(String path) {
		try {
			File file = new File(path);
			if (file.isDirectory()) {
				if (file.isDirectory()) {
					String[] filelist = file.list();
					for (int i = 0; i < filelist.length; i++) {
						File delfile = new File(path + "\\" + filelist[i]);
						if (!delfile.isDirectory())
							delfile.delete();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
}
