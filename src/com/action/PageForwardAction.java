package com.action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 页面转发处理类
 * 
 * @author GISLab318
 *
 */
public class PageForwardAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	public String storage() {
		return "storage";
	}

	public String sync() {
		return "synch";
	}

	public String tran() {
		return "transmission";
	}

	public String safety() {
		return "safety";
	}
}
