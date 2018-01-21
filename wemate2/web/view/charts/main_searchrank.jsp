<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>

<!-- Inside Title -->
<div class="inside_title image_bck bordered_wht_border white_txt"
	data-image="images/search_img.jpg">
	<!-- Over -->
	<div class="over" data-opacity="0.2" data-color="#000"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h1>Charts</h1>
			</div>
			<div class="col-md-6 text-right">
				<div class="breadcrumbs">
					<a href="main.wt">Home</a>Charts
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
						<div class="col-md-12 col-xs-12" id="charts">
							<div id="chartscontainer" style="min-width: 310px; max-width: 600px; height: 500px; margin: 0 auto"></div>
						</div>
					</div>
					<!-- Row End 1-->
				</div>
				
			</div>
			<!-- Row End 2-->
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
	$.ajax({
		url:'searchrank.wt',
		success:function(data) {
			Highcharts.chart('chartscontainer', {
			    chart: {
			        type: 'column'
			    },
			    title: {
			        text: '검색순위'
			    },
			    subtitle: {
			        text: ''
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
			            text: ''
			        }
			    },
			    series: data,
		   		
			});//highcharts
		}
		
	});
})
</script>