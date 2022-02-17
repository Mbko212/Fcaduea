<link rel="stylesheet" href="{!! asset('public/assets/front/fonts/Blacksword.otf') !!}">
<link href="http://fonts.cdnfonts.com/css/blacksword" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&family=Teko:wght@300&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="{!! asset('public/assets/front/css/style.css') !!}">
<link rel="stylesheet" href="{!! asset('public/assets/front/css/st-style.css') !!}">
<link rel="stylesheet" href="{!! asset('public/assets/front/slick/slick.css') !!}">
<link rel="stylesheet" href="{!! asset('public/assets/front/slick/slick-theme.css') !!}">
<link rel="icon" href="{!! asset('public/assets/front/img/logo-cloud.png.png') !!}" type="image/png" sizes="16x16">



{{--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--}}
{{--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--}}
{{--<link rel="stylesheet" href="{!! frontCss('style.css') !!}">--}}
{{--<link rel="stylesheet" href="{!! frontCss('custom.css') !!}">--}}
{{--<link rel="stylesheet" href="{!! frontCss('far.css') !!}">--}}
{{--<link rel="stylesheet" type="text/css" href="{!! frontCss('slick.css') !!}">--}}
{{--<link rel="stylesheet" type="text/css" href="{!! frontCss('slick-theme.css') !!}">--}}
{{--<link rel="shortcut icon" type="image/ftr-lgo.png" href="{!! frontImage('ftr-lgo.png') !!}">--}}
{{--<link rel="apple-touch-icon" sizes="180x180"--}}
{{--      href="{!! asset('storage/app/public/company') .'/'. $web_config['fav_icon']->value !!}">--}}
{{--<link rel="icon" type="image/png" sizes="32x32"--}}
{{--      href="{!! asset('storage/app/public/company') .'/'. $web_config['fav_icon']->value !!}">--}}
{{--<link rel="stylesheet" href="{!! frontCss('jquery.ui.all.css') !!}">--}}
{{--<link rel="stylesheet" href="{!! frontCss('demos.css') !!}">--}}
<link rel="stylesheet" href="{!! asset('public/assets/back-end/css/toastr.css') !!}"/>
<meta name="csrf-token" content="{!! csrf_token() !!}">

@stack('css')
