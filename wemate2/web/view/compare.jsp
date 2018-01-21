<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>
::-webkit-scrollbar {
   width: 0px;
   background: transparent; /* make scrollbar transparent */
}

.style-one {
   border: 0;
   height: 10px;
   border: 0;
   box-shadow: 0 10px 10px -10px #8c8b8b inset;
}

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

#compareButton {
   
}
</style>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script>
var select_cnt = 0;
var preferloc = new Array();
var i = 0;
var monthA='';
var monthB='';
var locB='';
var locA='';
function change_ctyA(f)
{   
   $prefer_loc = $("select[name='prefer_locA']");
   $prefer_cty = $("select[name='prefer_ctyA']");
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
            $prefer_cty.append("<option value=\"\" selected=\"selected\"> SELECT </option>");
            $(data).each(function(index, item) {
               var country_name_kor = item.country_name_kor;
               var country_name_eng = item.country_name_eng;
               $prefer_cty.append("<option value=\""+ country_name_eng +"\">" + country_name_kor + "</option>");
            });      
         }
      }
   });
   
}
function change_locA(f){   
   $prefer_loc = $("select[name='prefer_locA']");
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
            $prefer_loc.append("<option value=\"\" selected=\"selected\"> SELECT </option>");
            $(data).each(function(index, item) {
               var city_name_kor = item.city_name_kor;
               var city_name_eng = item.city_name_eng;
               $prefer_loc.append("<option value=\""+ city_name_eng +"\">" + city_name_kor + "</option>");
            });      
         }
      }
   });
}
function change_ctyB(f)
{   
   $prefer_loc = $("select[name='prefer_locB']");
   $prefer_cty = $("select[name='prefer_ctyB']");
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
            $prefer_cty.append("<option value=\"\" selected=\"selected\"> SELECT </option>");
            $(data).each(function(index, item) {
               var country_name_kor = item.country_name_kor;
               var country_name_eng = item.country_name_eng;
               $prefer_cty.append("<option value=\""+ country_name_eng +"\">" + country_name_kor + "</option>");
            });      
         }
      }
   });
   
}
function change_locB(f){   
   $prefer_loc = $("select[name='prefer_locB']");
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
            $prefer_loc.append("<option value=\"\" selected=\"selected\"> SELECT </option>");
            $(data).each(function(index, item) {
               var city_name_kor = item.city_name_kor;
               var city_name_eng = item.city_name_eng;
               $prefer_loc.append("<option value=\""+ city_name_eng +"\">" + city_name_kor + "</option>");
            });      
         }
      }
   });
}

   
var preferLocCount = 0;
var uncheckedbox = 0;
var output = '';
var subs = '';
var continent = '';
var country = '';
var city = '';
var selections = '';
function setDropDown(num,ch){
   if($("input:checkbox[name^='chkbox']").is(':disabled') == true){
      var c = confirm("Do you want to release this checkbox?")
      if(c == true){
         $("input:checkbox[name^='chkbox']").removeAttr("disabled")
      }else{
         return;
      }
   }
   preferLocCount =${checkBoxLength};
   uncheckedbox = $('input:checkbox:not(:checked)').length;
   for(i=1;i<preferLocCount+1;i++){
      if(num==i){
         if($("input:checkbox[name='chkbox"+i+"']:checked").val() != null){
            output = $("input:checkbox[name='chkbox"+i+"']:checked").val();
            subs = output.split(',');
            continent = subs[0];
            country = subs[1];
            city = subs[2];
            if($("select[name='preferA']").val() == ''){
               selection = 'A';
            }else if($("select[name='preferA']").val() != ''){
               selection = 'B';
               $("input:checkbox[name^='chkbox']:not(:checked)").attr("disabled",true);
            }
             /* if(preferLocCount== (uncheckedbox+1)){
               
            }else if(preferLocCount-1 == (uncheckedbox+1)){
               
            }else if(preferLocCount-(uncheckedbox+1) >= 2){
            } */
         } 
         //Set CONTINENT VALUE at dropdown 
         $("select[name='prefer"+selection+"']").val(continent).attr('selected','selected');
         
         //Set COUNTRY VALUE at dropdown 
         $prefer_loc = $("select[name='prefer_loc"+selection+"']");
         $prefer_cty = $("select[name='prefer_cty"+selection+"']");
         $prefer_cty.empty();
         $prefer_loc.empty();
         $prefer_loc.append("<option value=\"\">Country select please</option>");
         if(continent == "") {
            $prefer_cty.append("<option value=\"\"> - </option>");
            return;
         }
         
         $.ajax({
            type:"POST",
            url:"prefer_cty_print.wt?conti_name="+continent,
            success: function(data) {
               if(data.length == 0) {
                  $prefer_cty.append("<option value=\"\"> - </option>");   
               } else {
                  $prefer_cty.append("<option value=\"\" selected=\"selected\"> SELECT </option>");
                  $(data).each(function(index, item) {
                     if(country == item.country_name_eng){
                     var country_name_kor = item.country_name_kor;
                     var country_name_eng = item.country_name_eng;
                     $prefer_cty.append("<option value=\""+ country_name_eng +"\">" + country_name_kor + "</option>");
                     $prefer_cty.val(country).attr('selected','selected');
                     
                     }
                  });      
               }
            }
         });
         
         
         
         //Set CITY VALUE at dropdown
         $loc = $("input[name='loc"+selection+"']");
         $prefer_loc = $("select[name='prefer_loc"+selection+"']");
         $prefer_loc.empty();
         
         if(country == "") {
            $prefer_loc.append("<option value=\"\"> - </option>");
            return;
         }
         
         $.ajax({
            type:"POST",
            url:"prefer_loc_print.wt?country_name="+country,
            success: function(data) {
               if(data.length == 0) {
                  $prefer_loc.append("<option value=\"\"> - </option>");   
               } else {
                  $prefer_loc.append("<option value=\"\" selected=\"selected\"> SELECT </option>");
                  $(data).each(function(index, item) {
                     if(city == item.city_name_eng){
                        var city_name_kor = item.city_name_kor;
                        var city_name_eng = item.city_name_eng;
                        $prefer_loc.append("<option value=\""+ city_name_eng +"\">" + city_name_kor + "</option>");
                        $prefer_loc.val(city).attr('selected','selected');
                        $loc.val(city);
                     }
                  });      
               }
            }
         });// AJAX 시리즈 끝!!
         
      }//(num==i) if 끝
   }//CHECK 했을 때의 for문 끝
   
   if($(ch).is(':checked')){
   }else if(!$(ch).is('checked')){
      $resetCheckBox = $(ch).val();
      $resetDropDown = $resetCheckBox.split(',');
      $temp = $resetDropDown[2];
      $preferA = $("select[name='preferA']");
      $preferB = $("select[name='preferB']");
      $prefer_ctyA = $("select[name='prefer_ctyA']");
      $prefer_ctyB = $("select[name='prefer_ctyB']");
      $prefer_locA = $("select[name='prefer_locA']");
      $prefer_locB = $("select[name='prefer_locB']");
      
      if($("select[name='prefer_locA']").val() == $temp){
         $preferA.empty();
         $prefer_ctyA.empty();
         $prefer_locA.empty();
         $preferA.append("<option value=\"\" selected=\"selected\">SELECT</option>");
         $preferA.append("<option value=\"South_West_Pacific\">남서태평양 </option>");
         $preferA.append("<option value=\"South_America\">남아메리카</option>");
         $preferA.append("<option value=\"North_America\">북아메리카</option>");
         $preferA.append("<option value=\"Asia\">아시아</option>");
         $preferA.append("<option value=\"Africa\">아프리카</option>");
         $preferA.append("<option value=\"Europe\">유럽</option>");
         $prefer_ctyA.append("<option value=\"\">Continent select please</option>");
         $prefer_locA.append("<option value=\"\">Country select please</option>");
      }else{
         $prefer_locB.empty();
         $prefer_ctyB.empty();
         $preferB.empty();
         $preferB.append("<option value=\"\" selected=\"selected\">SELECT</option>");
         $preferB.append("<option value=\"South_West_Pacific\">남서태평양 </option>");
         $preferB.append("<option value=\"South_America\">남아메리카</option>");
         $preferB.append("<option value=\"North_America\">북아메리카</option>");
         $preferB.append("<option value=\"Asia\">아시아</option>");
         $preferB.append("<option value=\"Africa\">아프리카</option>");
         $preferB.append("<option value=\"Europe\">유럽</option>");
         $prefer_ctyB.append("<option value=\"\">Continent select please</option>");
         $prefer_locB.append("<option value=\"\">Country select please</option>");
      }
      
   }
   
}

