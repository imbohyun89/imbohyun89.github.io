<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" type='text/css'>	
<link href="https://fonts.googleapis.com/css?family=Fredoka+One" rel="stylesheet">
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>
<script>
function searchmore(val) {
	location.href = "searchtabreturn.wt?searchbar="+val;
}
</script>
<!--Hotel-->
<section class="intro" >

    <!-- Down Arrow -->
    <a href="#welcome" class="down_block go"><i class="fa fa-angle-down"></i></a>

    <!-- Wrapper -->
    <div class="intro_wrapper">
		<c:forEach var="m" items="${mainlist }" varStatus="status">
        <!-- Item -->
        <div class="intro_item">
			
           <!-- Over -->
            <div class="over" data-opacity="0.3" data-color="#292929"></div>
            
            	<div class="into_back into_zoom image_bck" data-image="img/${m.city_name_eng }.jpg"></div>
            <div class="text_content">
               
                <!-- Country name/ country info -->
                <div class="intro_text intro_text_lc text-left text_up" style="margin-top: 20px">
                    <span class="great_title great_title_big" >${m.city_name_eng }</span>
                    <input type="hidden" name="cityname${status.index }" value="${m.city_num }">
                    <input type="hidden" name="continame${status.index }" value="${m.conti_name_eng }">
                    <span class="great_subtitle great_subtitle_big">${m.conti_name_eng }</span>
                    <span class="into_txt">Let's Travel in ${m.city_name_eng }! </span>
                    <span><button  onclick="searchmore(this.value);" class="btn btn-white" value="${m.city_name_eng }">See More</button></span>
                </div> 
                
                <!-- present weather -->
                <div class="intro_text text-left text_up" data-opacity="0.7" data-color="#292929" style="margin-top: 300px">
                    <span class="great_title great_title_big" style="font-size: 250%;">Weather</span>
                    <div id="current${status.index }"></div>
                    <%-- <span class="great_subtitle great_subtitle_big">${m.city_name_eng }</span> --%>
                </div> 
                
                <!-- weekend weather -->
                <div class="intro_text intro_text_lc text-left text_up" data-opacity="0.7" data-color="#292929" style="margin-left: 20px; margin-top: 20px">
                    <span class="great_title great_title_big" style="font-size: 250%">Weekend Weather</span>
                    <div id="forcast${status.index }">
						<table></table>
					</div>
                    <%-- <span class="great_subtitle great_subtitle_big">${m.city_name_eng }</span> --%>
            	</div> 
   
            </div> 
        </div>
		<!-- Item END -->
        </c:forEach>
    </div>
    <!-- Wrapper End -->
</section>
<!-- Intro End -->



<!-- Slider Border -->
<div class="after_slider_border"></div>
<!-- Statistics -->
<section class="boxes reviews" id="offers">

	<div class="col-md-12 grey_border" style="margin-top: 20px;">
	              <h1 class="text-center" style="font-family: 'Fredoka One', cursive; 
	              font-size: 400%; margin: 80px 0 60px">Statistics 
	               <i class="ti-pie-chart"></i> 
	               <i class="ti-stats-up"></i>
	               <i class="ti-bar-chart"></i>
	               </h1>
	</div>

    <div class="container-fluid">
        
        <!-- Title -->
        	<!-- <h4 class="sml_abs_title in">Statistic</h4> -->
		
        <!-- Wrapper -->
        <div class="mid_wrapper">

            <!-- Item -->
            <div class="bordered_block flex_block image_bck bordered_zoom height400">
                <div class="image_over image_bck" data-image="images/seo-rankings.jpg"></div>
                <a href="main_searchrank.wt" class="box_link"></a>
                <div class="box_content">
                    <h3>Search Ranking</h3>
                    <p><span class="btn">Chart View</span></p>
                </div>     
            </div>

            <!-- Item -->
            <div class="bordered_block flex_block image_bck bordered_zoom height400">
                <div class="image_over image_bck" data-image="images/3d_pie_chart.jpg"></div>
                <a href="mainprefrank.wt" class="box_link"></a>
                <div class="box_content">
                    <h3>Prefer Loc. RANK</h3>
                    <p><span class="btn">Chart View</span></p>
                </div>     
            </div>

            <!-- Item -->
            <div class="bordered_block flex_block image_bck bordered_zoom height400">
                <div class="image_over image_bck" data-image="images/departure.png"></div>
                <a href="maindepart.wt" class="box_link"></a>
                <div class="box_content">
                    <h3>Departure Population RANK</h3>
                    <p><span class="btn">Chart View</span></p>
                </div>     
            </div>     

        </div>
        <!-- Wrapper End -->
    </div>
</section>
<!-- Statistics End -->

                        
<!--Prefer-->
<section class="boxes" id="sales">
    <div class="container-fluid">
    
<div class="col-md-12  grey_border" style="margin-top: 20px;">
              <h1 class="text-center" style="font-family: 'Fredoka One', cursive; 
              font-size: 400%; margin: 80px 0 60px" >
			<c:choose> 
				<c:when test="${loginuser.id != null }">
					Your Prefer Location
				</c:when>
				<c:otherwise>
					Prefer Location Ranking
				</c:otherwise>
            </c:choose>
              
              <i class="ti-car"  style="font-size: 50%"></i>
              <i class="ti-direction"></i>
              </h1>
</div>


        <!-- Title -->
       <!--  <h4 class="sml_abs_title wow fadeInUp">Your Prefer Location</h4> -->
        <div class="row">
            <c:forEach var="rank" items="${ranklist }">
            	<!-- col -->
	            <div class="col-md-12 bordered_block grey_border image_bck" data-image="img/${rank.city_name_eng }.jpg" style="width: 100%; height: auto;">
	                <div class="container">
	                    <div class="row">
	                        <div class="col-md-6 wow fadeInLeft">
	                            <span class="great_title">${rank.country_name_eng }</span>
	                            <span class="great_subtitle great_subtitle_big">${rank.city_name_eng }</span>
	                            <span class="into_txt">info text ~~~~~~</span>
	                            <br />
	                            <a href="mainlistreturn.wt?city_name_eng=${rank.city_name_eng }" class="btn btn-white">SEE INFO</a>
	                        </div>
	                    </div>    
	                </div>
	            </div>
	            <!-- Col End -->
            </c:forEach>
			<c:forEach var="pref" items="${preflist }">
            	<!-- col -->
	            <div class="col-md-12 bordered_block grey_border image_bck" data-image="img/${pref.city_name_eng }.jpg" style="width: 100%; height: auto;">
	                <div class="container">
	                    <div class="row">
	                        <div class="col-md-6 wow fadeInLeft">
	                            <span class="great_title">${pref.country_name_eng }</span>
	                            <span class="great_subtitle great_subtitle_big">${pref.city_name_eng }</span>
	                            <span class="into_txt">info text ~~~~~~</span>
	                            <br />
	                            <a href="mainlistreturn.wt?city_name_eng=${pref.city_name_eng }" class="btn btn-white">SEE INFO</a>
	                        </div>
	                    </div>    
	                </div>
	            </div>
	            <!-- Col End -->
            </c:forEach>

        </div>
        <!-- Row End -->

    </div>
