<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>


.col-xs-3 {
	margin-left: 15px;
}

.content>#container1 {
	position: absolute;
}

.content>#container2 {
	position: absolute;
}

.content>#container2>.cover {
	position: absolute;
}

.cover {
	background-color: rgba(0, 0, 0, 0.5);
	text-align: center;
	margin: 10px auto;
}

#coverL {
	width: 100%;
	left: 0;
	float: left;
	background-repeat: no-repeat;
	background-size: cover;
}

#forcast {
	display: inline-block;
	width: 400px;
}

#forcast>table {
	border-collapse: collapse;
}

#forcast>table>tbody>tr {
	border-bottom: 1px solid;
}

#forcast>table>tbody>tr>td {
	font-size: 110%;
}

#forcast>table>tbody>tr:hover {
	background-color: rgba(255, 90, 90, 0.3);
	cursor: pointer;
}

#current {
	text-align: left;
	padding: 10px;
	color: white;
}
#selectresult {
	width: 100%;
	color: black; 
}
.highcolor {
	color: red;
	font-weight: bold;
	font-style: italic;
}
.lowcolor {
	color: blue;
	font-weight: bold;
	font-style: italic;
}
.ranktable1{
	background-color: white;
	border: white;
	width: 100%;
	text-align: center;
}
.ranktable2{
	background-color: white;
	border: white;
	width: 100%;
	text-align: center;
}
.ranktable3{
	background-color: white;
	border: white;
	width: 100%;
	text-align: center;
}
.ranktable4{
	background-color: white;
	border: white;
	width: 100%;
	text-align: center;
}
.ranktable5{
	background-color: white;
	border: white;
	width: 100%;
	text-align: center;
}
.ranktable1:hover {
	background-color: #ff471a;
	color: black;
}
.ranktable2:hover{
background-color: #ff704d;
	color: black;
}
.ranktable3:hover{
background-color: #ffad99;
	color: black;
	style:
}
.ranktable4:hover{
background-color: #ffad99;
	color: black;
}
.ranktable5:hover{
background-color: #ffad99;
	color: black;
}
.tablemain {
	width: 100%;
	text-align: center;
}
.panel-title {
	 text-align: center;
}	
.top5 {
	font-weight: bold;
	font-size: 17px;
}
</style>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<!-- highchart js -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>


<script>
var select_cnt = 0;
var preferloc = new Array();
var i = 0;
var rot = 1; //durationajax

//modal variable
var modal='';

$('#selectresult').hide();
$('#coverL').hide();
$('#cityResultBtn').hide();
$('#cityResultContainer').hide();
$('#durationResult').hide();
$('#cityResultContainer').empty();

