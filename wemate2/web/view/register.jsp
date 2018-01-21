<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- Alert CSS -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- Theme CSS -->
<link href="css/style.css" rel="stylesheet">

<style>
#select_pref {
	height: auto;
}

option {
	background: gray;
	color: white;
}

.preferloc {
	background: gray;
	color: white;
}
</style>
<script>
	var select_cnt = 0;
	var preferloc = new Array();
	var i = 0;

	function change_cty(f, c) {
		$("input[name='conti_name_kor']").val(c);
		$city_name_eng = $("select[name='city_name_eng']");
		$city_name_kor = $("select[name='city_name_kor']");
		$country_name_eng = $("select[name='country_name_eng']");
		$country_name_kor = $("select[name='country_name_kor']");
		$country_name_eng.empty();
		$city_name_eng.empty();

		$city_name_eng.append("<option value=\"\">Country select please</option>");
		if (f == "") {
			$country_name_eng.append("<option value=\"\"> - </option>");
			return;
		}

		$.ajax({
			type : "POST",
			url : "prefer_cty_print.wt?conti_name=" + f,
			success : function(data) {
				if (data.length == 0) {
					$country_name_eng.append("<option value=\"\"> - </option>");
				} else {
					$country_name_eng.append("<option value=\"\" selected=\"selected\"> SELECT </option>");
					$(data).each(function(index, item) {
						var country_name_eng = item.country_name_eng;
						var country_name_kor = item.country_name_kor;
						$country_name_eng.append("<option value=\"" + country_name_eng + "\">" + country_name_kor + "</option>");

					});
				}
			}
		});

	}
	function change_loc(f, c) {
		$("input[name='country_name_kor']").val(c);
		$city_name_eng = $("select[name='city_name_eng']");
		$city_name_eng.empty();

		if (f == "") {
			$prefer_loc.append("<option value=\"\"> - </option>");
			return;
		}

		$.ajax({
			type : "POST",
			url : "prefer_loc_print.wt?country_name=" + f,
			success : function(data) {
				if (data.length == 0) {
					$city_name_eng.append("<option value=\"\"> - </option>");
				} else {
					$city_name_eng.append("<option value=\"\" selected=\"selected\"> SELECT </option>");
					$(data).each(function(index, item) {
						var city_num = item.city_num;
						var city_name_eng = item.city_name_eng;
						var city_name_kor = item.city_name_kor;
						$city_name_eng.append("<option id=\"" + city_num +
							"\" value=\"" + city_num + "\">" + city_name_kor + "</option>");
					});
				}
			}
		});
	}

	/* ********************Alert form css / Im Bo Hyun / 171215 ************************* */

	function allert(f, c) {
		$("input[name='city_name_kor']").val(c);
		$("#dialog-confirm").dialog({
			resizable : false,
			height : "auto",
			width : 400,
			modal : true,
			buttons : {
				"Add Preference" : function() {
					var txt = '';
					txt += '<p class=\"preferloc\">';
					txt += c;
					txt += '</p>';
					$('#select_pref').append(txt);
					select_cnt++;

					preferloc[i] = f;
					i++;
					$(this).dialog("close");
				},
				Cancel : function() {
					$(this).dialog("close");

				}
			}
		});
	}
	;


	function register(f) {
		var id = f.id;
		var pwd = f.pwd;
		var pwdcheck = f.pwdcheck;
		var email = f.email;
		var birth = f.birth;
		var gender = $('input:radio[name="gender"]:checked').val();
		var posttext = ''; // 선호 지역 아이디들을 post 전달할 때 사용.

		// 빈칸 체크
		if (id.value == '' || pwd.value == '' || pwdcheck.value == '' || email.value == '' ||
			birth.value == '') {
			alert('빠짐없이 입력해주세요.');
			if (id.value == '') id.focus();
			else if (email.value == '') email.focus();
			else if (pwd.value == '') pwd.focus();
			else if (pwdcheck.value == '') pwdcheck.focus();
			else if (birth.value == '') birth.focus();
			return;
		}

		// 선호지역 빈칸 체크
		if (preferloc == '') {
			alert('선호하는 해외 지역을 1~3개 선택해주세요.');
			return;
		}

		// 패스워드, 패스워드확인 일치하는지 비교
		if (pwd.value != pwdcheck.value) {
			alert('비밀번호 확인이 다릅니다.');
			pwdcheck.focus();
			return;
		}
		// 이메일 정규식
		var exptext = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		// 이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
		if (exptext.test(email.value) == false) {
			alert("이메일 형식이 올바르지 않습니다.");
			email.focus();
			return;
		}

		// 생년월일 정규식, 검사
		var exp = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
		if (exp.test(birth.value) == false) {
			alert("생년월일 형식이 올바르지 않습니다.");
			birth.focus();
			return;
		}
		
		for(var i=0; i < preferloc.length; i++) {
			if(i==preferloc.length-1) {
				posttext += "preferloc"+i+"="+preferloc[i] + "&i="+ (i+1);
			} else {
				posttext += "preferloc"+i+"="+preferloc[i] + "&";
			}
			
		}
		f.method = 'POST';
		f.action = 'useraddimpl.wt?'+posttext;
		f.submit();
	}
