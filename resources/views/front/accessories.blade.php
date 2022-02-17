@extends('layouts.front.app')

@section('title','Welcome To '. $web_config['name']->value.' Accessories')

@section('content')

<!-- Stylesheet -->
<link rel="stylesheet" href="{!! frontCss('accessories.css') !!}">
<!-- Stylesheet -->

<!-- Banner Section Start Here -->
<section class="uncover-banner hero universal-banner" style="background: url('{!! frontImage('aun1.png') !!}'); ">
    <div class="container">
        <div class="row py-5">
            <div class="col-md-12 pb-3">
                <h2 class="title fw-500 font-80 line-height-1 text-center">Accessories</h2>
            </div>
        </div>
    </div>
</section>
<!-- Banner Section End Here -->

<!-- Latest Products Start Here -->
<section class="accessories-products">
    <div class="container">
        <div class="row">
            <div class="col-md-3 pb-5">
                <div class="head">
                    <h3>CATEGORIES</h3>
                </div>
                <div id="accordion">
                    @foreach($getCategories as $key => $categories)
                    <div class="card">
                        <div class="card-header" id="heading{{ $key }}">
                            <h5 class="mb-0">
                                <button class="btnn btn-link" >
                                    <h6 onclick="window.location.href='{{ route('shop',[$categories->slug]) }}'">{!! $categories->name !!}</h6>
                                    <p data-toggle="collapse" data-target="#{{ $categories->slug.$key }}"
                                       aria-expanded="true" aria-controls="collapseOne"><i class="bg-info rounded p-1 fa fa-angle-down" aria-hidden="true"></i></p>
                                </button>
                            </h5>
                        </div>

                        <div id="{{ $categories->slug.$key }}" class="collapse {{ ($categories->slug === $search_category)? "show" : '' }}" aria-labelledby="{{ $categories->slug.$key }}"
                            data-parent="#accordion">
                            <div class="card-body">
                                @foreach($categories->childes as $subCategories)
                                <div class="form-check" onclick="window.location.href='{{ route('shop',[$categories->slug,$subCategories->slug]) }}'">
                                    <input class="form-check-input" type="checkbox" {{ ($subCategories->slug === $sub_category)? 'checked' : ''  }} id="{{$subCategories->slug}}Check1">
                                    <label class="form-check-label" for="{{$subCategories->slug}}Check1">
                                        <div class="name">
                                            <span>{!! $subCategories->name !!}</span>
                                        </div>
                                        <div class="products-count">
                                            <span>{{ \App\CPU\CategoryManager::countProducts($categories->id,$subCategories->id) }}</span>
                                        </div>
                                    </label>
                                </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
            <div class="col-md-1">
                <div class="vertical-line"></div>
            </div>
            <div class="col-md-8">
                <div class="TopBar">
                    <div class="heading">
                        <h5 style="color:#E7ADB3;" class="fw-400">Browse Our </h5>
                        @if(!empty($search_category) || !empty($sub_category))
                        <h2>
                            {{ ucfirst($search_category)}}
                            @if(!empty($sub_category)) <span>/</span> @endif
                            {{ ucfirst($sub_category) }}
                        </h2>
                        @else
                        <h2>Best Quality Accessories</h2>
                        @endif
                    </div>
{{--                    <div class="filter-btn">--}}
{{--                        <button>Filter <i class="fa fa-filter" aria-hidden="true"></i></button>--}}
{{--                    </div>--}}
                </div>
                <div class="row pt-5">
                    @foreach($products as $key => $product)
                    <?php $images = json_decode($product->images,true); ?>
                    <div class="col-lg-4 col-md-6">
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
                <div class="row d-flex flex-column align-items-center">
                    <div>{{ $products->links() }}</div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Latest Products End Here -->


<!-- Browse Our Products Start Here -->
<section class="d-none hero" style="background-color: #FEF2F1;">
    <div class="container">
        <div class="row py-5 text-center">
            <div class="col-md-12">
                <h5 class="sub-heading fw-500 font-40">Browse Our Best Selling</h5>
                <h2 class="title fw-600 font-40 line-height-1">Premium Products</h2>
            </div>
        </div>
    </div>
    <div class="regular">
        <div><img src="{!! frontImage('product-1.jpg') !!}" class="img-fluid" alt=""></div>
        <div><img src="{!! frontImage('product-2.jpg') !!}" class="img-fluid" alt=""></div>
        <div><img src="{!! frontImage('product-3.jpg') !!}" class="img-fluid" alt=""></div>
        <div><img src="{!! frontImage('product-4.jpg') !!}" class="img-fluid" alt=""></div>
        <div><img src="{!! frontImage('product-1.jpg') !!}" class="img-fluid" alt=""></div>
        <div><img src="{!! frontImage('product-2.jpg') !!}" class="img-fluid" alt=""></div>
        <div><img src="{!! frontImage('product-3.jpg') !!}" class="img-fluid" alt=""></div>
        <div><img src="{!! frontImage('product-1.jpg') !!}" class="img-fluid" alt=""></div>
        <div><img src="{!! frontImage('product-2.jpg') !!}" class="img-fluid" alt=""></div>
        <div><img src="{!! frontImage('product-3.jpg') !!}" class="img-fluid" alt=""></div>
        <div><img src="{!! frontImage('product-4.jpg') !!}" class="img-fluid" alt=""></div>
    </div>
    <div class="text-center">
        <a href="#" class="btn-underline" tabindex="-1">Browse Our Product </a>
    </div>
</section>
<!-- Browse Our Products End Here -->
@endsection

