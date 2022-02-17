@extends('layouts.front.app')

@section('title','Welcome To '. $web_config['name']->value.' '.'FAQS')

@section('content')

<!-- Header include -->
<!-- Header include -->
<!-- home made section  -->
<!-- Stylesheet -->
<link rel="stylesheet" href="{!! frontCss('productdetail.css') !!}">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- Stylesheet -->
<!-- Banner Section Start Here -->
<section class="uncover-banner hero universal-banner" style="background: url('{!! frontImage('aun1.png') !!}'); ">
    <div class="container">
        <div class="row py-5">
            <div class="col-md-12 pb-3">
                <h2 class="title fw-500 font-80 line-height-1 text-center">Terms & Conditions</h2>
            </div>
        </div>
    </div>
</section>
<!-- Banner Section End Here -->
<!-- end of home made section  -->
<!-- FAQ section  -->
<section class="faq-sec">
    <div class="container">
        <p>
            {!! $terms_and_conditions->value !!}
        </p>
    </div>
</section>
<!-- end of FAQ section  -->

@endsection
<!-- Footer include -->
