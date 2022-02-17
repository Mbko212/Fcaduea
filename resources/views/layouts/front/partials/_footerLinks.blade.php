<script src="{!! frontJs('jquery.min.js') !!}"></script>
<script language="JavaScript" src="{!! frontJs('popper.js') !!}"></script>
<script language="JavaScript" src="{!! frontJs('bootstrap.min.js') !!}"></script>
<script language="JavaScript" src="{!! frontJs('main.js') !!}"></script>
<script language="JavaScript" src="{!! frontJs('scripts.js') !!}"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="{!! asset('public/assets/front/slick/slick.min.js') !!}"></script>
<script type="text/javascript" src="{!! asset('public/assets/front/slick/slick.js') !!}"></script>

{{--Toastr--}}
<script src="{!! asset("public/assets/back-end/js/toastr.js") !!}"></script>
{{--<script src="{!! frontJs('jquery.zoom.js') !!}"></script>--}}

{!! Toastr::message() !!}


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

@if ($errors->any())
    <script>
        @foreach($errors->all() as $error)
        toastr.error('{{$error}}', Error, {
            CloseButton: true,
            ProgressBar: true,
            positionClass : "toast-top-right",
        });
        @endforeach
    </script>
@endif
@stack('js')
