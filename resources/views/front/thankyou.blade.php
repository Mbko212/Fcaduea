@extends('layouts.front.app')

@section('title','Welcome To '. $web_config['name']->value.' ThankYou')

@section('content')

<!-- Stylesheet -->
<link rel="stylesheet" href="{{ frontCss('thankyou.css') }}">
<!-- Stylesheet -->

<section class="thankyou">
    <div class="container">
        <div class="happyShopping">
            <h3 class="font-30 fw-600 pb-4">Thank you for Shopping</h3>
            <p class="pb-4">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                ex ea commodo consequat.
            </p>
            <div class="button-group">
                <a href="{{ route('home') }}" class="btn">Continue Shopping</a>
            </div>
        </div>
    </div>
</section>

@endsection