function THIchart(data){
   Highcharts.chart('THIcontainer', {
       chart: {
           type: 'area'
       },
       title: {
           text: '불쾌지수 비교'
       },
       subtitle: {
           text: '선택한 지역에 5년동안의 평균 10월 불쾌지수 입니다'
       },
       xAxis: {
           allowDecimals: false,
           labels: {
               formatter: function () {
                   return this.value; // clean, unformatted number for year
               }
           }
       },
       yAxis: {
           title: {
               text: 'Nuclear weapon states'
           },
           labels: {
              
               formatter: function () {
                   return this.value + 'THI';
               }
           }
       },
       tooltip: {
           pointFormat: '{series.name} produced <b>{point.y:,.0f}</b><br/>warheads in {point.x}'
       },
       plotOptions: {
           area: {
               pointStart: 1,
               marker: {
                   enabled: false,
                   symbol: 'circle',
                   radius: 1,
                   states: {
                       hover: {
                           enabled: true
                       }
                   }
               }
           }
       },
       series: data
   });
   
}
function saveloca(a){
   $('input[name="locA"]').val(a);
   return a;
}
 
function savelocb(b){
   $('input[name="locB"]').val(b);
   return b;
}
function THI(f) {
   f.method = "GET";
   
   monthA = $('select[name="monthA"]').val();
   monthB = $('select[name="monthB"]').val();
   locA = $('input[name="locA"]').val()
   locB = $('input[name="locB"]').val()

    var allData = { "monthA": monthA, "monthB": monthB, "locA": locA, "locB": locB };
    $.ajax({
      url:'thichart.wt',
      data: allData,
      success: function(data) {
    	  THIchart(data);  
      }
   });
}

