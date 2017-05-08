package com.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.json.JSONArray;
import org.json.JSONObject;

import com.util.StaticVar;

public class SettingDao {

	public void creatSettingXml() {

	}

	/***
	 * 读取服务器配置信息
	 * 
	 * @return json数据
	 */
	@SuppressWarnings("unchecked")
	public String readServer() {
		String message = null;
		try {
			File file = new File(StaticVar.setting_path);
			SAXReader reader = new SAXReader();
			Document doc = reader.read(file);
			Element root = doc.getRootElement();
			JSONObject jsonObject = new JSONObject();
			for (int i = 1; i <= 3; i++) {
				Element servers_level = root.element("servers").element(
						"level" + i);
				if (servers_level != null) {
					List<Element> servers = servers_level.elements();
					JSONArray jsonArray = new JSONArray();
					for (Element server : servers) {
						List<Element> list = server.elements();
						JSONObject jsonObject2 = new JSONObject();
						for (Element e : list) {
							jsonObject2.put(e.getName(), e.getText());
						}
						jsonArray.put(jsonObject2);
					}
					jsonObject.put("level" + i, jsonArray);
				}
			}
			message = jsonObject.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}

	/***
	 * 保存服务器配置信息
	 * 
	 * @param data
	 *            json数据
	 */
	public void saveServer(String data) {
		JSONObject jsonObject = new JSONObject(data);
		String level = (String) jsonObject.get("level");
		JSONArray jsonArray = jsonObject.getJSONArray("data");

		try {
			File file = new File(StaticVar.setting_path);
			SAXReader reader = new SAXReader();
			Document doc = reader.read(file);
			Element root = doc.getRootElement();
			Element servers_level = root.element("servers").element(level);
			if (servers_level == null)
				servers_level = root.element("servers").addElement(level);
			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject jsonObject2 = (JSONObject) jsonArray.get(i);
				Element server = servers_level.addElement("server");
				for (String str : jsonObject2.keySet()) {
					server.addElement(str).setText(
							(String) jsonObject2.get(str));
				}
			}
			OutputFormat opf = new OutputFormat("\t", true, "UTF-8");
			opf.setTrimText(true);
			XMLWriter writer = new XMLWriter(new FileOutputStream(file), opf);
			writer.write(doc);
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/***
	 * 读取自动同步默认设置
	 * 
	 * @return json数据
	 */
	@SuppressWarnings("unchecked")
	public String readAutoSync() {
		String message = null;
		try {
			File file = new File(StaticVar.setting_path);
			SAXReader reader = new SAXReader();
			Document doc = reader.read(file);
			Element targetElement = doc.getRootElement().element(
					"auto-sync-setting");
			if (targetElement != null) {
				JSONObject jsonObject = new JSONObject();
				List<Element> settings = targetElement.elements();
				for (Element e : settings) {
					jsonObject.put(e.getName(), e.getText());
				}
				message = jsonObject.toString();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}

	public void saveAutoSync(String data) {
		JSONObject jsonObject = new JSONObject(data);
		try {
			File file = new File(StaticVar.setting_path);
			SAXReader reader = new SAXReader();
			Document doc = reader.read(file);
			Element root = doc.getRootElement();
			Element auto_sync_setting = root.element("auto-sync-setting");
			if (auto_sync_setting == null)
				auto_sync_setting = root.addElement("auto-sync-setting");
			for (String str : jsonObject.keySet()) {
				Element e = auto_sync_setting.element(str);
				if (e == null)
					auto_sync_setting.addElement(str);
				e.setText((String) jsonObject.get(str));
			}
			OutputFormat opf = new OutputFormat("\t", true, "UTF-8");
			opf.setTrimText(true);
			XMLWriter writer = new XMLWriter(new FileOutputStream(file), opf);
			writer.write(doc);
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
