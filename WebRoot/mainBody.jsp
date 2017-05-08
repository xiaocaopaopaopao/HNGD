<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<head>
  <link rel="stylesheet" href="http://jsapi.thinkgis.cn/esri/css/esri.css">
   <link rel="stylesheet" href="css/sidebar.css">
   <link rel="stylesheet" href="css/content.css">
   <script src="js/echarts.js"></script>
   <script src="http://jsapi.thinkgis.cn/init.js"></script>
   <script src="js/jquery-1.9.1.min.js"></script>
   <script src="js/dojo.js"></script>
   <script type="text/javascript" src="js/map.js"></script>
   <script type="text/javascript" src="js/util.js"></script>
   
   <link rel="stylesheet" href="css/jquery.treeview.css" />
   <link rel="stylesheet" href="css/screen.css" />
   <script src="js/jquery.cookie.js"></script>
   <script src="js/jquery.treeview.js" type="text/javascript"></script>
   <script src="js/jquery.treeview.edit.js" type="text/javascript"></script>
   <script type="text/javascript">
      $(function() {
        //初始化树形菜单
		$("#browser").treeview();
		$("span.file").dblclick(function(){
		    treeDoubleClick($(this).text());
		});
	})
   </script>
</head>

<div id="sidebar" class="allleft">
  <div class="allleft_top">GIS分析工具</div>
  <div class="allleft_mid">
      <ul id="browser" class="filetree">
        <li><span class="folder">常用工具</span>
         <ul>
       <li><span class="folder">分析工具</span>
           <ul>
              <li><span class="file">剪切</span></li>
              <li><span class="file">叠加</span></li>
              <li><span class="file">总计统计</span></li>
              <li><span class="file">缓冲区分析</span></li>
              <li><span class="file">叠加分析</span></li>
              <li><span class="file">泰森近似多边形</span></li>
              <li><span class="file">插值</span></li>
              <li><span class="file">统计表</span></li>
              <li><span class="file">总计统计</span></li>
           </ul>
       </li>
       <li class="closed"><span class="folder">转换工具</span>
           <ul>
              <li><span class="file">到栅格</span></li>
              <li><span class="file">到Shapefile</span></li>
              <li><span class="file">导出数据</span></li>
           </ul>
       </li>
       <li class="closed"><span class="folder">空间分析工具</span>
           <ul>
              <li><span class="file">密度</span></li>
              <li><span class="file">距离</span></li>
              <li><span class="file">聚合</span></li>
           </ul>
       </li>
      </ul>
     </li>
     <li class="closed"><span class="folder">地理国情基本统计分析</span>
      <ul>
       <li><span class="file">表面面积</span></li>
       <li><span class="file">表面积占比</span></li>
      </ul>
     </li>
     <li class="closed"><span class="folder">地理国情分类统计分析</span>
      <ul>
       <li><span class="file">待定 2.1</span></li>
       <li><span class="file">待定 2.2</span></li>
      </ul>
     </li>
     <li class="closed"><span class="folder">地理国情综合统计分析</span>
      <ul>
       <li><span class="file">待定 2.1</span></li>
       <li><span class="file">待定 2.2</span></li>
      </ul>
     </li>
     <li class="closed"><span class="folder">地理国情专题统计分析</span>
      <ul>
       <li><span class="file">待定 2.1</span></li>
       <li><span class="file">待定 2.2</span></li>
      </ul>
     </li>
     <li class="closed"><span class="folder">地理国情指数统计分析</span>
      <ul>
       <li><span class="file">待定 2.1</span></li>
       <li><span class="file">待定 2.2</span></li>
      </ul>
     </li>
    </ul>
  </div>
  <div class="allleft_top">
      <div class="top_title">参数设置</div> 
      <div class="arrow_down" onclick="arrorDown()"></div>
  </div>
  <div class="allleft_buttom" style="overflow: auto;display: none">
       <div class="paramSetting">
           <div id="buffer" style="display: none">
                                 输入要素：<br><select class ="in_features"></select><br>
              <br>缓冲距离(单位：m)：<br><input id="distance" type="text"><br>
              <input class="doJob" type="button" value="执行任务" onclick="doBuffer()"/>
           </div>
           <div id="areaStatistics" style="display: none">
                                 统计图层：<br><select class ="in_features" onchange="selectChange()"></select><br>
              <br>分字段统计(可选)：<select class ="in_fields"></select><br>
              <input class="doJob" type="button" value="执行任务" onclick="doAreaStatistics()"/>
           </div>
           <div id="statistics" style="display: none">
                                 统计图层：<br><select class ="in_features"></select><br>
              <br> 统计范围：<br><select class ="in_features"></select><br>
              <br>选择字段：<select class ="in_fields"></select><br>
              <div>字段1 字段2 字段3</div>
              <input class="doJob" type="button" value="执行任务" onclick="doAreaRatioStatistics()"/>
           </div>
       </div>
   </div>
</div>
<div id="content" class="allright">
   <div class="allright_top">
      <div id="clear" onclick="clearLayer()">清除</div>
      <div id="handleMessage" style="display: none">正在处理，请稍后...</div>
   </div>
   <div id="mapSpread" onclick="mapSpread()"></div>
   <div id="map">
       <div id="echart"></div>
   </div>
</div>