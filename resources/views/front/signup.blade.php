@extends('layouts.front.app')

@section('title','Welcome To '. $web_config['name']->value.' SignUp')

@section('content')

<!-- Stylesheet -->
<link rel="stylesheet" href="{{ frontCss('signup.css') }}">
<!-- Stylesheet -->

<!-- Signin Section Start Here -->
<section class="signup">
    <div class="container">
        <div class="logoDv">
            <figure><a href="{{ url('/') }}"><img src="{{ frontImage('logo-1.png') }}" alt=""></a></figure>
        </div>
        <div class="signupBox">
            <div class="head">
                <h4>Welcome Back to Trading Centre LTD</h4>
                <h4><strong>Where we provide Best Products</strong></h4>
            </div>
            <div class="actionBtn">
                <p>Already a Member ?<a href="{{ route('customer.auth.login') }}">Sign In</a></p>
            </div>
            <form method="post" action="{{ route('customer.auth.register') }}">
                @csrf
                <div class="form-group">
                    <input type="text" name="first_name" class="form-control" value="{{ old('first_name') }}" required placeholder="First Name">
                </div>
                <div class="form-group">
                    <input type="text" name="last_name" value="{{ old('last_name') }}" class="form-control" required placeholder="Last Name">
                </div>
                <div class="form-group">
                    <input type="email" name="email" value="{{ old('email') }}" class="form-control" required placeholder="Email">
                </div>
                <div class="form-group">
                    <input type="tel" class="form-control" value="{{ old('phone') }}" name="phone" required placeholder="Phone Number">
                </div>
                <div class="form-group">
                    <input type="password" name="password" value="{{ old('password') }}" required class="form-control" placeholder="Password">
                </div>
                <div class="form-group">
                    <input type="password" name="confirm_password" value="{{ old('confirm_password') }}" required class="form-control" placeholder="Confirm Password">
                </div>
                <button type="submit">Creat Account</button>

            </form>

        </div>
        <div class="actionBtn2">
            <p>By Creating Account you are agree to our <a href="{{ route('terms-and-conditions') }}">Terms & conditions</a></p>
        </div>
    </div>
</section>
<!-- Signin Section End Here -->

@endsection

