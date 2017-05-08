<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<div class="sync-body">
	<div class="sync-content">
	   <div class="sync-header">
	      <h1 class="f1">安全管理</h1>
	      <a class="backhome" href="/hn">返回首页</a>
	   </div>
	   <div class="sync-main">
	   
	      <div class="sync-nav"> 
	         <ul>
	            <li>
	               <a class="manual-sync">用户管理</a>
	            </li>
	            <li>
	               <a class="auto-sync">角色管理</a>
	            </li>
	            <li>
	               <a class="server-setting">用户审核</a>
	            </li>
	         </ul>
	      </div>
	      <div class="sync-mainbody">
	         <div class="manual-sync-page">
	            <div class="togglebtn">
	               <p>用户信息</p>
	            </div>
	            <div class="creat-replica" style="wtext-align: center;width: 100%">
	               <table class="creat-replica-table">
	                  <thead style="background-color: #ededed">
	                     <tr>
	                        <th>用户编号</th>
	                        <th>账号</th>
	                        <th>口令</th>
	                        <th>所属单位</th>
	                        <th>单位级别</th>
	                        <th>当前状态</th>
	                     </tr>
	                  </thead>
	                  <tr>
	                    <td>1001</td>
	                    <td>root</td>
	                    <td>******</td>
	                    <td>湖南省国土资源规划院</td>
	                    <td>一级</td>
	                    <td>
	                       <input class="on" type="button" value="编辑" style="margin: 0">
	                    </td>
	                  </tr>
	                   <tr>
	                    <td>1002</td>
	                    <td>csu</td>
	                    <td>******</td>
	                    <td>中南大学地理信息系</td>
	                    <td>一级</td>
	                    <td>
	                       <input class="on" type="button" value="编辑" style="margin: 0">
	                    </td>
	                  </tr>
	                   <tr>
	                    <td>1006</td>
	                    <td>changsha</td>
	                    <td>******</td>
	                    <td>长沙市国土局</td>
	                    <td>二级</td>
	                    <td>
	                       <input class="on" type="button" value="编辑" style="margin: 0">
	                    </td>
	                  </tr>
	               </table>
	            </div>
	             <div class="togglebtn" style="margin-top: 10px">
	               <p>用户权限</p>
	            </div>
	            <div style="margin-top: 10px;border: 1px solid #e4e4e4;
	                width: 100%;height: 35px;font-size: 14px;padding-top: 15px">
	               <div style="float: left;padding-left: 30px">
	                                        选择用户：<select style="width: 180px"><option>csu</option></select>
	               </div>
	               <div style="float: left;padding-left: 30px">
	                                       选择服务器节点：<select style="width: 180px"><option>192.168.2.112</option></select>
	               </div>
	            </div>
	             <div style="margin-top: 10px;width: 100%;height: 20px;font-size: 14px;">
	                <div style="float: left;padding-left: 10px">用户角色：</div>
	                <div style="float: left;padding-left: 340px">对应权限：</div>
	            </div>
	             <div style="border: 1px solid #c6c6c6;
	                width: 40%;height: 200px;font-size: 14px;float: left;">
	                 <table style="font-size: 14px;">
	                  <tr style="height: 25px">
	                    <td><input type="checkbox"></td>
	                    <td>db_accessasyncin</td>
	                  </tr>
	                   <tr style="height: 25px">
	                    <td><input type="checkbox"></td>
	                    <td>db_datareader</td>
	                  </tr>
	                    <tr style="height: 25px">
	                    <td><input type="checkbox"></td>
	                    <td>db_datareader</td>
	                  </tr>
	                    <tr style="height: 25px">
	                    <td><input type="checkbox"></td>
	                    <td>db_datawriter</td>
	                  </tr>
	                  <tr style="height: 25px">
	                    <td><input type="checkbox"></td>
	                    <td>db_securityasyncin</td>
	                  </tr>
	                   <tr style="height: 25px">
	                    <td><input type="checkbox"></td>
	                    <td>db_owner</td>
	                  </tr>
	               </table>
	            </div>
	            <div style="width: 7%;height: 200px;font-size: 14px;padding-top: 15px;float: left;padding-left: 7px">
	               <input class="on" type="button" value="添加" style="margin: 2px">
	               <input class="on" type="button" value="删除" style="margin: 2px">
	               <input class="on" type="button" value="保存" style="margin: 2px">
	            </div>
	            <div style="border: 1px solid #c6c6c6;
	                width: 45%;height: 200px;font-size: 12px;float: left;margin-left: 30px">
	                <table style="font-size: 12px">
	                  <tr style="height: 20px">
	                    <td><input type="checkbox"></td>
	                    <td>Alter</td>
	                  </tr>
	                   <tr style="height: 20px">
	                    <td><input type="checkbox"></td>
	                    <td>Control</td>
	                  </tr>
	                    <tr style="height: 20px">
	                    <td><input type="checkbox"></td>
	                    <td>Delete</td>
	                  </tr>
	                    <tr style="height: 20px">
	                    <td><input type="checkbox"></td>
	                    <td>Insert</td>
	                  </tr>
	                  <tr style="height: 20px">
	                    <td><input type="checkbox"></td>
	                    <td>References</td>
	                  </tr>
	                   <tr style="height: 20px">
	                    <td><input type="checkbox"></td>
	                    <td>Select</td>
	                  </tr>
	                   <tr style="height: 20px">
	                    <td><input type="checkbox"></td>
	                    <td>Update</td>
	                  </tr>
	                   <tr style="height: 20px">
	                    <td><input type="checkbox"></td>
	                    <td>View definition</td>
	                  </tr>
	               </table>
	            </div>
	            
	         </div>
	         <div class="server-setting-page" style="display: none;">
	            <div class="togglebtn">
	               <p>服务器关联</p>
	            </div>
	            <div class="server-level-header level1">
	               <h5>一级服务器</h5>
	               <a class="add-Server">添加</a>
	            </div>
	            <div class="server-level level1">
	               <table class="server-level-table">
	                  <thead>
	                     <tr>
	                        <th>数据库类型</th>
	                        <th>地址</th>
	                        <th>用户名</th>
	                        <th>密码</th>
	                        <th>数据库</th>
	                     </tr>
	                  </thead>
	                  <tbody></tbody>
	              </table>
	              <div class="save-or-cancel">
	                  <button class="save-server">保存</button>
	                  <button class="cancel-server">取消</button>
	              </div>
	            </div>
	            <div class="server-level-header level2">
	               <h5>二级服务器</h5>
	               <a class="add-Server">添加</a>
	            </div>
	            <div class="server-level level2">
	               <table class="server-level-table">
	                  <thead>
	                     <tr>
	                        <th>数据库类型</th>
	                        <th>地址</th>
	                        <th>用户名</th>
	                        <th>密码</th>
	                        <th>数据库</th>
	                        <th>所属上级数据库</th>
	                     </tr>
	                  </thead>
	                  <tbody></tbody>
	              </table>
	              <div class="save-or-cancel">
	                  <button class="save-server">保存</button>
	                  <button class="cancel-server">取消</button>
	              </div>
	            </div>
	            <div class="server-level-header level3">
	               <h5>三级服务器</h5>
	               <a class="add-Server">添加</a>
	            </div>
	            <div class="server-level level3">
	               <table class="server-level-table">
	                  <thead>
	                     <tr>
	                        <th>数据库类型</th>
	                        <th>地址</th>
	                        <th>用户名</th>
	                        <th>密码</th>
	                        <th>数据库</th>
	                        <th>所属上级数据库</th>
	                     </tr>
	                  </thead>
	                  <tbody></tbody>
	              </table>
	              <div class="save-or-cancel">
	                  <button class="save-server">保存</button>
	              </div>
	            </div>
	         </div>
	         <div class="auto-sync-page" style="display: none;">
	            <div class="togglebtn">
	               <p>同步设置</p>
	            </div>
	            <div class="server-level-header">
	               <h5 style="padding-left: 18px;">默认设置</h5>
	               <a class="edit-auto-sync" flag=true>编辑</a>
	            </div>
	            <div class="auto-sync-setting">
	               <table class="auto-sync-setting-table">
	                  <tr>
	                    <td>地理数据库1</td>
	                    <td style="width: 80%"></td>
	                  </tr>
	                  <tr>
	                    <td>复本</td>
	                    <td></td>
	                  </tr>
	                  <tr>
	                    <td>地理数据库2</td>
	                    <td></td>
	                  </tr>
	                  <tr>
	                    <td>同步方向</td>
	                    <td></td>
	                  </tr>
	                  <tr>
	                    <td>冲突解决方案</td>
	                    <td></td>
	                  </tr>
	                  <tr>
	                    <td>冲突定义</td>
	                    <td></td>
	                  </tr>
	                  <tr>
	                    <td>同步时间</td>
	                    <td></td>
	                  </tr>
	               </table>
	            </div>
	            <div class="on_or_off">
	                <input class="on" type="button" value="启动自动同步">
	                <input class="off" type="button" value="关闭自动同步">
	            </div>
	         </div>
	      </div>
	   </div>
	</div>