</script>

<!--Intro-->
<section class="intro">
	<div class="intro_item">
		<!-- Over -->
		<div class="over" data-opacity="0.4" data-color="#000"></div>
		<div class="into_back image_bck" data-image="images/back3.jpg"></div>
		<div class="inside_intro_block">
			<div class="ins_int_item white_txt bordered_wht_border text-center">
				<div class="simple_block simple_block_sml">
					<h4>Register Here</h4>
					<form>
						<input type="hidden" name="admin" value="0"> <input
							type="text" class="form-control form-opacity" name="id"
							placeholder="User ID"> <input type="text"
							class="form-control form-opacity" name="email"
							placeholder="E-mail Address"> <input type="password"
							class="form-control form-opacity" name="pwd"
							placeholder="Password"> <input type="password"
							name="pwdcheck" class="form-control form-opacity"
							placeholder="Confirm Password"> <input type="text"
							class="form-control form-opacity" name="birth"
							placeholder="birthday (ex.951027)"> <input type="radio"
							name="gender" value="M" checked> Male <input type="radio"
							name="gender" value="F"> Female

						<p>Select your Favorite Countries (up to 3)</p>
						<select name="conti_name_eng" class="form-control form-opacity"
							onchange="change_cty(this.value,this.options[this.selectedIndex].innerHTML);">
							<option value="" selected="selected">SELECT</option>
							<option value="South_West_Pacific">남서태평양 </option>
							<option value="South_America">남아메리카</option>
							<option value="North_America">북아메리카</option>
							<option value="Asia">아시아</option>
							<option value="Africa">아프리카</option>
							<option value="Europe">유럽</option>
						</select> <input id="conti_name_kor" name="conti_name_kor" type="hidden"
							value=""> <select id="country_name_eng"
							name="country_name_eng" class="form-control form-opacity"
							onchange="change_loc(this.value,this.options[this.selectedIndex].innerHTML)">
							<option value="">Continent select please</option>
						</select> <input id="country_name_kor" name="country_name_kor"
							type="hidden" value=""> <select id="city_name_eng"
							name="city_name_eng" class="form-control form-opacity"
							onchange="allert(this.value,this.options[this.selectedIndex].innerHTML)">
							<!--********************Alert form css / Im Bo Hyun / 171215 ************************* -->
							<option value="">Country select please</option>
						</select> <input id="city_name_kor" name="city_name_kor" type="hidden"
							value="">
						<div id="select_pref" class="form-control form-opacity"></div>
						<input type="button" class="btn btn-white btn-block no-margin"
							value="Register" onclick="register(this.form);"> signing
						up, you agree to our <a href="#">Terms Of Use</a> </small>
					</form>
				</div>
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

<!--********************Alert form css / Im Bo Hyun / 171215 ************************* -->
<div id="dialog-confirm" hidden="hidden"
	style="color: #a94442; background-color: #f2dede; border-color: #ebccd1;"
	title="Prefer Country">
	<p>
		<span class="ti-shine" style="float: left; margin: 8px 12px 20px 0;"></span>추가하시겠습니까?
	</p>
</div>