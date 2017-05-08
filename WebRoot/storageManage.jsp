<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<div class="sync-body">
	<div class="sync-content">
	   <div class="sync-header">
	      <h1 class="f1">存储管理</h1>
	      <a class="backhome" href="/hn">返回首页</a>
	   </div>
	   <div class="sync-main" style="padding-top: 10px;">
	      <div style="width: 100%;height: 40px;
	        background-color: #ededed;padding-top: 10px;"> 
	         <a style="padding-left: 50px;padding-right: 50px">当前数据库：dbase</a>
	         <a style="padding-right: 50px">服务器地址：192.168.2.112</a>
	         <a style="padding-right: 50px">节点级别：三级</a>
	         <button style="height: 32px;border-style: inherit;background: #134780;color: #fff;">选择数据库</button>
	         <button style="height: 32px;border-style: inherit;background: #134780;color: #fff;">数据库列表</button>
	      </div>
	      <div style="width: 100%;height: 510px;margin-top: 20px">
	         <div style="border: 1px #a0a0a0 solid;width:285px;height: 510px;float: left;font-size:12px">
	            <ul id="browser1" class="filetree">
			        <li><span class="folder">192.168.2.112</span>
			         <ul>
			       <li><span class="folder">dbase.DBO.dataSet</span>
			           <ul>
			              <li><span class="file">dbase.DBO.BERA1</span></li>
			              <li><span class="file">dbase.DBO.BERA2</span></li>
			              <li><span class="file">dbase.DBO.BERA3</span></li>
			              <li><span class="file">dbase.DBO.BERA4</span></li>
			              <li><span class="file">dbase.DBO.BERA5</span></li>
			              <li><span class="file">dbase.DBO.BERA6</span></li>
			              <li><span class="file">dbase.DBO.BERA7</span></li>
			              <li><span class="file">dbase.DBO.BERP3</span></li>
			              <li><span class="file">dbase.DBO.BERP6</span></li>
			              <li><span class="file">dbase.DBO.BGLA</span></li>
			              <li><span class="file">dbase.DBO.BGMA</span></li>
			              <li><span class="file">dbase.DBO.BGTA</span></li>
			              <li><span class="file">dbase.DBO.BGWA</span></li>
			              <li><span class="file">dbase.DBO.BOUA1</span></li>
			              <li><span class="file">dbase.DBO.BOUA2</span></li>
			              <li><span class="file">dbase.DBO.BOUA3</span></li>
			              <li><span class="file">dbase.DBO.BOUA4</span></li>
			              <li><span class="file">dbase.DBO.BOUA5</span></li>
			           </ul>
			       </li>
			       <li class="closed"><span class="folder">dbase.DBO.XIANGTANG</span>
			       </li>
			      </ul>
			     </li>
			    </ul>
	         </div>
	         <div style="border: 1px #a0a0a0 solid;width:700px;height: 510px;float: left;margin-left: 10px">
	        
	       
	         </div>
	      </div>
	   </div>
	</div>
</div>

<link rel="stylesheet" href="css/sync.css" />
<script src="js/jquery-1.9.1.min.js"></script>
 <link rel="stylesheet" href="css/jquery.treeview.css" />
   <link rel="stylesheet" href="css/screen.css" />
   <script src="js/jquery.cookie.js"></script>
   <script src="js/jquery.treeview.js" type="text/javascript"></script>
   <script src="js/jquery.treeview.edit.js" type="text/javascript"></script>
<script type="text/javascript">
      $(function() {
        //初始化树形菜单
		$("#browser1").treeview();
		$("span.file").dblclick(function(){
		    treeDoubleClick($(this).text());
		});
	})
</script>