function change_cty(f, n, country)
{	
	$prefer_loc = $("select[name='prefer_loc']");
	$prefer_cty = $("select[name='prefer_cty']");
	$prefer_cty.empty();
	$prefer_loc.empty();
	
	$prefer_loc.append("<option value=\"\">Country select please</option>");
	if(f == "") {
		$prefer_cty.append("<option value=\"\"> - </option>");
		return;
	}
	
	$.ajax({
		type:"POST",
		url:"prefer_cty_print.wt?conti_name="+f,
		success: function(data) {
			if(data.length == 0) {
				$prefer_cty.append("<option value=\"\"> - </option>");	
			} else {
				if(n == 0){
					$prefer_cty.append("<option value=\"\" selected=\"selected\"> SELECT </option>");
					$(data).each(function(index, item) {
						var country_name_kor = item.country_name_kor;
						var country_name_eng = item.country_name_eng;
						$prefer_cty.append("<option value=\""+ country_name_eng +"\">" + country_name_kor + "</option>");
					});	
				} else {
					$prefer_cty.append("<option value=\"\"> SELECT </option>");
					$(data).each(function(index, item) {
						var country_name_kor = item.country_name_kor;
						var country_name_eng = item.country_name_eng;
						if(country == country_name_eng) {
							$prefer_cty.append("<option value=\""+ country_name_eng +"\"  selected=\"selected\">" + country_name_kor + "</option>");
						} else {
							$prefer_cty.append("<option value=\""+ country_name_eng +"\">" + country_name_kor + "</option>");
						} 
							
					});
				}	
			}
		}
	});
	
}
function change_loc(f, n, loca)
{	
	$prefer_loc = $("select[name='prefer_loc']");
	$prefer_loc.empty();
	
	if(f == "") {
		$prefer_loc.append("<option value=\"\"> - </option>");
		return;
	}
	
	$.ajax({
		type:"POST",
		url:"prefer_loc_print.wt?country_name="+f,
		success: function(data) {
			if(data.length == 0) {
				$prefer_loc.append("<option value=\"\"> - </option>");	
			} else {
				if(n==0) {
					$prefer_loc.append("<option value=\"\" selected=\"selected\"> SELECT </option>");
					$(data).each(function(index, item) {
						var city_name_kor = item.city_name_kor;
						var city_name_eng = item.city_name_eng;
						$prefer_loc.append("<option value=\""+ city_name_eng +"\">" + city_name_kor + "</option>");	
					});
				} else {
					$prefer_loc.append("<option value=\"\"> SELECT </option>");
					$(data).each(function(index, item) {
						var city_name_kor = item.city_name_kor;
						var city_name_eng = item.city_name_eng;
						if(loca == city_name_eng){
							$prefer_loc.append("<option value=\""+ city_name_eng +"\"  selected=\"selected\">" + city_name_kor + "</option>");	
						} else {
							$prefer_loc.append("<option value=\""+ city_name_eng +"\">" + city_name_kor + "</option>");
						}
					});
					
				}
			}//if~else
		}
	});
}
function allert(f) {
	$( "#dialog-confirm" ).dialog({
		resizable: false,
		height: "auto",
		width: 400,
		modal: true,
		buttons: {
			"Add Preference": function() {
				var txt = '';
	    		txt += '<p class=\"preferloc\">';
	    		txt += f;
	    		txt += '</p>';
	    		$('#select_pref').append(txt);
	    		select_cnt++;
	    		
	    		preferloc[i] = f;
	    		i++;
	        	$( this ).dialog( "close" );
	        },
	        	Cancel: function() {
	        	$( this ).dialog( "close" );
	        }
		}
	});
};
function searchs(num, tempbtn) { // SEARCH 버튼 클릭
	createlikeytable(num); // SEARCH 버튼 클릭하면 밑에 뜨는 테이블을 설정
	var prefer_loc = $("select[name='prefer_loc']").val();
	var month = $("select[name='month']").val();
	var continent2 = $("select[name='prefer2']").val();
	var continent = $("select[name='prefer']").val();
	if(num==0) { //지역 검색
		$('#selectresult').show();
		$('#coverL').show();
		$('#cityResultBtn').show();
		$('#cityResultContainer').hide();
		$('#durationResult').hide();
		var output='';
		output += '<button onclick="searchs(2, -1);" class="btn"> 최저기온 </button>';
		output += '<button onclick="searchs(2, 1);" class="btn"> 최고기온 </button>';
		output += '<button onclick="searchs(2, 0);" class="btn"> 강수량 </button>';
		$('#cityResult > #cityResultBtn').html(output);
		putLog(continent, prefer_loc);// log and yahoo api
	} else if(num==1) { // 기간 검색
		$('#selectresult').show();
		$('#coverL').hide();
		$('#cityResultBtn').hide();
		$('#cityResultContainer').hide();
		$('#durationResult').show();
		durationAJAX(continent2, month);
	} else if(num==2) { // 지역 검색->최저/최고기온 버튼
		$('#selectresult').show();
		$('#coverL').show();
		$('#cityResultBtn').show();
		$('#cityResultContainer').show();
		$('#durationResult').hide();
		$('#cityResultContainer').empty();
		cityAJAX(prefer_loc, tempbtn);
	}	
}
function createlikeytable(num) { // SEARCH 버튼 클릭하면 밑에 뜨는 테이블을 설정함
	var prefer = $("select[name='prefer']").val();
	var prefer2 = $("select[name='prefer2']").val();
	var month = $("select[name='month']").val();
	var prefer_cty = $("select[name='prefer_cty']").val();
	var prefer_loc = $("select[name='prefer_loc']").val();
	
	$selectresult = $("table[id='selectresult']");
	$selectresult.empty();
	
	$.ajax({
		type:"GET",
		url:"whatclicksearchbtn.wt?num="+num,
		success: function(data) {
			
			var output = '';
			$(data).each(function(index, item) {
				// 나라 선택
				if(item.temp == 0) {
					if(prefer_loc=='') {
						alert('도시를 선택해주세요.');
						return;
					}
					output += '<thead>';
					output += '<tr>';
					output += ('<th> 대륙 </th><th>나라</th><th>도시</th><th>관심지역설정</th>');
					output += '</tr>';
					output += '</thead>';
					output += '<tbody>';
					output += '<tr>';
					output += ('<td>'+prefer+'</td>'+'<td>'+prefer_cty+'</td>'+'<td>'+prefer_loc+'</td>'+
								'<td><button onclick=\"likeyinsert();\">FEEL INTEREST</button></td>');
					output += '</tr>';
					output += '</tbody>';
				} else if(item.temp == 1) { // 기간 선택
					output += '<thead>';
					output += '<tr>';
					output += ('<th> 대륙 </th><th>기간</th>');
					output += '</tr>';
					output += '</thead>';
					output += '<tbody>';
					output += '<tr>';
					output += ('<td>'+prefer2+'</td>'+'<td>'+month+'월</td>');
					output += '</tr>';
					output += '</tbody>';
				} 
			})
			$selectresult.append(output);
		}
	});
}
function likeyinsert() { // WT_LIKEY 테이블에 등록
	var prefer = $("select[name='prefer']").val();
	var prefer_cty = $("select[name='prefer_cty']").val();
	var prefer_loc = $("select[name='prefer_loc']").val();
	$.ajax({
		type: "GET",
		url: "likeyinsert.wt?city_name_eng="+prefer_loc,
		success: function(data) {
			$(data).each(function(index, item) {
				if(item.temp == 1) { // 로그인O
					alert('관심지역으로 등록되었습니다.');
				}else if(item.temp == 0) { // 로그인X
					alert('로그인 후 관심지역을 등록할 수 있습니다.');
					return;
				} else if(item.temp == 2) {
					alert('이미 등록되어있습니다.');
				}
			})
		}
	});
}
function currentFunc(data) {
	var output = '';
	var loc = $(data).find('yweather\\:location,location').attr('country');
	var city = $(data).find('yweather\\:location,location').attr('city');
	var lastBuildDate = $(data).find('lastBuildDate').text();
	var date = $(data).find('yweather\\:condition,condition').attr('date');
	var speed = $(data).find('yweather\\:condition,condition').attr('speed');
	var code = $(data).find('yweather\\:condition,condition').attr('code');
	var temp = $(data).find('yweather\\:condition,condition').attr('temp');
	var text = $(data).find('yweather\\:condition,condition').attr('text');

	//console.log(code);
	output += '<h1 style="color:white;">' + loc + '</h1>';
	output += '<h3 style="color:white;">' + city + '</h3>';
	output += '<h5 style="color:white;">' + lastBuildDate + '</h5><br><br><br>';
	output += '<img class="myimg" src="http://l.yimg.com/a/i/us/we/52/' + code + '.gif">';
	output += '<h2 style="color:white;">' + text.substring(0, text.indexOf(' ')) + '<br>' + text.substring(text.indexOf(' ') + 1, text.length) + '</h2>';
	output += '<h1 style="color:white;">' + temp + '℃ </h1>';
	$('#current').html(output);
};