</section>
<!--Prefer End-->

<!--Recommand-->
<section class="boxes reviews" id="recommand">
		<div class="container-fluid">
			<div class="col-md-12 grey_border" style="margin-top: 20px;">
			<h1 class="text-center" style="font-family: 'Fredoka One', cursive; 
			font-size: 400%; margin: 80px 0 60px">Recommand 

			</h1>
		</div>
        
        <!-- Title
        <h4 class="sml_abs_title wow fadeInUp">Reviews</h4> -->
        
        <!-- Wrapper -->
        <div class="mid_wrapper">

            <!-- Item -->
            <div class="bordered_block flex_block image_bck bordered_zoom bordered_zoom_three height400">
                <div class="image_over image_bck" data-image="images/face1.jpg"></div>
                <div class="box_quotes"><span class="fa fa-quote-right"></span></div>
                <div class="box_content">
                    <h3>Joe Doe</h3>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua.
                </div>     
            </div>

            <!-- Item -->
            <div class="bordered_block flex_block image_bck bordered_zoom bordered_zoom_three height400">
                <div class="image_over image_bck" data-image="images/face2.jpg"></div>
                <div class="box_quotes"><span class="fa fa-quote-right"></span></div>
                <div class="box_content">
                    <h3>Britney Doe</h3>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                    consequat. 
                </div>     
            </div>

            <!-- Item -->
            <div class="bordered_block flex_block image_bck bordered_zoom bordered_zoom_three height400">
                <div class="image_over image_bck" data-image="images/face3.jpg"></div>
                <div class="box_quotes"><span class="fa fa-quote-right"></span></div>
                <div class="box_content">
                    <h3>Jessica Doe</h3>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                    consequat. 
                </div>     
            </div>

            <!-- Item -->
            <div class="bordered_block flex_block image_bck bordered_zoom bordered_zoom_three height400">
                <div class="image_over image_bck" data-image="images/face4.jpg"></div>
                <div class="box_quotes"><span class="fa fa-quote-right"></span></div>
                <div class="box_content">
                    <h3>Tina Doe</h3>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                    consequat. 
                </div>     
            </div>

            <!-- Item -->
            <div class="bordered_block flex_block image_bck bordered_zoom bordered_zoom_three height400">
                <div class="image_over image_bck" data-image="images/face5.jpg"></div>
                <div class="box_quotes"><span class="fa fa-quote-right"></span></div>
                <div class="box_content">
                    <h3>Anna Doe</h3>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                    consequat. 
                </div>     
            </div>

            <!-- Item -->
            <div class="bordered_block flex_block image_bck bordered_zoom bordered_zoom_three height400">
                <div class="image_over image_bck" data-image="images/face6.jpg"></div>
                <div class="box_quotes"><span class="fa fa-quote-right"></span></div>
                <div class="box_content">
                    <h3>Simona Doe</h3>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                    consequat. 
                </div>     
            </div>
            


        </div>
        <!-- Wrapper End -->
    </div>
</section>
<!-- Recommand End -->


<!--News-->
<section class="boxes" id="news">
    <div class="container-fluid">
        <div class="row">
            
            <!-- col -->
            <div class="col-md-12 bordered_block grey_border">
                <div class="container">
                    <div class="row">
                        <h2 class="text-center">News Articles & Blogs</h2>

                        <div class="col-md-12 col-xs-12">
                            <div class="masonry row">
                                
                                <!--Item-->
                                <div class="col-sm-4 post-snippet masonry-item">
                                    <a href="#">
                                        <img alt="" src="images/news/news1.jpg" />
                                    </a>
                                    <div class="inner">
                                        <a href="#">
                                            <h4 class="title">When is the best time to visit Northern Norway</h4>
                                            <span class="date">November 10, 2017</span>
                                        </a>
                                        <p>
                                          
Spring is a great time to be in Norway as nature bursts back into life. It is also the best time to enjoy "winter" sports, as there is still plenty of snow and days become longer and sunnier. Bear in mind that skiing opportunities in Northern Norway are better suited to off-piste and cross country skiers as there are few dedicated ski resorts.

                                        </p>
                                         
<!-- Trigger/Open The Modal -->
<button class="myBtn" onclick="display(1)">Read More</button>

<!-- The Modal -->
<div id="myModal1" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>
<h2>Spring</h2>
Spring is a great time to be in Norway as nature bursts back into life. It is also the best time to enjoy "winter" sports, as there is still plenty of snow and days become longer and sunnier. Bear in mind that skiing opportunities in Northern Norway are better suited to off-piste and cross country skiers as there are few dedicated ski resorts.
 <img alt="" src="images/news/news1-1.jpg" />
Cross country skiing in Beisfjord, Nordland (c) lenanarvik/Foap/Visitnorway.com
By late April most of the snow has melted away to reveal a lush and blooming landscape. However some parts of Northern Norway, such as Lofoten, can remain quite chilly and stark in spring and only really start to bloom as summer approaches. If you're hoping to experience the wonder of the fruit tree blossoms, you are better off heading south to the Hardangerfjord.
<h2>Summer</h2>
Summer is the most popular season in Northern Norway, and prices are at a premium from June until early September. Temperatures vary during the summer months, sometimes reaching 25-30캜 (77-86캟) during the day. Prepare for cooler days as well, as average temperatures in some parts of Northern Norway, such as Tromso and Bodo, are 12캜-14캜 (53-57캟).
 <img alt="" src="images/news/news1-2.jpg" />
Midnight sun in Lofoten (c) J?n Allan Pedersen/visitnorway.com
Many tourists travel to Northern Norway in the summer to experience the midnight sun, a natural phenomenon where the sun shines for a full 24 hours. Several activities are open at night during this time, such as sea kayaking, horse riding and midnight golfing. Cheaper options include going for a midnight swim or pitching your tent in the wilds - everyone in Norway has the right to roam freely.
<h2>Autumn</h2>
Autumn is a good time to travel to Northern Norway. There are plenty of sunny days throughout September and October and much fewer tourists. The mountainous plains and dense woodlands look particularly stunning as trees transform into their autumn colours.
 <img alt="" src="images/news/news1-3.jpg" />
