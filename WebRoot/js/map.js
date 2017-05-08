var map;
var baseMapLayer;
var tmepLayer;

require(["esri/map",
         "esri/layers/ArcGISDynamicMapServiceLayer"], function (
        		 Map,ArcGISDynamicMapServiceLayer) {
	map = new Map("map", {
		center : [ -111.718, 29.074 ],
		zoom : 13
	});
	baseMapLayer = new ArcGISDynamicMapServiceLayer(
			"http://192.168.2.110:6080/arcgis/rest/services/wuling/MapServer");
	map.addLayer(baseMapLayer);
});

function doBuffer(){
	require(["esri/layers/FeatureLayer",
	         "esri/layers/TableDataSource",
	         "esri/layers/LayerDataSource",
	         "esri/renderers/SimpleRenderer",
	         "esri/symbols/SimpleFillSymbol",
	         "esri/symbols/SimpleLineSymbol"],function(FeatureLayer,
	        		 TableDataSource,LayerDataSource,SimpleRenderer,
	        		 SimpleFillSymbol,SimpleLineSymbol){
		var in_features_name = $("#buffer select option:selected").text();
		var distance = $("#distance").val();
		$("#buffer input.doJob").attr("disabled", true);
	    $("#handleMessage").show();
		$.get("bufferServlet",
			{"in_features_name":in_features_name,
			"distance":distance,
			"tool":"buffer.py"},
			function(result,status){
				if(result == "success"){
					//定义一个数据源
				    var dataSource = new TableDataSource();
				    dataSource.workspaceId = "output";
				    dataSource.dataSourceName = in_features_name + "_buffer.shp";
				    var layerSource = new LayerDataSource();
				    layerSource.dataSource = dataSource;
				    //定义一个要素图层
				    tmepLayer = new FeatureLayer("http://192.168.2.110:6080/arcgis/rest/services/wuling/MapServer/dynamicLayer", {
				        mode:FeatureLayer.MODE_ONDEMAND,
				        outFields: ["*"],
				        source: layerSource
				    });
				    //定义线符号
				    var fillSymbol = new SimpleFillSymbol(SimpleFillSymbol.STYLE_SOLID,
				    	    new SimpleLineSymbol(SimpleLineSymbol.STYLE_DASHDOT,
				    	    	    new dojo.Color([255,0,0]), 2),new dojo.Color([255,255,0,0.25]));
				    //定义渲染器
				    var renderer = new SimpleRenderer(fillSymbol);
				    tmepLayer.setRenderer(renderer);
				    tmepLayer.refresh();
				    map.addLayer(tmepLayer);
				}
				$("#buffer input.doJob").removeAttr("disabled");
			    $("#handleMessage").hide();
			});
	});
}

function doStatistics(){
	require(["esri/layers/FeatureLayer",
	         "esri/layers/TableDataSource",
	         "esri/layers/LayerDataSource",
	         "esri/renderers/SimpleRenderer",
	         "esri/symbols/SimpleFillSymbol",
	         "esri/symbols/SimpleLineSymbol"],function(FeatureLayer,
	        		 TableDataSource,LayerDataSource,SimpleRenderer,
	        		 SimpleFillSymbol,SimpleLineSymbol){
		$("#buffer input.doJob").attr("disabled", true);
	    $("#handleMessage").show();
	    $.get("StatisticsServlet",
				{"tool":"statistics.py"},
				function(result,status){
					alert(result);
		    });
	});
}

//function goBuffer2(){
//	require(["esri/layers/FeatureLayer",
//	         "esri/tasks/Geoprocessor",
//	         "esri/tasks/FeatureSet",
//	         "esri/tasks/LinearUnit",
//	         "esri/layers/layer"],function(FeatureLayer,
//	        		 Geoprocessor,FeatureSet,LinearUnit,Layer){
//		var gp;
//	    var layerIndex = $("#input_featureclass option:selected").val();
//	    var distance = $("#distance").val();
//	    var featureLayer = new FeatureLayer(
//	    		"http://192.168.2.110:6080/arcgis/rest/services/sample/MapServer/"+layerIndex,{
//	    		mode: FeatureLayer.MODE_ONDEMAND,
//	    		outFields: ["*"]
//	    });
//	    featureLayer.on("load",function(){
//	    	console.log("11111111");
//	    	gp = new Geoprocessor("http://192.168.2.110:6080/arcgis/"
//		    		+ "rest/services/MyBuffer/GPServer/MyBuffer");
//		    gp.setOutputSpatialReference(map.spatialReference);
//		    //构造输入要素集
//			var graphics = featureLayer.graphics;
//		    var featureset = new FeatureSet();
//		    featureset.features = graphics;
//		    //构造缓冲长度
//		    var Dis = new LinearUnit();
//		    Dis.distance = distance;
//		    Dis.units = esri.Units.METERS;
//		    var parms = {
//		        Input_Features  : featureset,
//		        Distance__value_or_field_ : Dis
//		    };
//		    //提交异步执行
//		    gp.submitJob(parms, getJobResult);
//	    });
//	});
//}
//
//function getJobResult(result) {
//	require["esri.tasks.JobInfo"],function(JobInfo){
//		var jobId = result.jobId;
//        var jobStatus = result.jobStatus;
//        if(jobStatus == JobInfo.STATUS_SUCCEEDED) {
//        	//成功之后，将其中的结果取出来
//        	gp.getResultData(jobId, output, addResults2Map);
//        }else{
//	        alert("提示,计算失败！");
//	    }
//    }
//}
//
//function addResults2Map(results){
//	require["esri.symbol.SimpleFillSymbol",
//	        "esri.symbol.SimpleLineSymbol"],function(SimpleFillSymbol,SimpleLineSymbol){
//		var features = results.value.features;
//	    if(features.length>0) {
//	        for (var i = 0; i<features.length; i++) {
//	            var feature = features[i];
//	            var fillSymbol = new SimpleFillSymbol();
//	            fillSymbol.setOutline(new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID, 
//	            		new dojo.Color([0, 0, 0, 0.5]), 1));
//	            fillSymbol.setColor(new dojo.Color([255, 0, 0, 0.5]));
//	            feature.setSymbol(fillSymbol);
//	            map.graphics.add(feature);
//	        }
//	        $.messager.alert("提示,计算成功！");
//	    }
//	    else{
//	        $.messager.alert("提示,计算失败！");
//	    }
//	}
//}
//
function clearLayer(){
	$("#echart").hide();
}