</div>

<link rel="stylesheet" href="css/sync.css" />
<script src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
   $(function(){
      var manual_sync = $(".manual-sync");
      var auto_sync = $(".auto-sync");
      var server_setting = $(".server-setting");
      var manual_sync_page = $(".manual-sync-page");
      var auto_sync_page = $(".auto-sync-page");
      var server_setting_page = $(".server-setting-page");
   
      manual_sync.click(function(){
         manual_sync.css("background","#134780");
         manual_sync.css("color","#fff");
         auto_sync.css("background","#fff");
         auto_sync.css("color","#909090");
         server_setting.css("background","#fff");
         server_setting.css("color","#909090");
         auto_sync_page.hide();
         server_setting_page.hide();
         manual_sync_page.show();
      });
      auto_sync.click(function(){
         manual_sync.css("background","#fff");
         manual_sync.css("color","#909090");
         auto_sync.css("background","#134780");
         auto_sync.css("color","#fff");
         server_setting.css("background","#fff");
         server_setting.css("color","#909090");
         server_setting_page.hide();
         manual_sync_page.hide();
         auto_sync_page.show();
         
         //请求同步更新配置数据
         $.get("/hn/readAutoSyncAction",function(data){
			var trs = $(".auto-sync-setting-table tr");
			trs.eq(0).find('td').eq(1).text(data.geodatabase1);
			trs.eq(1).find('td').eq(1).text(data.replica);
			trs.eq(2).find('td').eq(1).text(data.geodatabase2);
			trs.eq(3).find('td').eq(1).text(data.direction);
			trs.eq(4).find('td').eq(1).text(data.conflict_of_GDB1);
			trs.eq(5).find('td').eq(1).text(data.conflict_definition);
			trs.eq(6).find('td').eq(1).text(data.sync_time_interval);
         })
         
      });
      server_setting.click(function(){
         manual_sync.css("background","#fff");
         manual_sync.css("color","#909090");
         auto_sync.css("background","#fff");
         auto_sync.css("color","#909090");
         server_setting.css("background","#134780");
         server_setting.css("color","#fff");
         server_setting_page.show();
         manual_sync_page.hide();
         auto_sync_page.hide();
         
         //请求服务器配置数据
         $.get("/hn/readServerAction",function(data){
             var server_level1 = data.level1;
             var server_level2 = data.level2;
             var server_level3 = data.level3;
             $(".level1 tbody").html(builder(server_level1));
             $(".level2 tbody").html(builder(server_level2));
             $(".level3 tbody").html(builder(server_level3));
         },"json");
         
         function builder(servers){
             var txt;
             if(servers != null){
                 for(var i=0;i<servers.length;i++){
                 	var server = servers[i];
                 	txt += "<tr><td>"+server.type+"</td><td>"+server.address
                 		+"</td><td>"+server.username+"</td><td>"+server.password
                 		+"</td><td>"+server.database+"</td>";
                 	if(server.parentServer != null)
                 		txt += "<td>"+server.parentServer+"</td>";
                 	txt += "</tr>";
                 }
             }else
                 txt="<tr><td colspan="+6+">暂无数据</td></tr>";
             return txt;
         }
	 });
     
     /**
      * 添加服务器
      */
	 $(".level1 .add-server").click(function(){addServer("level1");});
	 $(".level2 .add-server").click(function(){addServer("level2");});
	 $(".level3 .add-server").click(function(){addServer("level3");});
	 
	 function addServer(level){
	 	$("."+level+" .save-or-cancel").show();
 		var tr_last = $("."+level+" tbody tr:last");
       	var td_size = tr_last.find("td").size();
       	if(td_size == 1)
 			tr_last.remove();
       	var txt = "<tr><td></td><td></td><td></td><td></td><td></td>";
       	if(level=="level1")
       		txt += "</tr>";
       	else
       		txt += "<td></td></tr>";
    	$("."+level+" tbody").append(txt);
    	$("."+level+" tbody tr:last td").each(function(){
     		$(this).html("<input type='text' style='width:90%; border:1px solid #fff'>");
		});
	 }
	 
	 /**
	  *保存服务器设置
	  */
	 $(".level1 .save-server").click(function(){saveServer("level1");});
	 $(".level2 .save-server").click(function(){saveServer("level2");});
	 $(".level3 .save-server").click(function(){saveServer("level3");});
	 
	 function saveServer(level){
	    //组装table中的新数据
	    var data ="{'level':"+level+",'data':["
	 	$("."+level+" tbody tr").each(function(){
 			var val = $(this).find("td").find("input").val();
 			if(isNull(val)){
 			   $(this).remove();
 			}else if(typeof val != "undefined"){
         	    data += "{"
         		$(this).find("td").each(function(){
         			$(this).html($(this).find("input").val());
         		}); 
         		tds = $(this).find("td");
         		data += "'type':'" + tds[0].innerHTML + "',";
         		data += "'address':'" + tds[1].innerHTML + "',";
         		data += "'username':'" + tds[2].innerHTML + "',";
         		data += "'password':'" + tds[3].innerHTML + "',";
         		data += "'database':'" + tds[4].innerHTML + "'";
         		if(level != "level1")
         			data += ",'parentServer':'" + tds[5].innerHTML + "'";
         		data += "},";
          	}
		})
		//判断是否有有效数据
		if(data.charAt(data.length -1 ) == ','){
			data = data.substring(0, data.length - 1);
			data += "]}";
			//发送新添加数据到后台
			$.get("/hn/saveServerAction",
				{"data":data},
				function(returnedData){
			})
		}
		
		//隐藏save-or-cancel栏
		$("."+level+" .save-or-cancel").hide();
	 }
	 
	 //判断输入字符串是否为空或者全部都是空格
	 function isNull(str){
		if ( str == "" ) return true;
		var regu = "^[ ]+$";
		var re = new RegExp(regu);
		return re.test(str);
	 }
	 
	 /**
	  * 取消输入服务器信息
	  */
	 $(".level1 .cancel-server").click(function(){cancelServer("level1")});
	 $(".level2 .cancel-server").click(function(){cancelServer("level2")});
	 $(".level3 .cancel-server").click(function(){cancelServer("level3")});
   	 
   	 function cancelServer(level){
   		$("."+level+" .save-or-cancel").hide();
   		$("."+level+" tbody tr").each(function(){
 			var val = $(this).find("td").find("input").val();
         	if(typeof val != "undefined"){
         	   $(this).remove();
         	}
         })
   	 }
   	 
   	 /**
	  * 编辑自动同步默认设置
	  */
   	 $(".edit-auto-sync").click(function(){
   	    if($(this).attr("flag")=="true"){
   	        $(this).attr("flag",false);
   	        $(this).text("保存");
  			$(".auto-sync-setting-table tr").each(function(){
     			var td = $(this).find("td").eq(1);
     			td.html("<input type='text' value='"
     				+td.text().trim()+"' style='width:90%; border:1px solid #fff'>");
			});
   	    }else{
   	   		$(this).attr("flag",true);
   	   		$(this).text("编辑");
   	   		var trs = $(".auto-sync-setting-table tr");
   	   		trs.each(function(){
     			var td = $(this).find("td").eq(1);
     			td.html(td.find("input").val());
			});
			//组装json数据
			var data ="{";
			data += "'geodatabase1':" + "'" + trs.eq(0).find("td").eq(1).text().trim()+"',";
			data += "'replica':" + "'" + trs.eq(1).find("td").eq(1).text().trim()+"',";
			data += "'geodatabase2':" + "'" + trs.eq(2).find("td").eq(1).text().trim()+"',";
			data += "'direction':" + "'" + trs.eq(3).find("td").eq(1).text().trim()+"',";
			data += "'conflict_of_GDB1':" + "'" + trs.eq(4).find("td").eq(1).text().trim()+"',";
			data += "'conflict_definition':" + "'" + trs.eq(5).find("td").eq(1).text().trim()+"',";
			data += "'sync_time_interval':" + "'" + trs.eq(6).find("td").eq(1).text().trim()+"'}";
			data = data.replace(/\\/g, "/");
			//发送数据到后台
			$.get("/hn/saveAutoSyncAction",
				{"data":data},
				function(returnedData){
			})
   	    }
   	 })
   	 
   })
</script>