</script>

<!-- Inside Title -->
<div class="inside_title image_bck bordered_wht_border white_txt"
   data-image="images/mount5.jpg">
   <!-- Over -->
   <div class="over" data-opacity="0.2" data-color="#000"></div>
   <div class="container">
      <div class="row">
         <div class="col-md-6">
            <h1>Better?</h1>
         </div>
         <div class="col-md-6 text-right">
            <div class="breadcrumbs">
               <a href="main.wt">Home</a>Better Choice
            </div>
         </div>
      </div>
   </div>
</div>
<!-- Inside Title End -->



<!-- Content -->
<div class="content">
   <div class="container-fluid">
      <div class="row">

         <div class="bordered_block col-md-12 grey_border">

            <div class="container">

               <div class="row ">
               <div class="col-sm-12 masonry-item post-snippet">
                  <div class="col-sm-6"><h2 class="title">Prefer Countries</h2></div>
                  <div class="col-sm-6"><h2 class="title" style="text-align:right;">LIKE IT</h2></div>
               </div>
                  <div class="col-sm-12 masonry-item post-snippet">
                     <!-- My prefer Location -->
                     <div class="col-sm-6 masonry-item post-snippet"
                        style="overflow: scroll; height: 300px">
                        <table class="table table-hover">
                           <thead>
                              <tr>
                                 <th>Continent</th>
                                 <th>Country</th>
                                 <th>City</th>
                                 <th style="text-align: center;"><a><i
                                       class="ti-thumb-up"></i></a></th>
                              </tr>
                           </thead>
                           <tbody id="checktable">
                              <c:forEach var="loc" varStatus="status" items="${myLoc }">
                                 <tr>
                                    <td id="pref_conti${status.count}" scope="row"><strong>${loc.conti_name_kor }</strong></td>
                                    <td id="pref_country${status.count}">${loc.country_name_kor }</td>
                                    <td id="pref_city${status.count}">${loc.city_name_kor }</td>
                                    <td style="text-align: center;"><input type="checkbox"
                                       id="chkbox${status.count }" name="chkbox${status.count }"
                                       value="${loc.conti_name_eng },${loc.country_name_eng },${loc.city_name_eng }"
                                       aria-label="Checkbox without label text"
                                       onclick="setDropDown(${status.count },this)"></td>
                                 </tr>
                              </c:forEach>
                           </tbody>
                        </table>
                     </div>


                     <!-- Just Selected Location -->
                     <div class="col-sm-6 masonry-item post-snippet"
                        style="overflow: scroll; height: 300px">
                        <table class="table table-hover">
                           <thead>
                              <tr>
                                 <th>Continent</th>
                                 <th>Country</th>
                                 <th>City</th>
                                 <th style="text-align: center;"><a><i
                                       class="ti-face-smile"></i></a></th>
                              </tr>
                           </thead>
                           <tbody id="checktable">
                              <c:forEach var="loc" varStatus="status" items="${likeyLoc }">
                                 <tr>
                                    <td id="pref_conti${status.count}" scope="row"><strong>${loc.conti_name_kor }</strong></td>
                                    <td id="pref_country${status.count}">${loc.country_name_kor }</td>
                                    <td id="pref_city${status.count}">${loc.city_name_kor }</td>
                                    <td style="text-align: center;"><input type="checkbox"
                                       id="chkbox${status.count }" name="chkbox${status.count }"
                                       value="${loc.conti_name_eng },${loc.country_name_eng },${loc.city_name_eng }"
                                       aria-label="Checkbox without label text"
                                       onclick="setDropDown(${status.count },this)"></td>
                                 </tr>
                              </c:forEach>
                           </tbody>
                        </table>
                     </div>
                  </div>

                  <div id="compa" class="col-sm-6 masonry-item post-snippet ">
                     <h3>
                        <strong>A Location</strong>
                     </h3>
                     <hr class="style-one">
                  </div>
                  <div class="col-sm-6 masonry-item post-snippet ">
                     <h3 style="text-align: right">
                        <strong>B Location</strong>
                     </h3>
                     <hr class="style-one">
                  </div>
                  <div class="col-sm-6 masonry-item post-snippet ">
                     <div class="row">
                        <div class="col-xs-3">
                           <select name="preferA" class="form-inline form-control"
                              onchange="change_ctyA(this.value);">
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
                           <select id="prefer_ctyA" name="prefer_ctyA"
                              class="form-control"
                              onchange="change_locA(this.value)">
                              <option value="">Continent select please</option>
                           </select>
                        </div>
                        <div class="col-xs-3">
                           <select id="prefer_locA" name="prefer_locA"
                              class="form-control" onchange="saveloca(this.value)">
                              <option value="">Country select please</option>
                           </select>
                        </div>
                        <div class="col-xs-3">
                           <select name="monthA" class="form-control">
                              <option value="" selected="selected">MONTH</option>
                              <option value="1">January</option>
                              <option value="2">February</option>
                              <option value="3">March</option>
                              <option value="4">April</option>
                              <option value="5">May</option>
                              <option value="6">June</option>
                              <option value="7">July</option>
                              <option value="8">August</option>
                              <option value="9">September</option>
                              <option value="10">October</option>
                              <option value="11">November</option>
                              <option value="12">December</option>
                           </select>
                        </div>
                     </div>
                  </div>
                  <div class="col-sm-6 masonry-item post-snippet ">
                     <div class="row">
                        <div class="col-xs-3">
                           <select name="preferB" class="form-inline form-control"
                              onchange="change_ctyB(this.value);">
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
                           <select id="prefer_ctyB" name="prefer_ctyB"
                              class="form-control"
                              onchange="change_locB(this.value)">
                              <option value="">Continent select please</option>
                           </select>
                        </div>
                        <div class="col-xs-3">
                           <select id="prefer_locB" name="prefer_locB"
                              class="form-control" onchange="savelocb(this.value)">
                              <option value="">Country select please</option>
                           </select>
                        </div>
                        <div class="col-xs-3">
                           <select name="monthB" class="form-control">
                              <option value="" selected="selected">MONTH</option>
                              <option value="1">January</option>
                              <option value="2">February</option>
                              <option value="3">March</option>
                              <option value="4">April</option>
                              <option value="5">May</option>
                              <option value="6">June</option>
                              <option value="7">July</option>
                              <option value="8">August</option>
                              <option value="9">September</option>
                              <option value="10">October</option>
                              <option value="11">November</option>
                              <option value="12">December</option>
                           </select>
                        </div>
                     </div>
                  </div>                     
                     <form name="hiddenform">
                     <input type="hidden" name="locA" value="">
                     <input type="hidden" name="locB" value="">
                     <input type="hidden" name="monA" value="">
                     <input type="hidden" name="monB" value="">
                     <input type="button" value="COMPARE" onclick="THI(this.form)"
                     	style="display: block; text-align: center; text-decoration: none; background: black; color: white; border-radius: 10px; letter-spacing: 10px; padding-left: 10px;
                     			margin-left: 43%">
                     </form>
                     <div id="THIcontainer" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                  </div> <!-- row End -->
               </div> <!--class:container End-->
            </div>
         </div>
      </div>
      <!-- Row End -->
   </div>
<!-- Content End -->


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
