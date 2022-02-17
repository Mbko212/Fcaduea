@extends('layouts.front.app')

@section('title','Welcome To '. $web_config['name']->value.' SignIn')

@section('content')
<!-- Stylesheet -->
<link rel="stylesheet" href="{{ frontCss('signin.css') }}">
<!-- Stylesheet -->

<!-- Signin Section Start Here -->
<section class="signin">
    <div class="container">
        <div class="logoDv">
            <figure><a href="{{ url('/') }}"><img src="{{ frontImage('logo-1.png') }}" alt=""></a></figure>
        </div>
        <div class="SigninBox">
            <div class="head">
                <h4>Welcome Back to Fcadue</h4>
                <h4><strong>Where we provide Best Products</strong></h4>
            </div>
            <div class="actionBtn">
                <p>Not a Member ?<a href="{{ route('customer.auth.register') }}">Sign Up</a></p>
            </div>
            <form method="post" action="{{ route('customer.auth.login') }}">
                @csrf
                <div class="form-group">
                    <input type="email" class="form-control" name="email" required placeholder="Email">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" required placeholder="Password">
                </div>
                <button type="submit">Submit</button>
            </form>

{{--            <div class="actionBtn2">--}}
{{--                <p>By Creating Account you are agree to our <a href="{{ route('terms-and-conditions') }}">Terms & conditions</a></p>--}}
{{--            </div>--}}
        </div>
        <div class="actionBtn2">
            <p><a href="{{ route('customer.auth.recover-password') }}">Forgot Password</a></p>
        </div>
    </div>
</section>
<!-- Signin Section End Here -->

@endsection