function forcastFunc(data) {
	var output = '';
	output += '<tbody>';
	$(data).find('yweather\\:forecast,forecast').each(function() {
		var day = $(this).attr('day');
		var code = $(this).attr('code');
		var date = $(this).attr('date');
		var high = $(this).attr('high');
		var low = $(this).attr('low');
		var text = $(this).attr('text');

		var content = text + ' today with a high of ' + high + '℃ and a low of ' + low + '℃.';
		/* var content = '오늘 날씨 '+ text+' 최고 온도 '+ high +'℃ 최저온도'+ low; */

		output += '<tr>';
		output += '<td style="width:150px; color:white; font-style:bold;">';
		output += day + ' (' + date + ')</td>';
		output += '<td style="width:50px; color:white; font-style:bold;"><img class="myimg" src="http://l.yimg.com/a/i/us/we/52/' + code + '.gif"></td>';
		output += '<td style="width:50px; color:white; font-style:bold;">' + high + '℃</td>';
		output += '<td style="width:50px; color: red; font-style:bold;">' + low + '℃</td>';
		output += '</tr>';
		output += '<tr class ="winfo"><td colspan ="4" style="width:200px;"><span style="display:block; padding :15px;">' + content + '</span></td></tr>';
	});
	output += '</tbody>';
	$('#forcast > table').html(output);
	$('.winfo').hide();
};
function putLog(conti, loc) {
	$.ajax({
		url : "searchbtnreturn.wt?loc="+loc,
		success : function(data) {
			requestAJAX(conti, loc);
		}
	});
}
function requestAJAX(conti, loc) {
	/* yahoo weather api */
	var url = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22'
	url += loc;
	url += '%22)%20and%20u%3D%27c%27&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys';
	
	$('#coverL').css('background-image', "url(img/"+loc+".jpg)");
	
	$.ajax({
		url : url,
		success : function(data) {
			
			currentFunc(data); // 현재 날씨
			forcastFunc(data); // 미래 날씨
		}
	});
	/* yahoo weather api end*/
};


