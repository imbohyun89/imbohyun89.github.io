<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
.up_btn:hover {
	color: red;
	font-weight: bold;
	text-decoration: none;
}
.inside_intro_block{
	overflow: auto;
}
</style>
<script>

</script>

<!-- Inside Title -->
<div class="inside_title image_bck white_txt"
	data-image="images/back2.jpg">
	<div class="over" data-color="#000" data-opacity="0.4"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h1>PREFER LOC ADMIN</h1>
			</div>
			<div class="col-md-6 text-right">
				<div class="breadcrumbs">
					<a href="#">ADMIN</a>PREF ADMIN
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Inside Title End -->

<!--Intro-->
<section class="intro">
	<div class="intro_item">
		<!-- Over -->
		<div class="over" data-opacity="0.4" data-color="#000"></div>
		<div class="into_back image_bck" data-image="images/back3.jpg"></div>
		<div class="inside_intro_block">
			<div  class="ins_int_item black_txt text-center">
				<table class="table table-bordered">
					<thead>
						<tr class="ins_int_item white_txt text-center">
							<th>NUM</th>
							<th>CITY NUM</th>
							<th>USER ID</th>
						</tr>
					</thead>
					<c:forEach var="pref" items="${preflist }">
						<tr class="active">
							<td><a href="#">${pref.num }</a></td>
							<td>${pref.city_num }</td>
							<td>${pref.user_id }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</section>
<!-- Intro End -->

<!-- Footer -->
<div class="footer white_txt bordered_wht_border image_bck"
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
						href="mailto:support@theberg.com">support@theberg.com</a><br /> <span
						class="contacts_ti ti-location-pin"></span>Australia place nice,
					RD nice DHA Road, state pace 786
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