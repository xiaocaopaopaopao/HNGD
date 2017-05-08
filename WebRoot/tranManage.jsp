<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<div class="sync-body">
	<div class="sync-content">
	   <div class="sync-header">
	      <h1 class="f1">传输管理</h1>
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
	      <div class="sync-nav" style="padding-top: 10px"> 
	         <ul>
	            <li>
	               <a class="manual-sync">传输设置</a>
	            </li>
	         </ul>
	      </div>
	      <div class="sync-mainbody" style="padding-top: 10px">
	         <div class="manual-sync-page">
	            <div class="togglebtn">
	               <p>数据分块设置</p>
	            </div>
	            <div class="creat-replica" style="wtext-align: center;width: 100%">
	               <table class="creat-replica-table" style="width: 70%;margin:auto;">
	                  <tr>
	                    <td>分块大小：</td>
	                    <td><input type="text" style="width: 300px;height:22px"> M</td>
	                  </tr>
	                  <tr>
	                    <td>临时目录：</td>
	                    <td><input type="text" style="width: 300px;height:22px">
	                    </td>
	                  </tr>
	               </table>
	               <div class="on_or_off">
	                    <input class="on" type="button" value="本节点执行 ">
	                    <input class="off" type="button" value="全局执行 ">
	                 </div>
	            </div>
	            <div class="togglebtn" style="margin-top: 20px">
	               <p>线程池设置</p>
	            </div>
	            <div class="creat-replica" style="wtext-align: center;width: 100%">
	               <table class="creat-replica-table" style="width:60%;margin:auto;">
	                  <tr>
	                    <td>核心线程数：</td>
	                    <td><input type="text" style="width: 200px;height:22px"></td>
	                  </tr>
	                   <tr>
	                    <td>最大线程数：</td>
	                    <td><input type="text" style="width: 200px;height:22px"></td>
	                  </tr>
	                   <tr>
	                    <td>线程空闲时间：</td>
	                    <td><input type="text" style="width: 200px;height:22px"></td>
	                  </tr>
	                  <tr>
	                    <td>是否允许核心线程空闲退出：</td>
	                    <td><input type="radio" value="是">是&nbsp;&nbsp;
	                    <input type="radio" value="否">否
	                    </td>
	                  </tr>
	                  <tr>
	                    <td>任务队列容量：</td>
	                    <td><input type="text" style="width: 200px;height:22px"></td>
	                  </tr>
	               </table>
	               <div class="on_or_off">
	                    <input class="on" type="button" value="本节点执行 ">
	                    <input class="off" type="button" value="全局执行">
	                 </div>
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