function cityAJAX(loc, num) {
	if(num==1 || num==-1) {
		$.ajax({
			url:'cityajax.wt?loc='+loc+'&btn='+num,
			success:function(data) {
				$.ajax({
					url:'cityajax2.wt?loc='+loc+'&btn='+num,
					success:function(data2) {
						
						cityHighCharts(data, data2);
					}
				});
			}
		});
	} else if(num == 0) {
		$.ajax({
			url:'cityprcpajax.wt?loc='+loc,
			success:function(data) {
				Charts(data);
			}
			
		});
	}
	
	
}
function Charts(data) {
	// set highcharts
	Highcharts.chart('cityResultContainer', {
		chart : {
			type : 'column'
		},
		title : {
			text : '5년간의 월별 비가 내린 일수'
		},
		subtitle : {
			text : '2012~2016 5년간의 월별 비가 내린 일수'
		},
		plotOptions : {
			column : {
				depth : 25
			}
		},
		xAxis : {
			type : 'category'
		},
		yAxis : {
			title : {
				text : 'DATE'
			}
		},
		series : data,
	}); //highcharts

}

function cityHighCharts(data, data2) {
	// set highcharts
		Highcharts.chart('cityResultContainer', {
		    chart: {
		        type: 'column'
		    },
		    title: {
		        text: '5년간의 월별 날씨'
		    },
		    subtitle: {
		        text: '2012~2016 5년간의 월별 최저,최고기온 평균'
		    },
		    plotOptions: {
		        column: {
		            depth: 25
		        }
		    },
		    xAxis: {
		    	type: 'category'
		    	
		    },
		    yAxis: {
		        title: {
		            text: 'Temperature (°C)'
		        }
		    },
		    series: data,
	   		drilldown: {
				activeAxisLabelStyle: {
				       textDecoration: 'none',
				       fontStyle: 'italic'
				},
				activeDataLabelStyle: {
				       textDecoration: 'none',
				       fontStyle: 'italic'
				},
	   			series: data2
	   		}
		});//highcharts
		
}
function durationAJAX(conti, month) {
	var output = '';
	var outputtext = '';
	
	$.ajax({
		url:'durationajax.wt?conti='+conti+'&month='+month,
		success:function(data) {
			output += '<div class="panel-body">';
			output += '<table class="tablemain">';
			$(data).each(function(index, item) {
				var loc_num = item.loc_num;
				var loc = item.loc;
				var period = item.period;
				var avg_max = item.avg_max;
				var rank = item.rank;
			
				output += '<tr>';
				output += '<td><button type="button" class="ranktable'+rot+'" onclick="modalon('+rot+');" data-toggle="modal" value="'+rot+'">'+'RANK '+rank+' ';
				output += loc+'</button></td>';
				output += '</tr>';
				outputtext += '<div class="modal" id="modal'+rot+'" role="dialog">';
				outputtext += '<div class="modal-dialog modal-sm"><div class="modal-content"><div class="modal-header">';
				outputtext += '<h4 class="modal-title">'+loc+' INFO</h4>';
				outputtext += '</div><div class="modal-body">';
				outputtext += '<p>LOCATION NUMBER : '+loc_num+'</p>';
				outputtext += '<p>MONTH : '+period+'</p>';
				outputtext += '<p>TEMPERATURE : '+avg_max+'</p>';
				outputtext += '</div><div class="modal-footer"><button type="button" onclick="modalclose();" class="close" data-dismiss="modal">Close</button>';
				outputtext += '</div></div></div></div>';
				rot++;

			});
			output += '</table>';
			output += '</div>';
			output += outputtext;
			$('#collapseOne').html(output);
		
			durationAJAX2(conti, month);
		}
	});

};
function durationAJAX2(conti, month) {
	var output = '';
	var outputtext = '';
	var cnt = 1;
	$.ajax({
		url:'durationajax2.wt?conti='+conti+'&month='+month,
		success:function(data) {
			output += '<div class="panel-body">';
			output += '<table class="tablemain">';
			$(data).each(function(index, item) {
				var loc_num = item.loc_num;
				var loc = item.loc;
				var period = item.period;
				var avg_min = item.avg_min;
				var rank = item.rank;
				
				output += '<tr>';
				output += '<td><button type="button" class="ranktable'+cnt+'" onclick="modalon('+rot+');" data-toggle="modal" value="'+rot+'">'+'RANK '+rank+' ';
				output += loc+'</button></td>';
				output += '</tr>';
				outputtext += '<div class="modal" id="modal'+rot+'" role="dialog">';
				outputtext += '<div class="modal-dialog modal-sm"><div class="modal-content"><div class="modal-header">';
				outputtext += '<h4 class="modal-title">'+loc+' INFO</h4>';
				outputtext += '</div><div class="modal-body">';
				outputtext += '<p>LOCATION NUMBER : '+loc_num+'</p>';
				outputtext += '<p>MONTH : '+period+'</p>';
				outputtext += '<p>TEMPERATURE : '+avg_min+'</p>';
				outputtext += '</div><div class="modal-footer"><button type="button" onclick="modalclose();" class="close" data-dismiss="modal">Close</button>';
				outputtext += '</div></div></div></div>';
				rot++;
				cnt++;
			});
			output += '</table>';
			output += '</div>';
			output += outputtext;
			$('#collapseTwo').html(output);
			durationAJAX3(conti, month);
		}
	});

};
function durationAJAX3(conti, month) {
	var output = '';
	var outputtext = '';
	var cnt = 1;
	$.ajax({
		url:'durationajax3.wt?conti='+conti+'&month='+month,
		success:function(data) {
			output += '<div class="panel-body">';
			output += '<table class="tablemain">';
			$(data).each(function(index, item) {
				var loc_num = item.loc_num;
				var loc = item.loc;
				var period = item.period;
				var avg_range = item.avg_range;
				var min = item.min;
				var max = item.max;
				var rank = item.rank;
				
				output += '<tr>';
				output += '<td><button type="button" class="ranktable'+cnt+'" onclick="modalon('+rot+');" data-toggle="modal" value="'+rot+'">'+'RANK '+rank+' ';
				output += loc+'</button></td>';
				output += '</tr>';
				outputtext += '<div class="modal" id="modal'+rot+'" role="dialog">';
				outputtext += '<div class="modal-dialog modal-sm"><div class="modal-content"><div class="modal-header">';
				outputtext += '<h4 class="modal-title">'+loc+' INFO</h4>';
				outputtext += '</div><div class="modal-body">';
				outputtext += '<p>LOCATION NUMBER : '+loc_num+'</p>';
				outputtext += '<p>MONTH : '+period+'</p>';
				outputtext += '<p>DAILY TEMPERATURE RANGE : '+avg_range+'</p>';
				outputtext += '<p>MIN TEMPERATURE : '+min+'</p>';
				outputtext += '<p>MAX TEMPERATURE : '+max+'</p>';
				outputtext += '</div><div class="modal-footer"><button type="button" onclick="modalclose();" class="close" data-dismiss="modal">Close</button>';
				outputtext += '</div></div></div></div>';
				rot++;
				cnt++;
			});
			output += '</table>';
			output += '</div>';
			output += outputtext;
			$('#collapseThree').html(output);
			durationAJAX4(conti, month);
		}
	});

};
function durationAJAX4(conti, month) {
	var output = '';
	var outputtext = '';
	var cnt = 1;
	$.ajax({
		url:'durationajax4.wt?conti='+conti+'&month='+month,
		success:function(data) {
			output += '<div class="panel-body">';
			output += '<table class="tablemain">';
			$(data).each(function(index, item) {
				var loc_num = item.loc_num;
				var loc = item.loc;
				var period = item.period;
				var avg_prcp = item.avg_prcp;
				var avg_humid = item.avg_humid;
				var rank = item.rank;
				
				output += '<tr>';
				output += '<td><button type="button" class="ranktable'+cnt+'" onclick="modalon('+rot+');" data-toggle="modal" value="'+rot+'">'+'RANK '+rank+' ';
				output += loc+'</button></td>';
				output += '</tr>';
				outputtext += '<div class="modal" id="modal'+rot+'" role="dialog">';
				outputtext += '<div class="modal-dialog modal-sm"><div class="modal-content"><div class="modal-header">';
				outputtext += '<h4 class="modal-title">'+loc+' INFO</h4>';
				outputtext += '</div><div class="modal-body">';
				outputtext += '<p>LOCATION NUMBER : '+loc_num+'</p>';
				outputtext += '<p>MONTH : '+period+'</p>';
				outputtext += '<p>RAINFALL : '+avg_prcp+'</p>';
				outputtext += '<p>HUMIDITY : '+avg_humid+'</p>';
				outputtext += '</div><div class="modal-footer"><button type="button" onclick="modalclose();" class="close" data-dismiss="modal">Close</button>';
				outputtext += '</div></div></div></div>';
				rot++;
				cnt++;
			});
			output += '</table>';
			output += '</div>';
			output += outputtext;
			$('#collapseFour').html(output);
		
		}
	});

};
//Get the modal
function modalon(v) {
	modal = document.getElementById('modal'+v);
	modal.style.display = "block";
}

