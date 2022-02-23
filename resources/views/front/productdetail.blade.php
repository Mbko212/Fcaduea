@extends('layouts.front.app')

@section('title','Welcome To '. $web_config['name']->value.' '.$product->name)

@section('content')

<!-- Header include -->
<!-- Header include -->
<!-- home made section  -->
<!-- Stylesheet -->
<link rel="stylesheet" href="{!! frontCss('productdetail.css') !!}">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- Stylesheet -->
<section class="homemade-sec">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-6 col-lg-6">
                <?php $images = json_decode($product->images,true); ?>
                <div class="homemade-img">
                    @if(count($images) > 0)
                        <figure><img src="{!! productImage('',$images[0]) !!}" alt=""></figure>
                    @else
                        <figure><img src="{!! frontImage('Clip.png') !!}" alt=""></figure>
                    @endif
                </div>
            </div>


            <div class="col-md-6 col-sm-6 col-xs-6 col-lg-6">
                <form action="{{ route('cart.add') }}" method="post">
                    @csrf
                    <input type="hidden" name="product_id" value="{{ $product->id }}">
                    <input type="hidden" name="slug" value="{{ $product->slug }}">
                <div class="homemade-text">
                    <h3>{{ $product->name }}</h3>
                    <h4 class="fw-400 pb-4">${{ $product->unit_price }}.0</h4>
                    <p>{!! $product->details !!}</p>
                </div>

                    <div class="homemade-qty">
                        <div class="quantity">
                            <label for="qty">Qty:</label>
                            <input type="number" name="quantity" min="1" value="1" id="qty">
                        </div>
                    </div>
                    <div class="homemade-btn">
                        <div class="btn1">
                            <button type="submit" class="btn btn-primary">
                                Add to cart
                                <svg
                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-bag" viewBox="0 0 16 16">
                                    <path
                                        d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                                </svg>
                            </button>
                        </div>
                        <div class="btn2">
                            <a href="{{ route('store-wishlist',$product->slug) }}" class="btn btn-primary">
                                Add to bookmark
                                <svg
                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-bookmark" viewBox="0 0 16 16">
                                    <path
                                        d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />
                                </svg>
                            </a>
                        </div>
                    </div>
                <div class="all-home-ht">
                    <div class="home-text-img">
                        <div class="ht-both">
                            <img src="{!! frontImage('shipping.png') !!}" alt="">
                            <h5>FREE SHIPPING</h5>
                        </div>
                    </div>
                    <div class="home-text-img">
                        <div class="ht-both">
                            <img src="{!! frontImage('secure.png') !!}" alt="">
                            <h5>SECURE PAYMENT</h5>
                        </div>
                    </div>
                </div>

                <div class="homemade-icon">
                    <h5 class="fw-400">SHARE:</h5>
                    <ul>
                        <li><a href="#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
                </form>

            </div>

        </div>
    </div>
