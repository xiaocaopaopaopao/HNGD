/**
 * 侧栏展开/隐藏
 */
function mapSpread() {
	var sideBarWidth = $("#sidebar").width();
	if (sideBarWidth > 0) {
		$("#sidebar").css("width", "0");
		$("#content").css("width", "99.9%");
		$(this).css("background",
				"url('images/arrow_right.png') no-repeat center");
	} else {
		$("#sidebar").css("width", "20%");
		$("#content").css("width", "79.9%");
		$(this).css("background",
				"url('images/arrow_left.png') no-repeat center");
	}
}

function arrorDown(){
	$(".allleft_mid").css("height","93%");
	$(".allleft_buttom").hide();
}

/**
 * 树形菜单双击事件
 */
function treeDoubleClick(toolName) {
	$(".allleft_mid").css("height","33%");
	$(".allleft_buttom").css("height","60%");
	$(".allleft_buttom").show();
	
	if (toolName == "缓冲区分析") {
		$("#statistics").hide();
		$("#areaStatistics").hide();
		$("#buffer").show();
		$("#buffer select").empty();
		var layerInfos = baseMapLayer.layerInfos;
		for (var j = 0; j < layerInfos.length; j++) {
			var option = document.createElement("option");
			option.setAttribute("value", j);
			option.innerHTML = layerInfos[j].name;
			$("#buffer select").append(option);
		}
	}else if(toolName == "表面积占比"){
		$("#buffer").hide();
		$("#areaStatistics").hide()
		$("#statistics").show();
		$("#statistics select").empty();
		var layerInfos = baseMapLayer.layerInfos;
		for (var j = 0; j < layerInfos.length; j++) {
			var option = document.createElement("option");
			option.setAttribute("value", j);
			option.innerHTML = layerInfos[j].name;
			$("#statistics select.in_features").append(option);
		}
	}else if(toolName == "表面面积"){
		$("#buffer").hide();
		$("#statistics").hide();
		$("#areaStatistics").show();
		$("#areaStatistics select").empty();
		var layerInfos = baseMapLayer.layerInfos;
		for (var j = 0; j < layerInfos.length; j++) {
			var option = document.createElement("option");
			option.setAttribute("value", j);
			option.innerHTML = layerInfos[j].name;
			$("#areaStatistics select.in_features").append(option);
		}
	}
}

function doAreaRatioStatistics(){
	$.get("TestServlet",{},function(data,status){
		var echart = $("#echart");
		echart.show();
		var myChart = echarts.init(echart.get(0));
		myChart.setOption({
			title : {
				text : data.title,
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				left : 'left',
				data : data.data1
			},
			series : [ {
				name : data.name,
				type : 'pie',
				radius : '55%',
				center : [ '60%', '60%' ],
				data : data.data2,
				itemStyle : {
					emphasis : {
						shadowBlur : 10,
						shadowOffsetX : 0,
						shadowColor : 'rgba(0, 0, 0, 0.5)'
					}
				}
			} ]
		});
	},"json");
}

function doAreaStatistics(){
	var in_features_name = $("#areaStatistics select.in_features option:selected").text();
	var in_field = $("#areaStatistics select.in_fields option:selected").text();
	var area_field = $("#areaStatistics select.area_fields option:selected").text();
	$.get("AreaStatisticsServlet",{
		"in_features_name":in_features_name,
		"in_field":in_field,
		"area_field":area_field
	},function(data,status){
		var echart = $("#echart"); //绘制图表的div
		echart.show();
		var myChart = echarts.init(echart.get(0));
		myChart.setOption({
			title : {
				text : data.title,
				x : 'center'
			},
			color : [ '#3398DB' ],
			tooltip : {
				trigger : 'axis',
				axisPointer : { // 坐标轴指示器，坐标轴触发有效
					type : 'shadow' // 默认为直线，可选为：'line' |
				}
			},
			grid : {
				left : '3%',
				right : '3%',
				bottom : '3%',
				containLabel : true
			},
			xAxis : [ {
				type : 'value'
			} ],
			yAxis : [ {
				type : 'category',
				data : data.data1,
				axisTick : {
					alignWithLabel : true
				}
			}],
			series : [ {
				name : data.name,
				type : 'bar',
				barWidth : '60%',
				data : data.data2
			} ]
		});
	},"json");
}

function selectChange(){
	var index = $("#areaStatistics select.in_features").val();
	var select = $("#areaStatistics select.in_fields");
	var url = "http://192.168.2.110:6080/arcgis/rest/services/wuling/MapServer/"+index+"?f=pjson";
	select.empty();
	setFieldInSelect(select,url);
}

function setFieldInSelect(select,url){
	$.get(url,function(data,status){
		var fields = data.fields;
		for(var i=0;i<fields.length;i++){
			var option = document.createElement("option");
			option.setAttribute("value", i);
			option.innerHTML = fields[i].name;
			select.append(option);
		}
	},"json");
}