Autumn colours in Northern Norway (c) Lucy Woods
Daylight lasts until late afternoon so there's still time to pack in plenty of outdoor activities such as trekking and nature safaris. This is also one of the best times of year to see the Northern Lights. Autumn is a tricksy season so bring lots of warm clothing and a set of waterproofs just in case the heavens decide to open.
<h2>Winter</h2>
During the winter months Northern Norway transforms into a frosty tundra, with much of the landscape coated in snow. Nights become long and unforgiving, with temperatures often dipping way below freezing. In fact, from mid November until late January, the sun does not rise at all in places such as Tromso. Pack plenty of layers and a good pair of insulated gloves to protect your hands from the bitter cold.
 <img alt="" src="images/news/news1-4.jpg" />
Dogsledding at Tromso Villmarksenter (c) C.H/visitnorway.com
On the plus side, Northern Norway is much quieter during the winter months (except over Christmas). You'll have a good chance of seeing the Northern Lights, which look particularly dramatic during dark, cloudless nights. What's more numerous species of whale head to the coast of Norway during the cold winter months. If you book a whale safari in Andenes in January/February, you may see sperm whales, killer whales and humpback whales.
Get orientated with a tour through Northern Norway
Interested in exploring Northern Norway? Best Served Scandinavia run tours throughout the year to Lofoten, Nordland and other parts of the region. This includes a Polar Express tour that takes you on a journey through the Nordland countryside to Bod? You'll get to explore the Lofoten Islands and sail along the dramatic coastline on an overnight cruise with Hurtigruten. The tour runs throughout the year and and prices start from ?,125pp for an 8-day tailor-made journey (flights included).
    
    
    
    </p>
  </div>

</div>

  </div>
  
</div>
                                <!--Item-->
                                <div class="col-sm-4 post-snippet masonry-item">
                                    <a href="#">
                                        <img alt="" src="images/news/news2.jpg" />
                                    </a>
                                    <div class="inner">
                                        <a href="#">
                                            <h4 class="title">12 Best Beaches - one for every month of the year</h4>
                                            <span class="date">November 13, 2017</span>
                                        </a>
                                        <p>
                                            There's a beach for everyone: from the stunning sands of Latin America, to the beautiful British coast, onwards to the Mediterranean's best beach, and then down to a Pacific island paradise.

                                        </p>
<!-- Trigger/Open The Modal -->
<button class="myBtn" onclick="display(2);">Read More</button>
<div id="myModal2" class="modal">

  <div class="modal-content">
    <span class="close">&times;</span>
    <p>
There's a beach for everyone: from the stunning sands of Latin America, to the beautiful British coast, onwards to the Mediterranean's best beach, and then down to a Pacific island paradise.
<h2>1JANUARY - San Juan del Sur Bay, Nicaragua</h2>
 <img alt="" src="images/news/news2-1.jpg" />
Suan Juan des Sur bay
Nicaragua may be a little unknown as a holiday destination but at this time of year is bathing in sunshine and you could be too on their beaches. The San Juan del Sur Bay beach has a dazzling horseshoe shape of muted beige soft sand that is overlooked by a giant statue of Jesus perched north of the bay. The waters around here are calm and very rarely get large enough to surf, making this an ideal beach for young families. For surfers, there's the Playa Maderas a little further along.
There are plenty of fine eateries from which you can enjoy a most delightful sunset. And after sun down, there's a fun vibe of a busy nightlife to enjoy.
- Also read: Why your next holiday should be in Nicaragua
<h2>2FEBRUARY - Isla Espiritu Santo, Sea of Cortez, Baja California Sur, Mexico</h2>
 <img alt="" src="images/news/news2-2.jpg" />
Isla Espiritu Santo, Mexico (c) Sam Beebe/Ecotrust
Oceanographer Jacques Cousteau called Mexico's Sea of Cortez ""the world's greatest aquarium"" because of its unique and rich ecosystem. To get up close and personal with nature, base yourself in La Paz. All the islands are UNESCO protected as World Heritage Biospheres.
Uninhabited Espiritu Santo, absurdly beautiful, is the jewel in the crown: the sea is so turquoise it's like swimming in a bottle of Cura?o. Once ashore you'll find wedding-cake white sands, nail-varnish pink volcanic rocks, clouds of yellow butterflies and strange 300-year old boojum trees.
At Los Islotes, you can snorkel with friendly sea-lions. There are many migratory species such as humpback whales, manta rays and leatherback turtles.
- Also read: What does Mexico have to offer the traveler?
<h2>3MARCH - Kovalam Beach, Kerala, India</h2>
 <img alt="" src="images/news/news2-3.jpg" />
Kovalam Beach, Kerala (c) Ramnath Bhat
Known as the Paradise of the South, Kovalam is arguably the best beach in India. This coconut-forested, crescent-shaped beach is full of character, with the Vizhinjam mosque at the northerly end, brightly-painted boats in the middle, and Ayurvedic massage centres where you can indulge in a rejuvenating herbal, body-toning massage or other holistic therapy. The equivalent of 30p buys you a scrummy curry served on a leaf.
- Also read: Is Kerala really God's own country?
<h2>4APRIL - White Island, Camiguin, The Philippines</h2>
 <img alt="" src="images/news/news2-4.jpg" />
White Island, Camiguin (c) chiba
Small, pear-shaped and known as the Island Born of Fire, Camiguin is home to the spectacular White Island beach, a Tippex-white sandbar with views of two volcanoes, Mt Hibok-Hibok and Mt Vulcan. Close by, the turquoise Bohol Sea hides an unusual treasure - the Sunken Cemetery lying 20 feet underwater following a volcanic eruption in 1871. The island has old ancestral homes and historic churches.
- Also read: Surfing in the Philippines: riding the Cloud 9 in Siargao
<h2>5MAY - Praia de Lopes Mendes, Ilha Grande, Brazil</h2>
 <img alt="" src="images/news/news2-5.jpg" />
Praia de Lopes Mendes, Ilha Grande (c) Tarc?io de Paula Salgado
Just three hours south of Rio de Janiero, Ilha Grande is a small island home to the jaw-achingly beautiful Praia de Lopes Mendes. To get to the beach is quite an undertaking, but well worth the effort - you have to hike through Atlantic forests thick with hummingbirds, butterflies, tropical flowers and waterfalls with Pygmy and Holy monkeys running everywhere. With sand as white and as soft as flour, the beach of Lopes Mendes is irresistible. The island was discovered in 1502 but today preservation is the word with roads only existing in the island's main village.
<h2>6JUNE - Whitehaven Beach, Whitsunday Islands, Queensland, Australia</h2>
 <img alt="" src="images/news/news2-6.jpg" />