//When the user clicks on (x), close the modal
function modalclose() {
	modal.style.display = "none";
}

</script>

<!-- Inside Title -->
<div class="inside_title image_bck bordered_wht_border white_txt"
	data-image="images/search_img.jpg">
	<!-- Over -->
	<div class="over" data-opacity="0.2" data-color="#000"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h1>Search</h1>
			</div>
			<div class="col-md-6 text-right">
				<div class="breadcrumbs">
					<a href="main.wt">Home</a>Search
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Inside Title End -->

<!-- Content -->
<div class="centerText">
	<div class="content" style="height: 100%" id="content">
		<div class="container-fluid">
			<div class="row">


				<div class="container" id="container1">

					<div class="row">
					
						<!-- 도시검색 -->
						<div class="col-md-12 col-xs-12">
							<h3 style="text-align: center;">
								<strong>City</strong>
							</h3>
							<hr class="style-one">
							<div class="row">
								<div class="col-xs-3" style="margin: 0;">
									<select name="prefer" id="prefer"
										class="form-inline form-control col-xs-3"
										onchange="change_cty(this.value,0,this.value);">
										<option value="" selected="selected">SELECT</option>
										<option value="South_West_Pacific">남서태평양 </option>
										<option value="South_America">남아메리카</option>
										<option value="North_America">북아메리카</option>
										<option value="Asia">아시아</option>
										<option value="Africa">아프리카</option>
										<option value="Europe">유럽</option>
									</select>
								</div>
								<div class="col-xs-3">
									<select id="prefer_cty" name="prefer_cty" class="form-control"
										onchange="change_loc(this.value,0,'')">
										<option value="">Continent select please</option>
									</select>
								</div>
								<div class="col-xs-3">
									<select id="prefer_loc" name="prefer_loc" class="form-control">
										<option value="">Country select please</option>
									</select>
								</div>
								<div class="btn">
									<button class="btn btn-black btn-block no-margin"
										onclick="searchs(0, 0);">
										<i class='ti-search'></i>Search
									</button>
								</div>
								<div class="btn">
									<button class="btn btn-black btn-block no-margin"
										onclick="resetselect(0);">
										<i class='ti-back-right'></i>Reset
									</button>
								</div>
							</div>
						</div>
						<!-- 도시검색 End -->


						<!-- 기간검색 -->
						<div class="col-md-12 col-xs-12">
							<h3 style="text-align: center;">
								<strong>Duration</strong>
							</h3>
							<hr class="style-one">
							<div class="row" style="margin-left: 20%;">
								
								<div class="col-xs-3" style="margin: 0;">
									<select name="prefer2" class="form-inline form-control">
										<option value="" selected="selected">SELECT</option>
										<option value="South_West_Pacific">남서태평양 </option>
										<option value="South_America">남아메리카</option>
										<option value="North_America">북아메리카</option>
										<option value="Asia">아시아</option>
										<option value="Africa">아프리카</option>
										<option value="Europe">유럽</option>
									</select>
								</div>

								<div class="col-xs-3">
									<select name="month" class="form-inline form-control">
										<option value="" selected="selected">Continent select please</option>
										<option value="01">January</option>
										<option value="02">February</option>
										<option value="03">March</option>
										<option value="04">April</option>
										<option value="05">May</option>
										<option value="06">June</option>
										<option value="07">July</option>
										<option value="08">August</option>
										<option value="09">September</option>
										<option value="10">October</option>
										<option value="11">November</option>
										<option value="12">December</option>
									</select>
								</div>


								<div class="btn">
									<button class="btn btn-black btn-block no-margin"
										onclick="searchs(1, 0)">
										<i class="ti-search"></i>Search
									</button>
								</div>

								<div class="btn">
									<button class="btn btn-black btn-block no-margin"
										onclick="resetselect(1);">
										<i class='ti-back-right'></i>Reset
									</button>
								</div>
								
							</div>
						</div>
						
						
						<div class="col-md-12">
							<table id="selectresult"></table>
						</div>
						
					</div>
				</div>
				<div class="clear"></div><div class="clear"></div>
				<!-- 결과화면 -->
				<div class="container" style="height: 100%" id="container2">
					<div class="row">
						<!-- CITY 로 검색했을 때 결과 화면 -->
						<div class="col-md-12 col-xs-12">

							
							<div id="coverL" hidden="hidden">
								<div class="col-md-6">
									<div class="cover">
										<!-- 		<h4>Current</h4><hr> -->
										<div id="current"></div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="cover">
										<h4 style="color: white;">Forecast</h4>
										<hr>
										<div id="forcast">
											<table></table>
										</div>
									</div>
								</div>
							</div> <!-- coverL -->
						</div>
						<div class="col-md-12 col-xs-12" id="cityResult">
							<div id="cityResultBtn"></div>
							<div id="cityResultContainer" style="height: 400px"></div>
						</div>
						<!-- CITY END -->
						<!-- DURATION으로 검색했을 때 결과화면 -->
						<div class="col-md-12 col-xs-12" id="durationResult" hidden="hidden">
							<div class="panel-group" id="accordion" role="tablist"
								aria-multiselectable="true">
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingOne">
										<h4 class="panel-title">
											<a role="button" data-toggle="collapse"
												data-parent="#accordion" href="#collapseOne"
												aria-expanded="true" aria-controls="collapseOne">
												<span class="top5">Top 5</span> <span class="highcolor">High Temperature</span> Areas</a>
										</h4>
									</div>
									<div id="collapseOne" class="panel-collapse collapse in"
										role="tabpanel" aria-labelledby="headingOne">
										
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingTwo">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse"
												data-parent="#accordion" href="#collapseTwo"
												aria-expanded="false" aria-controls="collapseTwo">
												<span class="top5">Top 5</span> <span class="lowcolor">Low Temperature</span> Areas </a>
										</h4>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse"
										role="tabpanel" aria-labelledby="headingTwo">
										
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingThree">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse"
												data-parent="#accordion" href="#collapseThree"
												aria-expanded="false" aria-controls="collapseThree">
												<span class="top5">Top 5</span> <span class="lowcolor">Low Temperature Range</span> Area</a>
										</h4>
									</div>
									<div id="collapseThree" class="panel-collapse collapse"
										role="tabpanel" aria-labelledby="headingThree">
										
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingFour">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse"
												data-parent="#accordion" href="#collapseFour"
												aria-expanded="false" aria-controls="collapseFour">
												<span class="top5">Top 5</span> <span class="highcolor">High Rainfall </span> Area</a>
										</h4>
									</div>
									<div id="collapseFour" class="panel-collapse collapse"
										role="tabpanel" aria-labelledby="headingFour">
										
									</div>
								</div>
							</div>
						</div>
						<!-- DURATION END -->
					</div>
				</div>
				<!-- 결과화면 End -->
			</div>
			<!-- Row End -->
		</div>
	</div>
	<!-- Content End -->


	<!-- Footer -->
	<div class="footer white_txt bordered_wht_border image_bck" id="footer"
		data-color="#0e0e0e">
		<div class="container">

			<div class="row">
				<div class="col-md-3 col-sm-3">
					<div class="logo text-left">
						<a href="#"><b>Berg</b></a>
					</div>
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
					eiusmod tempor incididunt ut labore et dolore magna aliqua.
				</div>

				<div class="col-md-3 col-sm-3 hidden-xs">
					<div class="widget">
						<h4>Recent Posts</h4>
						<ul class="list-unstyled">
							<li><a href="#">Labore et dolore magna aliqua</a> <span
								class="date">July <span class="number">22, 2015</span>
							</span></li>
							<li><a href="#">Labore et dolore magna aliqua</a> <span
								class="date">July <span class="number">14, 2015</span>
							</span></li>
							<li><a href="#">Labore et dolore magna aliqua</a> <span
								class="date">July <span class="number">11, 2015</span>
							</span></li>
						</ul>
					</div>

				</div>

				<div class="col-md-3 col-sm-3 hidden-xs">
					<div class="widget">
						<h4>Latest Updates</h4>
						<ul class="list-unstyled">
							<li><a href="#">Labore et dolore magna aliqua</a> <span
								class="date">July <span class="number">22, 2015</span>
							</span></li>
							<li><a href="#">Labore et dolore magna aliqua</a> <span
								class="date">July <span class="number">14, 2015</span>
							</span></li>
							<li><a href="#">Labore et dolore magna aliqua</a> <span
								class="date">July <span class="number">11, 2015</span>
							</span></li>
						</ul>
					</div>
					<!--end of widget-->
				</div>

				<div class="col-md-3 col-sm-3 hidden-xs">
					<div class="widget">
						<h4>Contacts</h4>
						<span class="contacts_ti ti-mobile"></span>+11 (0) 200 1111 001<br />
						<span class="contacts_ti ti-mobile"></span>+11 (0) 200 1111 002<br />
						<span class="contacts_ti ti-email"></span><a
							href="mailto:support@theberg.com">support@theberg.com</a><br />
						<span class="contacts_ti ti-location-pin"></span>Australia place
						nice, RD nice DHA Road, state pace 786
					</div>
					<!--end of widget-->
				</div>

			</div>
			<!--Row End-->

		</div>
		<!-- Container End -->

		<!-- Footer Copyrights -->
		<div class="footer_end">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<span class="sub">&copy; Copyright 2018 - The Berg</span>
					</div>
					<div class="col-sm-6 text-right">
						<ul class="list-inline social-list">

							<li><a href="#" data-toggle="tooltip" data-placement="top"
								title="Facebook"> <i class="ti-facebook"></i>
							</a></li>
							<li><a href="#" data-toggle="tooltip" data-placement="top"
								title="Twitter"> <i class="ti-twitter-alt"></i>
							</a></li>
							<li><a href="#" data-toggle="tooltip" data-placement="top"
								title="Dribbble"> <i class="ti-dribbble"></i>
							</a></li>
							<li><a href="#" data-toggle="tooltip" data-placement="top"
								title="Vimeo"> <i class="ti-vimeo-alt"></i>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- Copyrights End -->


	</div>
	<!-- Footer End -->
