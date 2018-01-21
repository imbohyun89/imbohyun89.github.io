<!--Intro-->
<section class="intro" >
       
        <div class="intro_item">

            <!-- Over -->
            <div class="over" data-opacity="0.4" data-color="#000"></div>
            <div class="into_back image_bck"  data-image="images/travel1.jpg"></div>
            

            <div class="inside_intro_block">
                <div class="ins_int_item white_txt bordered_wht_border text-center">
                    <div class="simple_block simple_block_sml">
                    <div class="col-md-12">
		             <h1 class="text-center" style="font-family: 'Kanit', sans-serif;
		             font-size: 250%; margin: 0 0 10px;">LOGIN 
		             </h1>
				</div>
                        <form id="font">
                            <input type="text" class="form-control form-opacity" name="id" placeholder="User ID">
                            <input type="password" class="form-control form-opacity" name="pwd" placeholder="Password">
                            <input type="button" onclick="login(this.form);" class="btn btn-white btn-block no-margin" value="Login">
                            <a href="register.wt" class="btn btn-white btn-block" style="margin: 10px 0 0 ;">Register</a>
                            <small>Forgot your password? <a href="#"> Click Here To Reset</a></small>
                        </form>
                    </div>
                </div>
            </div>

        </div>
  
</section>
<!-- Intro End -->
    



<!-- Footer -->
<div class="footer white_txt bordered_wht_border image_bck" data-color="#0e0e0e">
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

$(function() {
	var nopwd = "${nopwd}";
	var noid = "${noid}";
	var id = $('input:text[name="id"]');
	if(noid == 'noid') {
		alert('not exist id');
		id.focus();
		return;
	}
	if(nopwd == 'nopwd') {
		alert('wrong id or pwd');
		id.focus();
		return;
	}
});
function login(f) {
	var id = f.id;
	var pwd = f.pwd;
	if(id.value == '') {
		alert('input id please');
		id.focus();
		return;
	}
	if(pwd.value == '') {
		alert('input password please.');
		pwd.focus();
		return;
	}
	
	f.method = 'POST';
	f.action = 'loginimpl.wt';
	f.submit();
}
</script>
