@extends('layouts.front.app')

@section('title','Forgot Password')

@section('content')
    <!-- Stylesheet -->
    <link rel="stylesheet" href="{{ frontCss('signin.css') }}">
    <!-- Stylesheet -->

    <!-- Signin Section Start Here -->
    <section class="signin">
        <div class="container">
            <div class="logoDv">
                <figure><a href="index.php"><img src="{{ frontImage('logo-1.png') }}" alt=""></a></figure>
            </div>
            <div class="SigninBox">
                <div class="head">
                    <h4>Welcome Back to Fcadue</h4>
                    <h4><strong>Where we provide Best Products</strong></h4>
                </div>
                <div class="actionBtn">
                    <p>Not a Member ?<a href="{{ route('customer.auth.register') }}">Sign Up</a></p>
                </div>
                <form id="sign-in-form" action="{!! route('customer.auth.forgot-password') !!}" autocomplete="off" method="post" role="form">
                    @csrf
                    <div class="messages"></div>
                    <div class="controls">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input id="form_email" type="email" name="email" class="form-control"
                                           placeholder="Email Address" required>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <button type="submit">Send Link</button>
{{--                                <input type="submit" class="btn btn-dark btn-submit mt-1 mb-4" value="Send Link">--}}
                            </div>
                        </div>
                    </div>
                </form>
                <div class="actionBtn2">
                    <p>By Creating Account you are agree to our <a href="{{ route('terms-and-conditions') }}">Terms & conditions</a></p>
                </div>
            </div>
        </div>
    </section>
    <!-- Signin Section End Here -->

@endsection


{{--@extends('layouts.front.app')--}}

{{--@section('title','Forgot Password')--}}

{{--@section('content')--}}
{{--    <div class="container frmssxx">--}}
{{--        <div class="row">--}}
{{--            <div class="col-sm-12 text-center">--}}
{{--                <div class="loginsxx">--}}
{{--                    <h2>Forgot Password</h2>--}}
{{--                    <h4></h4>--}}
{{--                    <form id="sign-in-form" action="{!! route('customer.auth.forgot-password') !!}" autocomplete="off" method="post" role="form">--}}
{{--                        @csrf--}}
{{--                        <div class="messages"></div>--}}
{{--                        <div class="controls">--}}
{{--                            <div class="row">--}}
{{--                                <div class="col-md-12">--}}
{{--                                    <div class="form-group">--}}
{{--                                        <input id="form_email" type="email" name="email" class="form-control"--}}
{{--                                               placeholder="Email Address" required>--}}
{{--                                        <div class="help-block with-errors"></div>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                            <div class="row">--}}
{{--                                <div class="col-md-12">--}}
{{--                                    <input type="submit" class="btn btn-dark btn-submit mt-1 mb-4" value="Send Link">--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    </form>--}}
{{--                </div>--}}
{{--            </div>--}}
{{--        </div>--}}
{{--    </div>--}}
{{--@endsection--}}