</section>
<!-- end of home made section  -->
<!-- FAQ section  -->
<section class="faq-sec d-none">
    <div class="container">
        <div class="hrLine"></div>
        <div class="heading text-center">
            <h2 style="font-weight:400;" class="mb-0">FAQs</h2>
            <h2>About Product</h2>
        </div>
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-6 col-lg-6">
                <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">
                    <!-- Accordion card -->
                    <div class="card">
                        <!-- Card header -->
                        <div class="card-header" role="tab" id="headingOne1">
                            <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne1"
                                aria-expanded="true" aria-controls="collapseOne1">
                                <h5 class="mb-0">
                                    Lorem ipsum dolor sit amet <i class="fa fa-angle-down" aria-hidden="true"></i>
                                </h5>
                            </a>
                        </div>
                        <!-- Card body -->
                        <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                            data-parent="#accordionEx">
                            <div class="card-body">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <!-- Accordion card -->
                    <!-- Accordion card -->
                    <div class="card">
                        <!-- Card header -->
                        <div class="card-header" role="tab" id="headingTwo2">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseTwo2"
                                aria-expanded="false" aria-controls="collapseTwo2">
                                <h5 class="mb-0">
                                    Lorem ipsum dolor sit amet <i class="fa fa-angle-down" aria-hidden="true"></i>
                                </h5>
                            </a>
                        </div>
                        <!-- Card body -->
                        <div id="collapseTwo2" class="collapse" role="tabpanel" aria-labelledby="headingTwo2"
                            data-parent="#accordionEx">
                            <div class="card-body">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <!-- Accordion card -->
                    <!-- Accordion card -->
                    <div class="card">
                        <!-- Card header -->
                        <div class="card-header" role="tab" id="headingThree3">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx"
                                href="#collapseThree3" aria-expanded="false" aria-controls="collapseThree3">
                                <h5 class="mb-0">
                                    Lorem ipsum dolor sit amet<i class="fa fa-angle-down" aria-hidden="true"></i>
                                </h5>
                            </a>
                        </div>
                        <!-- Card body -->
                        <div id="collapseThree3" class="collapse" role="tabpanel" aria-labelledby="headingThree3"
                            data-parent="#accordionEx">
                            <div class="card-body">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. . <br>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <!-- Accordion card -->
                    <!-- Card header -->
                    <div class="card-header" role="tab" id="headingThree3">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseThree3"
                            aria-expanded="false" aria-controls="collapseThree3">
                            <h5 class="mb-0">
                                Lorem ipsum dolor sit amet <i class="fa fa-angle-down" aria-hidden="true"></i>
                            </h5>
                        </a>
                    </div>
                    <!-- Card body -->
                    <div id="collapseThree3" class="collapse" role="tabpanel" aria-labelledby="headingThree3"
                        data-parent="#accordionEx">
                        <div class="card-body">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                            laboris nisi ut aliquip ex ea commodo consequat. . <br>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>
                <!-- Accordion card -->
            </div>
            <!-- Accordion wrapper -->
            <div class="col-md-6 col-sm-6 col-xs-6 col-lg-6">
                <div class="accordion2 md-accordion" id="accordionEx2" role="tablist" aria-multiselectable="true">
                    <!-- Accordion card -->
                    <div class="card">
                        <!-- Card header -->
                        <div class="card-header" role="tab" id="heading1">
                            <a data-toggle="collapse" data-parent="#accordionEx2" href="#collapse1"
                                aria-expanded="true" aria-controls="collapse1">
                                <h5 class="mb-0">
                                    Lorem ipsum dolor sit amet <i class="fa fa-angle-down" aria-hidden="true"></i>
                                </h5>
                            </a>
                        </div>
                        <!-- Card body -->
                        <div id="collapse1" class="collapse show" role="tabpanel" aria-labelledby="heading1"
                            data-parent="#accordionEx2">
                            <div class="card-body">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <!-- Accordion card -->
                    <!-- Accordion card -->
                    <div class="card">
                        <!-- Card header -->
                        <div class="card-header" role="tab" id="heading2">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx2" href="#collapse2"
                                aria-expanded="false" aria-controls="collapse2">
                                <h5 class="mb-0">
                                    Lorem ipsum dolor sit amet <i class="fa fa-angle-down" aria-hidden="true"></i>
                                </h5>
                            </a>
                        </div>
                        <!-- Card body -->
                        <div id="collapse2" class="collapse" role="tabpanel" aria-labelledby="heading2"
                            data-parent="#accordionEx2">
                            <div class="card-body">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <!-- Accordion card -->
                    <!-- Accordion card -->
                    <div class="card">
                        <!-- Card header -->
                        <div class="card-header" role="tab" id="heading3">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx2"
                                href="#collapse3" aria-expanded="false" aria-controls="collapse3">
                                <h5 class="mb-0">
                                    Lorem ipsum dolor sit amet<i class="fa fa-angle-down" aria-hidden="true"></i>
                                </h5>
                            </a>
                        </div>
                        <!-- Card body -->
                        <div id="collapse3" class="collapse" role="tabpanel" aria-labelledby="heading3"
                            data-parent="#accordionEx2">
                            <div class="card-body">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. . <br>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <!-- Accordion card -->
                    <!-- Card header -->
                    <div class="card-header" role="tab" id="heading4">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx2" href="#collapse4"
                            aria-expanded="false" aria-controls="collapse4">
                            <h5 class="mb-0">
                                Lorem ipsum dolor sit amet <i class="fa fa-angle-down" aria-hidden="true"></i>
                            </h5>
                        </a>
                    </div>
                    <!-- Card body -->
                    <div id="collapse4" class="collapse" role="tabpanel" aria-labelledby="heading4"
                        data-parent="#accordionEx2">
                        <div class="card-body">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                            laboris nisi ut aliquip ex ea commodo consequat. . <br>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>
                <!-- Accordion card -->
            </div>
        </div>



    </div>
    </div>
    </div>
    </div>