Whitehaven Beach, Whitesunday Island (c) Damien Dempsey
Whether you arrive by sea-plane or boat, Whitehaven Beach has oh-so-white sands, rainforest and crystalline waters. It's on a tiny, wild island, part of the 1,250-mile long Great Barrier Reef. The sand is 99.89% pure quartz and you can swim with 1,500 types of multi-coloured fish and observe humpback whales on their annual migration. Seventy-three other islands await discovery, some deserted and ideal for a very intimate and secluded day in the sun.
You can camp on some islands but always remember the advice of the Great Barrier Reef Marine Park Authority: ""take with you photos and memories, and leave behind only bubbles"". Base yourself on the mainland at Airlie Beach Organic B&B, with massage, yoga, meditation and organic meals. They sell original art and crafts made by local Ngaro and Gia people.
- Also read: Finding paradise in Hamilton Island, Great Barrier Reef, Australia
<h2>7JULY - Oxwich Bay, Gower Peninsula, Wales, UK</h2>
 <img alt="" src="images/news/news2-7.jpg" />
Oxwich Bay, Wales (c) Rob Young
You have to look to Wales for our most beautiful beach in Britain. Soft, sandy Oxwich Bay, framed by woodland and overlooked by Penrice Castle, could come straight from an Enid Blyton story. With its Arcadian beauty, in summer Oxwich is an ideal place for safe swimming, a walk on the sands or through the nature reserve with its 600 species of flowering plants.
The Gower, lying west of Swansea, was Britain's first Area of Outstanding Natural Beauty and this year is the 50th anniversary. A footpath leads from Oxwich to St Illtyd's Church, reputedly haunted by a half-man, half-horse creature and further along, the coastline is dotted with castles and ancient monuments and many unspoilt bays.
Nearby Swansea is a city that has reinvented itself in the past 5 years with a thriving local food scene showcasing the region's rich food heritage: laver bread, cockles, Welsh black beef, and sea bass jostle.
<h2>8AUGUST - Guludo Beach, Quirimbas Peninsula, Mozambique</h2>
 <img alt="" src="images/news/news2-8.jpg" />
Macua women on Guludo beach, Mozambique (c) Vivianamaj
Possibly the most beautiful beach in Africa - Guludo beach bewitches: fine, white sand lapped by the Indian Ocean and fringed by wild African bush. This is a true, barefoot paradise where you can snorkel the reef and observe humpback whales (Jun-Oct).
Climb a hill and watch elephants at sunset. An unforgettable trip is to the nearby isle of Rolas, where you'll meet local fisherman, Old Man Coconut Crab, who will take you into the Coral Rock Forest to spot the largest crabs in the world.
Tours go to Guludo village where you can learn to pound cassava, weave mats or buy a colourful fabric and take it to the local tailor who will make you a new shirt or dress.
<h2>9SEPTEMBER - Super Paradise Beach, Mykonos, Greece</h2>
 <img alt="" src="images/news/news2-9.jpg" />
Super Paradise Beach, Mykonos (c) rene boulay
International jet-setters have been visiting tiny Mykonos for 50 years and it's not hard to see why. With bread-crumb sand and rare cerulean waters, Super Paradise Beach is the most peerless beach on an island ringed by magnificent beaches. It's located 9km from town.
Super Paradise - like the rest of the island - is hedonistic, funky and tolerant of alternative lifestyles making it a mecca for gay travellers. Mykonos town has traditional tavernas, designer boutiques and attracts world-famous DJs, making it among the top clubbing destinations in the Med.
- Also read: Top 5 beaches of the Greek Islands
<h2>10OCTOBER - Eilat, Israel</h2>
 <img alt="" src="images/news/news2-10.jpg" />
Dolphin Beach, Eilat (c) israeltourism
With its eclectic mix of bedouin hospitality, middle eastern cuisine and Las Vegas style hotels, Eilat can also work well as a family holiday. The Red Sea is famous for deep sea diving, snorkeling and swimming with dolphins. Romantics can relax in candle-lit spas while the young and young at heart will love the nightlife ranging from tented discos to live band bars. Sun lovers hugging the beach can enjoy the vista of the red mountains of Petra on the horizon while trekkers can join a desert safari by truck, camel or horse and dine with the Bedouins.
- Also read: What is there to see and do in Eilat?
<h2>11NOVEMBER - One Foot Island, Aitutaki Lagoon, Cook Islands</h2>
 <img alt="" src="images/news/news2-11.jpg" />
One Foot Island, Cook Islands (c) Islas para naufragar
Captain Bligh and the crew of the HMS Bounty discovered the Aitutaki Lagoon in 1789. After weeks at sea, they must have thought they were hallucinating at the surreal beauty. Tranquil One Foot Island, lined by giant banyan trees and frangipani, fulfills even the wildest of tropical island dreams. Bring a bottle of champagne and the picnic blanket, for this is the perfect place to make love.
Stay in one of seven water bungalows at the Aitutaki Lagoon Resort & Spa where you can laze in a hammock, have a soothing Polynesian massage, go crab-hunting, learn to husk a coconut or dance the hura.
<h2>12DECEMBER - Playa Flamenco, Culebra, Puerto Rico</h2>
 <img alt="" src="images/news/news2-12.jpg" />
Playa de Flamenco, Culebra, Puerto Rico (c) Diueine Monteiro
Used as a pirate refuge for more than three centuries, Culebra, also known as Snake Island, is seventeen miles east of Puerto Rico. Topped by Mount Resaca, cushioned in green jungle vegetation, Playa Flamenco has some of the clearest seas in the Caribbean with 1 mile of white, coral sand. The beauty of this 7-mile long island inspires impulsive acts, like hugging trees. The reefs are untouched and there are four endangered species of turtles which visit the beach. The Culebra National Wildlife Refuge protects large colonies of terns and boobies.

    </p>
  </div>
</div>
  </div>
</div> 


                                <!--Item-->
                                <div class="col-sm-4 post-snippet masonry-item">
                                    <a href="#">
                                        <img alt="" src="images/news/news3.jpg" />
                                    </a>
                                    <div class="inner">
                                        <a href="#">
                                            <h4 class="title">Ski resort prices slide downhill in top European resorts</h4>
                                            <span class="date">November 15, 2017</span>
                                        </a>
                                        <p>
Cash-conscious skiers can look forward to spending less on their next ski trip than they did last season as prices are dropping at ski resorts across Europe.
According to the annual Post Office Travel Money Ski Resort Report the biggest fall of 13 per cent is at Morzine in the French Alps while the smallest drop of half a per cent is seen at Ruka in Finland. Overall Slovenia is the cheapest resort.

                                        </p>
                                        <!-- Trigger/Open The Modal -->
<button class="myBtn" onclick="display(3);">Read More</button>
<div id="myModal3" class="modal">

  <div class="modal-content">
    <span class="close">&times;</span>
    <p>
