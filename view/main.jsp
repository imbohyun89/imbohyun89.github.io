<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="EUC-KR">
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${pagename }</title>
<style>
#font {
	font-family: 'Ubuntu', sans-serif;
}
.ti-close:hover{
    color:red;
   cursor:pointer;
}
</style>

<!-- 자동완성 css, js -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<!-- Bootstrap CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Font Awesome CSS -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="fonts/themify-icons.css" rel="stylesheet">

<!-- Owl Carousel CSS -->
<link href="css/owl.carousel.css" rel="stylesheet">

<!-- Magnific Popup core CSS file -->
<link rel="stylesheet" href="css/magnific-popup.css">

<!-- Animate CSS -->
<link rel="stylesheet" href="css/animate.css">

<!-- Theme CSS -->
<link href="css/style.css" rel="stylesheet">

<!-- Med Icons -->
<link href="fonts/health/flaticon.css" rel="stylesheet">

<!-- Google Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,700,300'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Ubuntu"
	rel="stylesheet" type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Kanit"
	rel="stylesheet">

</head>
<body class="passp_white">

	<!-- Passpartu -->
	<div class="passpartu passpartu_left"></div>
	<div class="passpartu passpartu_right"></div>
	<div class="passpartu passpartu_top"></div>
	<div class="passpartu passpartu_bottom"></div>
	<!-- Passpartu End -->

	<div class="page" id="page">


		<div class="head_bck" data-color="#292929" data-opacity="0.0"></div>


		<!-- Header -->
		<header class="no_border blue_hover">

			<!-- Logo -->
			<div class="logo pull-left">
				<a href="main.wt" id="font"><b>WEMATE</b></a>
			</div>

			<!-- Header Buttons -->
			<div class="header_btns_wrapper">

				<!-- Main Menu Btn -->
				<div class="main_menu">
					<i class="ti-menu"></i><i class="ti-close"></i>
				</div>

				<!-- Sub Menu -->
				<div class="sub_menu">
					<div class="sub_cont">
						<ul>

							<c:choose>
								<c:when test="${center == main}">
									<li><a href="#offers" id="font">Statistics</a></li>
									<li><a href="#sales" id="font">Chosen Cities</a></li>
									<li><a href="#recommand" id="font">Recommand</a></li>
								</c:when>
							</c:choose>

							<li><a href="aboutus.wt" id="font">Support</a></li>
							<li><a href="search.wt" id="font">Search</a></li>

							

							<!-- LOGIN -->
							<c:choose>
								<c:when test="${loginuser.id != null}">
									<!-- Wish List -->
									<li class="no_arrow right_sub sub_min_width"><a href="#"
										class="parents"> <i class="ti-heart"></i></a>
										<ul class="mega_menu" style="width: 300px;">
											<c:forEach var="loc" varStatus="status" items="${likeyLoc}">
												<li class="mega_sub${status.count}"
													id="mega_sub${status.count}"
													style="display: inline-block; width: 100%; height: 60px; position: relative;">
													<div class="closebox"
														style="height: 5px; width: 5px; position: absolute; right: 25px; top: 15px; z-index: 100;"
														onclick="fadeOUT(${status.count},${loc.sq_num })">
														<i class="ti-close" style="text-align: right;"></i>
													</div> <a href="#" class="bask_block_item"
													style="padding-top: 25px;"> <img
														style="width: 50px; height: 30px;"
														src="images/flags/${loc.country_name_eng}.png" alt=""
														id="font"> <span style="margin-left: 20px">
															${loc.city_name_eng}</span><br>
												</a>
												</li>
											</c:forEach>
											<li class="mega_sub bask_menu">
												<div class="bask_btns">
													<a href="compare.wt?id=${loginuser.id }"
														class="btn btn-default" id="font" style="left: 70px;">Compare</a>
												</div>
											</li>
										</ul></li>
									<!-- Wish List End -->
									<li><strong><a href="#" class="parents"><i
												class="ti-user" style="font-size: 1.2em; color: white"></i></a></strong>
										<ul class="mega_menu">
											<li class="mega_sub">
												<ul>
													<li><a href="userdetail.wt?id=${loginuser.id }"
														id="font">MY PAGE</a></li>
													<li><a href="logout.wt" id="font">LOGOUT</a></li>
												</ul>
											</li>
										</ul></li>
								</c:when>
								<c:otherwise>
									<li><a href="login.wt" id="font">Login</a></li>
								</c:otherwise>
							</c:choose>

							<!-- LOGIN END-->
							<!-- ADMIN -->
							<c:choose>
								<c:when test="${loginuser.admin == 1 }">
									<li class="right_sub"><a href="#" class="parents"
										id="font">ADMIN</a>
										<ul class="mega_menu">
											<li class="mega_sub">
												<ul>
													<li><a href="adminlist.wt" id="font">USER ADMIN</a></li>
													<li><a href="adminpref.wt" id="font">PREF ADMIN</a></li>
												</ul>
											</li>
										</ul></li>
								</c:when>
								<c:otherwise>

								</c:otherwise>
							</c:choose>
							<!-- ADMIN END -->
							<!-- Language -->
							<li class="right_sub"><a href="#" class="parents" id="font">Eng</a>
								<ul class="mega_menu">
									<li class="mega_sub">
										<ul>
											<li><a href="#" id="font">Deutsch</a></li>
											<li><a href="#" id="font">French</a></li>
										</ul>
									</li>
								</ul></li>
							<!-- Language End-->

						</ul>
						<!-- Search -->
						<ul>
							<li class="right_sub no_arrow sub_min_width"><a
								href="search.wt" class="parents"><i class="ti-search"></i></a>
								<ul class="mega_menu">
									<li class="mega_sub bask_menu">
										<form method="POST" action="searchtabreturn.wt">
											<input type="text" class="form-control" name="searchbar"
												id="searchbar"
												placeholder="Enter the area you are curious about">
											<button type="submit" class="se_btn">
												<i class="ti-search"></i>
											</button>
										</form>
									</li>
								</ul></li>
						</ul>
						<!-- Search End-->


					</div>
				</div>
				<!-- Sub Menu End -->

			</div>
			<!-- Header Buttons End -->


			<!-- Up Arrow -->
			<a href="#page" class="up_block go"><i class="fa fa-angle-up"></i></a>

		</header>
		<c:choose>
			<c:when test="${center != null}">
				<jsp:include page="${center}.jsp" />
			</c:when>
			<c:otherwise>
				<jsp:include page="center.jsp" />
			</c:otherwise>
		</c:choose>



	</div>
	<!-- Page End -->



	<!-- JQuery -->
	<script src="js/jquery-1.11.3.min.js"></script>
	<!-- WL Carousel JS -->
	<script src="js/owl.carousel.min.js"></script>

	<!-- PrefixFree -->
	<script src="js/prefixfree.min.js"></script>
	<!-- Magnific Popup core JS file -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<!-- Textillate -->
	<script src="js/jquery.lettering.js"></script>
	<!-- Countdown -->
	<script src="js/jquery.plugin.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<!-- JQuery UI -->
	<script src="js/jquery-ui.js"></script>
	<!-- Wow -->
	<script src="js/wow.js"></script>
	<!-- Masonry -->
	<script src="js/masonry.pkgd.min.js"></script>

	<!-- Bootstrap JS -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Theme JS -->
	<script src="js/script.js"></script>

	<!-- 자동완성 스크립트 -->
	<script>
	$(function() {
	    $("#searchbar").autocomplete({
	        source : function(request, response) {
	            $.ajax({
	                type : 'get',
	                url : "autosearchbar.wt",
	                data : {
	                    term : request.term
	                },
	                success : function(data) {
	                	response($.map(data, function(item) {
	                		if(item.num == 0) {
	                			return {label: item.city_name_eng,
	                				value: item.city_name_eng};
	                		} else {
	                			return {label: item.country_name_eng,
	                				value: item.country_name_eng};
	                		}
	                	}));
	                }
	            });
	        }
	    });
	});
	function fadeOUT(num,sq){
		   $("#mega_sub"+num+"").slideUp("slow",function(){
		      $("#mega_sub"+num+"").remove();
		      $.ajax({
		    	url:"likeydelete.wt?sq_num="+sq+"&next=${center}",
				success: function(data) {
					alert('선택했던 관심지역이 삭제되었습니다.');
				}
		    	  
		      });
		      
		   })
		}
	</script>

</body>
</html>