</section>
<!-- end of FAQ section  -->

<!-- Price Product Start Here -->
<section class="priceProducts d-none">
    <div class="container">
        <div class="heading text-center mb-4">
            <h2 style="font-weight:400;">Browse Our Best</h2>
            <h2>Price Product</h2>
        </div>
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-3 col-lg-3">
                <div class="pp-img">
                    <figure><img src="{!! frontImage('Mask1.png') !!}" alt=""></figure>
                    <h3>Price Under</h3>
                    <a href="#">$150</a>
                </div>
            </div>

            <div class="col-md-3 col-sm-3 col-xs-3 col-lg-3">
                <div class="pp-img">
                    <figure><img src="{!! frontImage('Mask2.png') !!}" alt=""></figure>
                    <h3>Price Under</h3>
                    <a href="#">$70</a>
                </div>
            </div>

            <div class="col-md-3 col-sm-3 col-xs-3 col-lg-3">
                <div class="pp-img">
                    <figure><img src="{!! frontImage('Mask3.png') !!}" alt=""></figure>
                    <h3>Price Under</h3>
                    <a href="#">$250</a>
                </div>
            </div>

            <div class="col-md-3 col-sm-3 col-xs-3 col-lg-3">
                <div class="pp-img">
                    <figure><img src="{!! frontImage('Mask4.png') !!}" alt=""></figure>
                    <h3>Price Under</h3>
                    <a href="#">$100</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Price Product End Here -->


<!-- Summer Candels Start Here -->
<section class="summer-candels">
    <div class="container">
        <div class="heading text-center">
            <h2 style="font-weight:400;" class="mb-0">You may Also like</h2>
            <h2>Similar Products</h2>
        </div>
        <div class="row pt-5">
            @forelse($relatedProducts as $product)
                <div class="col-lg-3 col-md-6 py-3">
                    <a href="{{ route('product.details',$product->slug) }}">
                        <div class="card">
                            <div class="img-box">
                                @if(count($images) > 0)
                                    <img class="card-img-top" src="{!! \App\CPU\ProductManager::product_image_path('product','/'.$images[0]) !!}" alt="Card image cap">
                                @else
                                    <img class="card-img-top" src="{!! frontImage('Clip.png') !!}" alt="Card image cap">
                                @endif
                            </div>
                            <div class="hover-item">
                                <div class="learn">
                                    <p><a href="#" class="text-white">Learn More</a> <i
                                            class="fa fa-shopping-basket" aria-hidden="true"></i></p>
                                </div>
                                <div class="quick-vew">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                </div>
                            </div>
                            <span
                                style="background-color:#E7ADB3;color:#fff;border-radius:20px;padding:0px 15px;position:absolute;top:0;transform:translate(30%,70%);">New</span>
                            <div class="card-body">
                                <p class="card-text">{{ $product->name }}</p>
                                <span style="color: #E7ADB3;">${{ $product->unit_price }} &nbsp; <strike
                                        style="font-size: 9px;color:#000">${{ $product->purchase_price }}
                                        </strike></span>
                            </div>
                        </div>
                    </a>
                </div>
            @endforeach
        </div>
{{--        <div class="pp-btn text-center pt-5">--}}
{{--            <a href="#" class="btn btn-primary" tabindex="-1">Load More</a>--}}
{{--        </div>--}}
    </div>
</section>
<!-- Summer Candels End Here -->
<!-- Footer include -->
@endsection
<!-- Footer include -->
