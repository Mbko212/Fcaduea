@extends('layouts.front.app')

@section('title','Welcome To '. $web_config['name']->value.' Home')

@section('content')


    <div class="home-banner fullwidth">
        <ul class="bannerSlider">
            <!--  1. slide  -->
            @foreach($banners as $k=>$v)
                <li class="slide">
                    <a href="#">
                        <div class="container">
                            <div class="slide__text row">
                                <div class="col-md-12">
                                    <div class="d-flex pb-2">
                                        <h5 class="sub-heading pr-3 fw-500 pt-3 font-30">Welcome To </h5>
                                        <img src="{!! frontImage('logo-2.png') !!}" height="50" alt="">
                                    </div>
                                    <h3 class="fw-600 font-60 subtitle">{{ $v->title }}</h3>
                                    {{--                            <h3 class="fw-600 font-60 subtitle">Successful Event </h3>--}}
                                    <p class="text-black">
                                        {!! $v->description !!}
                                    </p>
                                    <div class="py-4"></div>
                                    <span>
                                <a href="{{ $v->url }}" class="btn btn-primary">Shop Now</a>
                            </span>
                                    <span class="pl-5">
                                <a href="{{ route('shop') }}" class="btn-underline">Browse Our Product </a>
                            </span>
                                    <br>
                                </div>
                            </div>
                        </div>
                        <div class="slide__image">
                            <img src="{!! StorageImage('banner/'.$v->photo) !!}" alt=""/>
                        </div>
                    </a>
                </li>
            @endforeach
        </ul>
    </div>

    <section class="boxes">
        <div class="container">
            <div class="row about-section py-5 text-center">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div style="background-image: url('img/back-1.png');
                background-repeat: no-repeat; background-size:contain; background-position: center; padding:20px; ">
                        <h5 class="sub-heading font-30 fw-500">We Have the best Products for</h5>
                        <h2 class="title primary">Your Events</h2>
                    </div>
                    <p class="pt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                        incididunt ut
                        labore et dolore <br> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                        laboris nisi
                        ut aliquip.</p>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="d-none row justify-content-center align-middle align-items-center">
                <div class="col-md-8 pt-2 no-pad-right">
                    <div class="box">
                        <img src="{!! frontImage('product-banner-1.jpg') !!}" class="img-fluid" alt=""
                             style="width:100%; height:586px;">
                        <div class="bottom-left"><a href="{{ route('shop') }}" class="btn-underline" tabindex="-1">Browse
                                Our Product </a>
                        </div>
                        <div class="top-left">Exclusive discount of 20%</div>
                        <div class="centered pl-5">
                            <h2 class="pl-4">Table Decoration <br>
                                Lorem ipsum
                            </h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 pt-2 no-pad-left">
                    <div class="box cs-box">
                        <img src="{!! frontImage('product-banner-2.jpg') !!}" alt="" class="img-fluid"
                             style="width:100%; height:586px;">
                        <div class="bottom-left"><a href="{{ route('shop') }}" class="btn-underline" tabindex="-1">Browse
                                Our Product </a>
                        </div>
                        <div class="top-left">Exclusive discount of 20%</div>
                        <div class="centered pl-5">
                            <h2 class="pl-3">Candle <br>
                                Lorem ipsum
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row pt-2 justify-content-center align-middle align-items-center">
                @if(count($categories) == 4)
                    @foreach($categories as $k=>$v)
                        @php
                            $a=array(8,4);
                        @endphp
                        {{--                {{ ($k%2 == 0)? 'col-md-7  no-pad-right' : 'col-md-5' }}--}}
                        <div class="pt-2 col-md-{{ $a[array_rand($a,1)] }}">
                            <div class="box pad-right">
                                <img src="{!! frontImage('cover-1.png') !!}" class="img-fluid" alt=""
                                     style="width:100%; height:342px;">
                                <div class="bottom-left">
                                    <a href="{{ route('shop',[$v->slug]) }}" class="btn-underline " tabindex="-1">Browse
                                        Our Product </a>
                                </div>

                                <div class="m-centered">
                                    <h2 class="pl-4">{{ $v->name }}</h2>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endif

            </div>
        </div>
    </section>

    <section class="uncover-banner hero" style="background: url('{{ frontImage('banner-2.jpg') }}'); ">
        <div class="container">
            <div class="row py-5">
                <div class="col-md-12 pb-3">
                    <h5 class="sub-heading fw-600 font-40 line-height-1">Let our products make</h5>
                    <h2 class="title fw-600 font-60 line-height-1">Your Events </h2>
                    <h2 class="title font-60 fw-400 line-height-1 blacksword">Successful</h2>
                    <br>
                    <a href="{{ route('shop') }}" class="btn btn-primary" tabindex="-1">Shop Now</a>
                </div>
            </div>
        </div>
    </section>

    <section class="hero">
        <div class="container">
            <div class="row py-5 align-middle align-items-center">
                <div class="col-md-6 pb-3">
                    <img src="{!! frontImage('thumb-1.jpg') !!}" class="img-fluid" alt="">
                </div>
                <div class="col-md-6 pb-3">
                    <h5 class="sub-heading fw-500 font-30">We have the best Products</h5>
                    <h2 class="title fw-600 font-40">For Your Events</h2>
                    <br>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                        labore
                        et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
                        ut
                        aliquip.
                    </p>
                    <p>labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
                        nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                        velit
                        esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                        sunt in
                        culpa qui officia deserunt mollit anim id est laborum.</p>
                    <br>
                    <a href="{{ route('shop') }}" class="btn btn-primary" tabindex="-1">Shop Now</a>
                </div>
            </div>
        </div>
    </section>

    <section class="hero" style="background-color: #FEF2F1;">
        <div class="container">
            <div class="row py-5 text-center">
                <div class="col-md-12">
                    <h5 class="sub-heading fw-500 font-40">Browse Our Products</h5>
                    <h2 class="title fw-600 font-40 line-height-1">Your Events</h2>
                </div>
            </div>
        </div>
        <div class="regular">
            @foreach($featured_products as $k=>$v)
                <?php $images = json_decode($v->images, true); ?>
                <div>
                    <a href="{{ route('product.details',$v->slug) }}">
                        @if(count($images) > 0)
                            <img class="card-img-top"
                                 src="{!! \App\CPU\ProductManager::product_image_path('product','/'.$images[0]) !!}"
                                 alt="Card image cap">
                        @else
                            <img class="card-img-top" src="{!! frontImage('Clip.png') !!}" alt="Card image cap">
                        @endif
                    </a>
                </div>
            @endforeach

        </div>
        <div class="text-center">
            <a href="{{ route('shop') }}" class="btn-underline" tabindex="-1">Browse Our Product </a>
        </div>
    </section>

    <section class="hero">
        <div class="container">
            <div class="row py-5">
                <div class="col-md-6 pb-3">
                    <img src="{!! frontImage('os9.jpg') !!}" class="img-fluid" alt="">
                </div>
                <div class="col-md-6 pb-3">
                    <p>
                        labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                        laboris
                        nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                        velit
                        esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                        sunt in
                        culpa qui officia deserunt mollit anim id est laborum.
                    </p>
                    <h5 class="sub-heading fw-500 font-30">Have A look at </h5>
                    <h2 class="title fw-700 font-30">Our Partners</h2>
                    <img src="{!! frontImage('img-all-logo.png') !!}" class="img-fluid" alt="" style="height: 170px">
                    <!-- <div class="backlight">
                        <ul class="inlineblock">
                            <li><img src="img/cl-1.png" alt=""></li>
                            <li><img src="img/cl-2.png" alt=""></li>
                            <li><img src="img/cl-1.png" alt=""></li>
                            <li><img src="img/cl-2.png" alt=""></li>
                        </ul>
                        <ul class="inlineblock">
                            <li><img src="img/cl-3.png" alt=""></li>
                            <li><img src="img/cl-4.png" alt=""></li>
                            <li><img src="img/cl-3.png" alt=""></li>
                            <li><img src="img/cl-4.png" alt=""></li>
                        </ul>
                    </div> -->
                    <br>
                    <a href="{{ route('shop') }}" class="btn btn-primary mt-5" tabindex="-1">Shop Now</a>
                </div>
            </div>
        </div>
    </section>

    <section class="hero" style="background-color: #FEF2F1;">
        <div class="container">
            <div class="row py-5 text-center">
                <div class="col-md-12">
                    <h5 class="sub-heading fw-400 font-40">Browse Our Products</h5>
                    <h2 class="title fw-600 font-40">Your Events</h2>
                </div>
            </div>
        </div>
        <div class="regular">
            @foreach($featured_products as $k=>$v)
                <?php $images = json_decode($v->images, true); ?>
                <div>
                    <a href="{{ route('product.details',$v->slug) }}">
                        @if(count($images) > 0)
                            <img class=" card-img-top"
                                 src="{!! \App\CPU\ProductManager::product_image_path('product','/'.$images[0]) !!}"
                                 alt="Card image cap">
                        @else
                            <img class="card-img-top" src="{!! frontImage('Clip.png') !!}" alt="Card image cap">
                        @endif
                    </a>
                </div>
            @endforeach
        </div>
        <div class="container">
            <div class="row  text-center">
                <div class="col-md-12">
                    <a href="https://instagram.com" class="btn-underline fw-600">Follow Us On Intagram </a>
                </div>
            </div>
        </div>
    </section>

@endsection