<h2>Prices are down in three-quarters of the 22 European resorts surveyed</h2>
Cash-conscious skiers can look forward to spending less on their next ski trip than they did last season as prices are dropping at ski resorts across Europe.
According to the annual Post Office Travel Money Ski Resort Report the biggest fall of 13 per cent is at Morzine in the French Alps while the smallest drop of half a per cent is seen at Ruka in Finland. Overall Slovenia is the cheapest resort.
The report also reveals that Italy challenges Eastern Europe with four resorts in the best value top 10 list and a widening price gap is growing between Canadian and US ski resorts.
Produced in partnership with Crystal Ski Holidays, this year's report has found that prices are down in three-quarters of the 22 European resorts surveyed.
  <img alt="" src="images/news/news3-1.jpg" />
 (c) flickr/Ola Matsson
Slovenia sees the strongest price drop
One of the resorts where prices have plunged since last winter is Slovenia's Kranjska Gora, which emerges as cheapest for the first time. While prices for ski equipment, lift passes, ski school, meals and drinks have dropped six per cent to ?25, the low cost of ski tuition - under half that in nine other resorts - was the key factor enabling the Slovenian resort to power past Bulgaria's Bansko (?52), a six time winner in the annual report.
Italy challenges Eastern Europe
Bansko was pushed into third place by runner-up Bardonecchia (?47), a new inclusion in the cost comparison of resorts rated among the most popular with UK skiers.  Not only is this the highest position ever achieved by an Italian resort, but three others - Sestriere (?10, 5th), Cervinia (?43, 7th) and La Thuile (?54, 10th) feature in the best value top 10 as well.  This signals a strong challenge to Eastern Europe from one of the 'Big Four' ski countries (Austria, France, Italy and Switzerland).
With prices down two per cent, Sestriere was also easily the best value of nine world class resorts surveyed for the report (Cervinia, Selva Val Gardena, Val d'Is?e, Courchevel, Kitzb?el, St Anton, Wengen and Zermatt).
Swiss resorts are the most expensive in Europe
UK skiers choosing Zermatt (?39) can expect to pay over twice as much.  But, although Swiss resorts - also including Wengen (?12) and Saas Fee (?88) - were again the most expensive in Europe, Crystal researchers found price falls of five-six per cent.
Also read:
-	Ski Guide: Murren, Bernese Oberland, Switzerland
________________________________________
Andrew Brown of Post Office Travel Money said:
With increasing pressure on the pocket, resort costs will be a key factor in determining where to ski this year.  Prices are down in most resorts but the best savings to be struck are where the improved exchange rate combines with falling local prices.
This makes Kranjska Gora a great bet for a bargain ski break - but there's a great choice of low cost Italian resorts and price falls in France are greater than in other destinations.  The clear message is to do your homework before booking this year's ski trip.
France registers the biggest drop in costs
The biggest price fall has been in fourth-placed Morzine, the only French resort of five surveyed to make it into the top 10.  At ?00, prices have plummeted 13 per cent since last season.  Overall, France is the ski destination to register the biggest drop in costs: Les Deux Alpes (?62) down 11 per cent, Serre Chevalier (?70) down 9.3 per cent and Val d'Is?e (?06) down 7.6 per cent.
Also read:
-	Ski Guide: La Plagne, France
-	Family friendly skiing at La Plagne, France
Austrian resorts see increased costs
By contrast, the report reveals that UK skiers visiting some popular Austrian resorts face increased costs.  The biggest rise is in Ellmau - up 4.5 per cent to ?32, pushing the Tyrolean resort down to sixth place from fifth a year ago.  There have also been small rises of 3.2 per cent in Kaprun (?88) and 2.7 per cent in Kitzb?el (?47). Set against this, skiers can expect to pay marginally less (1 per cent) in both Mayrhofen (?99) and St Anton (?76).
Also read:
-	Hotel Review: Schlosshotel (and ski resort) Fiss, Tyrol, Austrian Alps
-	Ski Guide: Ischgl, Tyrol, Austria
-	Ski Guide: Gastein Valley, Austria
 
  <img alt="" src="images/news/news3-2.jpg" />
 Gastein ski area
US ski resorts more expensive than their Canadian competitors
In North America the price gap has widened between Canadian and US ski resorts. Even though sterling has risen against the US dollar in recent weeks and is around five per cent stronger year-on-year, increases in local prices made the US ski resorts surveyed more expensive than their Canadian competitors.
Canada's Banff (?07) was best value of six transatlantic ski resorts, followed by Whistler (?54) and Tremblant (?67). The US prices were almost ?00 higher: Breckenridge (?,418), Park City (?,426) and Vail (?,431).
________________________________________
Chris Logan, Crystal Ski Holidays Managing Director, said:
It is great news that prices faced by skiers will be lower than last year in so many resorts. France and Italy are already in hot demand this season and we expect this to strengthen when savvy skiers check out prices and find they can pay less if they pick resorts like Morzine or Sestriere, where both prices and snow are likely to be falling.
Price drop in percentage
<li>Morzine, France	-13%</li>
<li>Les Deux Alpes, France	-11%</li>
<li>Serre Chevalier, France	-9.3%</li>
<li>Val d'Is?e, France	-7.6%</li>
<li>Kranjska Gora, Slovenia	-6%</li>
<li>Zermatt, Switzerland	-6%</li>
<li>Saas Fee, Switzerland	-6%</li>
<li>Wengen, Switzerland	-5%</li>
<li>La Thuile, Italy	-3%</li>
<li>Bansko, Bulgaria	-3%</li>
<li>Sestriere, Italy	-2%</li>
<li>Soldeu, Andorra	-1%</li>
<li>Mayrhofen, Austria	-1%</li>
<li>St Anton, Austria	-1%</li>
<li>Ruka, Finland	-0.5%</li>


    </p>
  </div>
</div>
  </div>
</div> 


                                <!--Item-->
                                <div class="col-sm-4 post-snippet masonry-item">
                                    <a href="#">
                                        <img alt="" src="images/news/news4.jpg" />
                                    </a>
                                    <div class="inner">
                                        <a href="#">
                                            <h4 class="title">11 things surveys taught us about our travel habits</h4>
                                            <span class="date">November 16, 2017</span>
                                        </a>
                                        <p>
       Throughout the year I find my inbox filled with surveys answering questions I had never thought to ask. And though there may be interesting information contained in these snapshots of life, I have to admit to suffering from Survey Zone-out.

                                        </p>
                             <!-- Trigger/Open The Modal -->
<button class="myBtn" onclick="display(4);">Read More</button>
<div id="myModal4" class="modal">

  <div class="modal-content">
    <span class="close">&times;</span>
    <p>
Throughout the year I find my inbox filled with surveys answering questions I had never thought to ask. And though there may be interesting information contained in these snapshots of life, I have to admit to suffering from Survey Zone-out.
Yet I find that there is a lingering FOMA (fear of missing out) feeling - a sign of modern times perhaps? And so for those of you who feel the same way, I have delved right back in and eked out a round-up of the highlights.

Questions you never knew you needed the answer to:
<li>1.	How many calories do you burn at an airport?</li>
<li>2.	Can you identify Morocco or Kazakhstan on a world map?</li>
<li>3.	Which are the most popular short break cities around New Year?</li>
<li>4.	When do you book your summer holidays?</li>
<li>5.	At which age do you really get the most out of a holiday?</li>
<li>6.	Who is better at organising holidays: men or women?</li>
<li>7.	What are Brits concerned with most when on holiday?</li>
<li>8.	Which photos are most popular on social media?</li>
<li>9.	Are Brits clumsier on the slopes than the Dutch?</li>
<li>10.	How often do you holiday with your partner?</li>
<li>11.	Who do you text most?</li>
 
<h2>1We burn 550 calories at airports but consume 2,700</h2>

People waiting in line at the airport (c) flickr/Harsha K R
Apparently walking around the airport is a fantastic workout. Jetcost say you can burn around 550 calories dragging suitcases into the airport and running to the gate. But, wait for it, we consume 2,700 more calories while hanging around to board with food, alcohol and snacks. [top]
 
<h2>2Brits are terrible at geography</h2>

This one perplexed me as I know that Brits are the most intrepid travellers on the planet; except maybe for the Germans. Yet according to Bolsover Cruise Club more than 80 per cent of those surveyed could not identify Morocco or Kazakhstan on a world map and more than 60 per cent had no clue where Peru or Japan are.
The company also uncovered that most Brits had no idea what the currency of Dubai (Dirham), Croatia (Kuna), Iceland (Kr?a), Norway (Krone) and Puerto Rico (Dolar) are. Conversely most knew that the Dollar is used in Canada, the Krona in Sweden, the Peso in Mexico, the Euro in the Netherlands and interestingly that the Yuan Renminbi is used in China. [top]
 
<h2>3Short break searches</h2>

(c) wikimedia/Taxiarchos228
Collating information about the destinations we search for online is a pretty accurate barometer of what's popular. Progressive Money has researched top European city break destinations searched for between the last week of December 2016 and first weeks of January in 2017, as people opted for last minute New Year's Eve and early New Year mini breaks.
Amsterdam was top of the league of searches followed closely by Paris, Barcelona, Berlin and Prague at 5th place. Will we do the same again this year? [top]
 
<h2>4Summer holidays are booked during working hours</h2>

Vouchercloud have uncovered our behaviour patterns when booking a holiday. A vast 30 per cent of employees cheekily book them during office hours especially so in the winter months. And when they do, it usually happens on Tuesdays which incidentally is when the most extravagant holidays are booked. The cheapest holidays are booked on a Saturday. It's very telling isn't it? [top]
 
<h2>5It takes Brits until the age of 31 to really get the most out of a holiday</h2>

So say Virgin Holidays who have managed to reflect the ageing process through holiday preferences. A third of ""care-free"" 18 to 29 year olds are keen to sunbathe, 29 per cent want vibrant nightlife and around a quarter want the chance to be independent. And more people from this age group - 25 per cent - favour adventure holidays than any other age demographic.
As we reach our thirties, all we want is a quiet moment to read a book say 25 per cent, while 27 per cent want to do ""as little as possible"".
Though once in our forties we want to get off the beaten track, nearly a fifth are interested in wine and cocktails and two in five prefer a city break.
Twenty-seven per cent of those in their fifties want to learn something new when holidaying and 30 per cent favour cultural holidays the most.
Three in ten over sixty year olds want to meet interesting people when getting away and are the biggest advocates of multiple destination trips, group tours and cruises.

    </p>
  </div>
</div>
  </div>
</div> 

                                <!--Item-->
                                <div class="col-sm-4 post-snippet masonry-item">
                                    <a href="#">
                                        <img alt="" src="images/news/news5.jpg" />
                                    </a>
                                    <div class="inner">
                                        <a href="#">
                                            <h4 class="title">Q&A: Can I carry Christmas dinner in my hand luggage?</h4>
                                            <span class="date">November 17, 2017</span>
                                        </a>
                                        <p>
                                           My daughter is under the weather and living in France at the moment. So I want to take the Christmas dinner to her to cheer her up. I have a turkey, cranberry sauce and a box of Camembert. Can I take this in my hand luggage and save money on having to take check-in luggage?
                                        </p>
<!-- Trigger/Open The Modal -->
<button class="myBtn" onclick="display(5);">Read More</button>
<div id="myModal5" class="modal">

  <div class="modal-content">
    <span class="close">&times;</span>
    <p>
      <img alt="" src="images/news/news5-1.jpg" />
It is the season to be merry, isn't it? But you may find yourself not so merry if you carry liquids over 100ml through security. Sure, you can take the turkey in your hand luggage but you risk the Cranberry sauce being confiscated. It is regarded as a liquid and if the bottle size is more than 100ml it will be taken from you. Regarding the Camembert, that would be a no-go as it is a very soft cheese and deemed a liquid. So just buy it across the Channel instead - there's plenty of it over there.
Incidentally, any jams, honeys and syrups will be regarded as liquids so remember the 100ml rule.

    </p>
  </div>
</div>
  </div>
</div> 

                                <!--Item-->
                                <div class="col-sm-4 post-snippet masonry-item">
                                    <a href="#">
                                        <img alt="" src="images/news/news6.jpg" />
                                    </a>
                                    <div class="inner">
                                        <a href="#">
                                            <h4 class="title">Hotel Review: Hyatt Regency Tashkent, Uzbekistan</h4>
                                            <span class="date">November 21, 2017</span>
                                        </a>
                                        <p>
                                            A genuine 5* hotel was long overdue in Tashkent, so the opening of the impressive Hyatt Regency Tashkent in 2016 was incredibly welcome. This dazzling white structure is in the heart of Uzbekistan's capital, right next door to the National Library and within easy walking distance of Amir Timur Square.
The designers have balanced international style and standards with aspects of Uzbek art and craftsmanship, creating a striking, contemporary property with a strong sense of place.

                                        </p>
<!-- Trigger/Open The Modal -->
<button class="myBtn" onclick="display(6);">Read More</button>
<div id="myModal6" class="modal">

  <div class="modal-content">
    <span class="close">&times;</span>
    <p>
     <img alt="" src="images/news/news6-1.jpg" />
A genuine 5* hotel was long overdue in Tashkent, so the opening of the impressive Hyatt Regency Tashkent in 2016 was incredibly welcome. This dazzling white structure is in the heart of Uzbekistan's capital, right next door to the National Library and within easy walking distance of Amir Timur Square.
The designers have balanced international style and standards with aspects of Uzbek art and craftsmanship, creating a striking, contemporary property with a strong sense of place.
Who For?
Options for discerning business and leisure travellers in Tashkent are still few and far between, in spite of the recent boom in tourism. The Hyatt Regency is refreshing because the management understands exactly what international visitors expect, and have trained the staff thoroughly to be able to meet those demands. The hotel is a rare find in top-end dining, a full range of facilities, and attention to detail, this is the place to stay.
<h2>Accommodation</h2>
 <img alt="" src="images/news/news6-2.jpg" />
There are 300 guest rooms at Hyatt Regency Tashkent, 52 of which are suites. You get a lot of space for your money, and large windows which overlook the gardens and local monuments. The neutral decor is accented with occasional hints of colour in the textiles and also some attractive original artworks.
Hyatt Tashkent bedroom
Beds in the rooms are absolutely huge, with those crisp white linens which somehow only luxury hotels manage to maintain. The air con is a god-send on hot summer nights, but it's not so loud that it makes it hard to sleep.
Hyatt Tashkent bathroom
Bathrooms are pretty spectacular. There are separate bath tubs and rain showers, surrounded by marble, glass, and chrome. The shower is pretty powerful, which is always welcome, and everything is immaculately clean.
<h2>Facilities</h2>
 <img alt="" src="images/news/news6-3.jpg" />
Hyatt Tashkent gym
The Hyatt Regency Tashkent has been built with leisure in mind. The StayFit Gym has state-of-the-art fitness equipment, and you can break a sweat on the running machines whilst looking out over the city through floor to ceiling windows.
Hyatt Tashkent1 swimming pool
The 20m swimming pool is long enough to swim proper lengths, but you can also take a brief dip before chilling out in the jacuzzi, sauna, and steam rooms. Massages and treatments in the Arya Spa are said to have been inspired by the wellness philosophies of the ancient Silk Road, in keeping with the hotel's location, and if you want to freshen up your appearance there is a beauty salon as well. Meeting and event spaces complete the Hyatt Regency's facilities.
<h2>Food and Drink</h2>
 <img alt="" src="images/news/news6-4.jpg" />
Uzbek cuisine is yet to take over the world, but in the Hyatt Regency's Khiva Cafe it's made with the freshest of ingredients and served with a flair. Treat yourself to delicious plov (Uzbekistan's version of a biriyani), succulent kebabs, and nourishing soups with just a hint of spice.
Upstairs in the Sette Pizza Bistro and Bar the chefs have recreated the laidback atmosphere of the Mediterranean. Use of authentic ingredients and traditional pizza ovens capture the true flavours of Italy, and the homemade gelato is the perfect finale to your meal.
Hyatt Tashkent terrace
The restaurant has skyline views of Tashkent but on a warm night the very best thing to do is to head outside onto the rooftop terrace to enjoy a glass of limoncello or a cocktail from the bar.
<h2>What's Nearby?</h2>
 <img alt="" src="images/news/news6-5.jpg" />
The Hyatt Regency is in an ideal location for sightseeing. You can walk in a matter of minutes to the State History Museum, which has a quarter of a million exhibits including archaeological finds, and to the State Fine Arts Museum. These two museums will give you a good overview of Uzbekistan's history, including the golden age of the Silk Road.
Amir Timur Square is really the centre of Tashkent, and it has an eclectic combination of modern and Soviet-era architecture. Its also the closest metro station to the Hyatt Regency, and Tashkent's stunning metro is definitely worth exploring as every station is decorated in a different way, often with sculptures, murals, and mosaics.
Also read: Discovering Uzbekistan: At the centre of the Silk Road
Although Tashkent has fewer tourist sites than Samarkand and Bukhara, it's still well worth getting out and exploring the city. Kalpak Travel's Best of Uzbekistan tour includes the atmospheric Old City with its complex of holy buildings and bustling Chorsu Bazaar, as well as grand Independence Square.
<h2>Wi-Fi</h2>
 <img alt="" src="images/news/news6-6.jpg" />
Wi-Fi is available throughout the hotel.
Room Rates
Rooms at Hyatt Regency Tashkent start from ?31 for a standard room with king or twin beds. Bed and breakfast options are also available.

    </p>
  </div>
</div>
  </div>
</div> 

                                <!--Item-->
                                <div class="col-sm-4 post-snippet masonry-item">
                                    <a href="#">
                                        <img alt="" src="images/news/news7.jpg" />
                                    </a>
                                    <div class="inner">
                                        <a href="#">
                                            <h4 class="title">No more credit or debit card fees in Europe from 2018</h4>
                                            <span class="date">November 26, 2017</span>
                                        </a>
                                        <p>
                                            When you pay by credit card you are often charged a fee to pay for the privilege. Since 2013 companies could pass on the exact sum of charge to their customer - i.e. they are not allowed to profit from these surcharges. However this is usually around 2 per cent of the transaction which sounds small but these fees can mount up.
That's all about to change. From 13 January 2018, these surcharges will be a thing of the past in the European Union both online or in-store.

                                        </p>
<!-- Trigger/Open The Modal -->
<button class="myBtn" onclick="display(7);">Read More</button>
<div id="myModal7" class="modal">

  <div class="modal-content">
    <span class="close">&times;</span>
    <p>
    <img alt="" src="images/news/news7-1.jpg" />
When you pay by credit card you are often charged a fee to pay for the privilege. Since 2013 companies could pass on the exact sum of charge to their customer - i.e. they are not allowed to profit from these surcharges. However this is usually around 2 per cent of the transaction which sounds small but these fees can mount up.

That's all about to change. From 13 January 2018, these surcharges will be a thing of the past in the European Union both online or in-store.

<h2>The new rules</h2>
Simply put from 13th January ALL surcharges are banned thanks to a European directive known as the Payment Services Directive (PSD2). There will be no charges for paying by debit or credit card. This includes American Express and linked ways of paying such as PayPal or Apple Pay.

The worst offenders in the travel industry at the moment tend to be airlines. They will have to change their payment policies.

<h2>Will companies raise their prices?</h2>
This sounds like good news. But is it? There are fears that travel companies whose margins are sometimes minimal may be forced to raise their prices.

But the word on the grapevine is that travel companies will look to collaborate by adding anciliary services to boost profits.

Rad Sofronijevic, chief operating officer at Midcounties, told TTG that the implementation of PSD2, which will prohibit businesses from charging customers for paying by debit and credit cards, was ""even more reason"" to focus on the benefits of ancillaries and foster greater collaboration. They have already partnered with Holiday Extras, Flexible Autos and Attraction World for the ""Stronger Together"" initiative.

""Having this partnership is a great way for agents to learn about new products and soften the impact [of PSD2],"" said Sofronijevic. ""It's also giving agents a chance to enhance their service and offer customers more.""

<h2>This is EU Directive so will it still be law after Brexit in 2019?</h2>
This directive has already been incorporated into UK law, following a vote in parliament. It will therefore remain law after March 2019, when the UK leaves the EU. Whether or not it will be repealed, time will tell.

<h2>How much will consumers save?</h2>
Cardholders are often charged fees of around 2 per cent. Some outlets charge a flat fee regardless of the spend. Thomas Cook charge 2 per cent, while Flybe charges 3 per cent on credit card and Paypal transactions.

Some airlines, such as easyJet for instance, do not charge for credit or debit card payments but they do charge a ?5 admin fee.

<h2>Why are the rules changing?</h2>
Stephen Barclay, the British Economic Secretary to the Treasury, said:

"Rip-off charges have no place in a modern Britain and that's why card charging in Britain is about to come to an end.

This is about fairness and transparency, and so from next year there will be no more nasty surprises for people at the check-out just for using a card.

These small charges can really add up and this change will mean shoppers across the country have that bit of extra cash to spend on the things that matter to them."

    </p>
  </div>
</div>
  </div>
</div> 

                            
                            <div class="clear"></div>
                            
                        </div>

                    </div>
                    <!-- Row End -->
                    
                </div>
            </div>
            <!-- Col End -->
        </div>

    </div>
</section>
<!--News End-->

<!-- Footer -->
<div class="footer white_txt image_bck" data-color="#0e0e0e">
    <div class="container">
        
        <div class="row">
            <div class="col-md-3 col-sm-3">
                <div class="logo text-left">
                    <a href="#"><b>Berg</b></a>
                </div>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua.
            </div>
            
            <div class="col-md-3 col-sm-3 hidden-xs">
                <div class="widget">
                    <h4>Recent Posts</h4>
                    <ul class="list-unstyled">
                        <li>
                            <a href="#">Labore et dolore magna aliqua</a>
                            <span class="date">July
                                <span class="number">22, 2015</span>
                            </span>
                        </li>
                        <li>
                            <a href="#">Labore et dolore magna aliqua</a>
                            <span class="date">July
                                <span class="number">14, 2015</span>
                            </span>
                        </li>
                        <li>
                            <a href="#">Labore et dolore magna aliqua</a>
                            <span class="date">July
                                <span class="number">11, 2015</span>
                            </span>
                        </li>
                    </ul>
                </div>

            </div>
            
            <div class="col-md-3 col-sm-3 hidden-xs">
                <div class="widget">
                    <h4>Latest Updates</h4>
                    <ul class="list-unstyled">
                        <li>
                            <a href="#">Labore et dolore magna aliqua</a>
                            <span class="date">July
                                <span class="number">22, 2015</span>
                            </span>
                        </li>
                        <li>
                            <a href="#">Labore et dolore magna aliqua</a>
                            <span class="date">July
                                <span class="number">14, 2015</span>
                            </span>
                        </li>
                        <li>
                            <a href="#">Labore et dolore magna aliqua</a>
                            <span class="date">July
                                <span class="number">11, 2015</span>
                            </span>
                        </li>
                    </ul>
                </div>
                <!--end of widget-->
            </div>
            
            <div class="col-md-3 col-sm-3 hidden-xs">
                <div class="widget">
                    <h4>Contacts</h4>
                    <span class="contacts_ti ti-mobile"></span>+11 (0) 200 1111 001<br />
                    <span class="contacts_ti ti-mobile"></span>+11 (0) 200 1111 002<br />
                    <span class="contacts_ti ti-email"></span><a href="mailto:support@theberg.com">support@theberg.com</a><br />
                    <span class="contacts_ti ti-location-pin"></span>Australia place nice, RD nice DHA Road, state pace 786
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
                        
                        <li>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Facebook">
                                <i class="ti-facebook"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Twitter">
                                <i class="ti-twitter-alt"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Dribbble">
                                <i class="ti-dribbble"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Vimeo">
                                <i class="ti-vimeo-alt"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Copyrights End -->


</div>
<!-- Footer End -->
<script>
$(document).ready(function() {
	var city0 = $('input[name="cityname0"]').val();
	var city1 = $('input[name="cityname1"]').val();
	var city2 = $('input[name="cityname2"]').val();
	var conti0 = $('input[name="continame0"]').val();
	var conti1 = $('input[name="continame1"]').val();
	var conti2 = $('input[name="continame2"]').val();
	
	requestAJAX(conti0, city0, 0);
	requestAJAX(conti1, city1, 1);
	requestAJAX(conti2, city2, 2);

});
function requestAJAX(conti, loc, num) {
	/* yahoo weather api */
	var url = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22'
	url += loc;
	url += '%22)%20and%20u%3D%27c%27&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys';
	
	
	$.ajax({
		url : url,
		success : function(data) {
			
			currentFunc(data,num); // 현재 날씨
			forcastFunc(data,num); // 미래 날씨
		}
	});
	/* yahoo weather api end*/
};
function currentFunc(data,num) {
	var output = '';
	var loc = $(data).find('yweather\\:location,location').attr('country');
	var city = $(data).find('yweather\\:location,location').attr('city');
	var lastBuildDate = $(data).find('lastBuildDate').text();
	var date = $(data).find('yweather\\:condition,condition').attr('date');
	var speed = $(data).find('yweather\\:condition,condition').attr('speed');
	var code = $(data).find('yweather\\:condition,condition').attr('code');
	var temp = $(data).find('yweather\\:condition,condition').attr('temp');
	var text = $(data).find('yweather\\:condition,condition').attr('text');


	output += '<h2 style="color:white;">' + text.substring(0, text.indexOf(' ')) + '<br>' + text.substring(text.indexOf(' ') + 1, text.length) + '</h2>';
	output += '<h1 style="color:white;">' + temp + ' Degree </h1>';
	if(num==0) {
		$('#current0').html(output);	
	}else if(num==1) {
		$('#current1').html(output);
	}else if(num==2) {
		$('#current2').html(output);
	}
	
};

function forcastFunc(data,num) {
	var output = '';
	output += '<tbody>';
	$(data).find('yweather\\:forecast,forecast').each(function() {
		var day = $(this).attr('day');
		var code = $(this).attr('code');
		var date = $(this).attr('date');
		var high = $(this).attr('high');
		var low = $(this).attr('low');
		var text = $(this).attr('text');

		var content = text + ' today with a high of ' + high + '℃ and a low of ' + low + 'degree.';
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
	if(num==0) {
		$('#forcast0 > table').html(output);	
	}else if(num==1) {
		$('#forcast1 > table').html(output);
	}else if(num==2) {
		$('#forcast2 > table').html(output);
	}
	
	$('.winfo').hide();
};
var modal = '';
function display(f) {
	modal = document.getElementById('myModal'+f);
	 modal.style.display = "block";

	}
//Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
// When the user clicks on <span> (x), close the modal
span.onclick = function() {
	modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}
// Get the modal
</script>
    