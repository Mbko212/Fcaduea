<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-12 pb-3">
                <img src="img/logo-1.png" class="img-fluid" alt="">
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-3 logo-m widgets2">
                <h4 class="pb-2 fw-400" style="margin-left: 10px;">Menu</h4>
                <ul>
                    <li> <a href="#">New </a></li>
                    <li> <a href="#"> Storage </a></li>
                    <li> <a href="#"> Décor </a></li>
                    <li> <a href="#"> Candles </a></li>
                    <li> <a href="#"> Accessories </a></li>
                    <li> <a href="#"> Gifts </a></li>
                </ul>
            </div>
            <div class="col-md-3 logo-m widgets2">
                <h4 class="pb-2 fw-400" style="margin-left: 10px;">Quick Links</h4>
                <ul>
                    <li> <a href="#">Online Catalog </a></li>
                    <li> <a href="wishlist.php">My Wishlist</a></li>
                    <li> <a href="#"> Lorem </a></li>
                    <li> <a href="#"> Lorem </a></li>
                    <li> <a href="#"> Lorem </a></li>
                    <li> <a href="#"> Dollar </a></li>
                </ul>
            </div>
            <div class="col-md-3 logo-m widgets2">
                <h4 class="pb-2 fw-400" style="margin-left: 10px;">Help</h4>
                <ul>
                    <li> <a href="#"> FAQs </a></li>
                    <li> <a href="#"> Return </a></li>
                    <li> <a href="#"> Shipping + tracking </a></li>
                    <li> <a href="#"> Lorems </a></li>
                </ul>
            </div>
            <div class="col-md-3 logo-m widgets2">
                <h4 class="pb-2 fw-400" style="margin-left: -30px;">Newsletter</h4>
                <p class="pt-4">Subscribe to our Newsletter</p>
                <form class="newsletter">
                    <div class="form-group row">
                        <div class="col-sm-12">
                            <input type="email" class="form-control" id="inputEmail" placeholder="Write Your Email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-12">
                            <button class="btn btn-primary btn-block" type="button"> Submit </button>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>


    </div>
    <div class="container-fluid" style="background-color: #FEF2F1;">
        <div class="container">
            <div class="row p-2">
                <div class="col-md-6 pl-5">
                    <p class="copyright text-left">Copyright 2021. All rights Reserved
                    <p>
                </div>
                <div class="col-md-6">
                    <ul class="social-network social-circle text-right">
                        <li><a href="#" class="icoFacebook" title="Facebook"><img class="w-30" src="img/facebook.svg"
                                    alt="facebook"></a></li>
                        <li><a href="#" class="icoGoogle" title="youtube"><img class="w-50" src="img/youtube.svg"
                                    alt="youtube"></a></li>
                        <li><a href="#" class="icoInsta" title="Rss"><img class="w-50" src="img/instagram.svg"
                                    alt="insta"></a></li>
                        <li><a href="#" class="icoTwitter" title="Twitter"><img class="w-50" src="img/twitter.svg"
                                    alt="twitter"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>


<script language="JavaScript" src="js/jquery.min.js"></script>
<script language="JavaScript" src="js/popper.js"></script>
<script language="JavaScript" src="js/bootstrap.min.js"></script>
<script language="JavaScript" src="js/main.js"></script>
<script language="JavaScript" src="js/scripts.js"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="slick/slick.min.js"></script>
<script type="text/javascript" src="slick/slick.js"></script>

<script>
$(document).ready(function() {
    $(".dropdown").hover(function() {
        var dropdownMenu = $(this).children(".dropdown-menu");
        if (dropdownMenu.is(":visible")) {
            dropdownMenu.parent().toggleClass("open");
        }
    });
});
</script>
<script>
$('.count').each(function() {
    $(this).prop('Counter', 0).animate({
        Counter: $(this).text()
    }, {
        duration: 4000,
        easing: 'swing',
        step: function(now) {
            $(this).text(Math.ceil(now));
        }
    });
});
</script>
<script>
// $(document).ready(function() {
//     $(".regular").slick({
//         arrow: false,
//         autoplay: true,
//         infinite: true,
//         slidesToShow: 6,
//         slidesToScroll: 3,
//         responsive: [{
//             breakpoint: 1024,
//             settings: {

//                 slidesToShow: 2,
//                 slidesToScroll: 3,
//                 infinite: true,
//                 dots: false
//             }
//         }]

//     });

// });

$('.regular').slick({
    // dots: true,
    slidesToShow: 6,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 2000,
    responsive: [{
            breakpoint: 1024,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 3,
                infinite: true,
                dots: true
            }
        },
        {
            breakpoint: 600,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 2
            }
        },
        {
            breakpoint: 480,
            settings: {
                slidesToShow: 6,
                slidesToScroll: 6
            }
        }
    ]
});

$(document).ready(function() {
    $(".bannerSlider").slick({
        arrow: false,
        autoplay: true,
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        responsive: [{
            breakpoint: 1024,
            settings: {

                slidesToShow: 1,
                slidesToScroll: 1,
                infinite: true,
                dots: false
            }
        }]

    });
});

// Step Form Js
$(document).ready(function(){
    $("#goOne").click(function(){
        $('#step2 , #second_tab').addClass('active');
    });

    $("#goOne").click(function(){
        $('#step1 , #first_tab').removeClass('active');
    });
});
$(document).ready(function(){
    $("#goTwo").click(function(){
        $('#step3 , #third_tab').addClass('active');
    });

    $("#goTwo").click(function(){
        $('#step2 , #second_tab').removeClass('active');
    });
});
// Step Form Js

// Mobile Nav
$('document').ready(function() {
    $('.header-blue .canvas-icon i').click(function() {
        $(".header-blue .mobile-header").addClass('show');
    });

    $('.header-blue .mobile-header .cancel').click(function() {
        $(".header-blue .mobile-header").removeClass('show');
    });
});
// Mobile Nav

</script>
</body>

</html>