</div>
<script>

$(document).ready(function() {

	if(${searchcty != null}) {
		var conti_name_eng = "${searchcty.conti_name_eng}";
		var country_name_eng = "${searchcty.country_name_eng}";
		$('#prefer option[value=${searchcty.conti_name_eng }]').attr('selected', 'selected');
		change_cty(conti_name_eng, 1, country_name_eng);
		change_loc(country_name_eng, 0, country_name_eng);
		if(${city_select_alert != null}) { //도시 검색 요구하는 alert창
			alert("${city_select_alert}");
		}
		return;
	} else if(${searchloc != null}){
		var conti_name_eng = "${searchloc.conti_name_eng}";
		var country_name_eng = "${searchloc.country_name_eng}";
		var city_name_eng = "${searchloc.city_name_eng}";
		$('#prefer option[value=${searchloc.conti_name_eng }]').attr('selected', 'selected');
		change_cty(conti_name_eng, 1, country_name_eng);
		change_loc(country_name_eng, 1, city_name_eng);
		return;
	}
});
function resetselect(num) {
	$prefer = $("select[name='prefer']");
	$prefer2 = $("select[name='prefer2']");
	$prefer_loc = $("select[name='prefer_loc']");
	$prefer_cty = $("select[name='prefer_cty']");
	$month = $("select[name='month']");
	
	if(num==0) {
		$prefer_cty.empty();
		$prefer_loc.empty();
		$prefer.empty();
		$prefer.append("<option value=\"\" selected=\"selected\">SELECT</option>");
		$prefer.append("<option value=\"South_West_Pacific\">남서태평양 </option>");
		$prefer.append("<option value=\"South_America\">남아메리카</option>");
		$prefer.append("<option value=\"North_America\">북아메리카</option>");
		$prefer.append("<option value=\"Asia\">아시아</option>");
		$prefer.append("<option value=\"Africa\">아프리카</option>");
		$prefer.append("<option value=\"Europe\">유럽</option>");
		$prefer_cty.append("<option value=\"\">Continent select please</option>");
		$prefer_loc.append("<option value=\"\">Country select please</option>");
	} else if(num==1){
		$prefer2.empty();
		$month.empty();
		$prefer2.append("<option value=\"\" selected=\"selected\">SELECT</option>");
		$prefer2.append("<option value=\"South_West_Pacific\">남서태평양 </option>");
		$prefer2.append("<option value=\"South_America\">남아메리카</option>");
		$prefer2.append("<option value=\"North_America\">북아메리카</option>");
		$prefer2.append("<option value=\"Asia\">아시아</option>");
		$prefer2.append("<option value=\"Africa\">아프리카</option>");
		$prefer2.append("<option value=\"Europe\">유럽</option>");
		$month.append("<option value=\"1\">January</option>");
		$month.append("<option value=\"2\">February</option>");
		$month.append("<option value=\"3\">March</option>");
		$month.append("<option value=\"4\">April</option>");
		$month.append("<option value=\"5\">May</option>");
		$month.append("<option value=\"6\">June</option>");
		$month.append("<option value=\"7\">July</option>");
		$month.append("<option value=\"8\">August</option>");
		$month.append("<option value=\"9\">September</option>");
		$month.append("<option value=\"10\">October</option>");
		$month.append("<option value=\"11\">November</option>");
		$month.append("<option value=\"12\">December</option>");
	}
	
}
</script>

