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
                <h2 class="title fw-500 font-80 line-height-1 text-center">FAQs</h2>
            </div>
        </div>
    </div>
</section>
<!-- Banner Section End Here -->
<!-- end of home made section  -->
<!-- FAQ section  -->
<section class="faq-sec">
    <div class="container">
                <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">

                    <div class="row">
                        @foreach($help_topics as $k=>$v)
                            <div class="col-md-6 col-sm-6 col-xs-6 col-lg-6 py-0">
                                <!-- Accordion card -->
                                <div class="card">
                                    <!-- Card header -->
                                    <div class="card-header" role="tab" id="heading{{ $v->id }}">
                                        <a data-toggle="collapse" data-parent="#accordionEx"
                                           href="#collapse{{ $v->id }}"
                                           aria-expanded="true" aria-controls="collapse{{ $v->id }}">
                                            <h5 class="mb-0">
                                                {{ $v->question }} <i class="fa fa-angle-down" aria-hidden="true"></i>
                                            </h5>
                                        </a>
                                    </div>
                                    <!-- Card body -->
                                    <div id="collapse{{ $v->id }}" class="collapse" role="tabpanel"
                                         aria-labelledby="headingOne{{ $v->id }}"
                                         data-parent="#accordionEx">
                                        <div class="card-body">
                                            <p id="paragraph{{ $v->id }}">
                                                {!! truncateString($v->answer,100,false) !!}
                                            </p>
                                            <a href="javascript:void(0);" onclick="$('#paragraph{{ $v->id }}').html('{!! $v->answer !!}');$(this).addClass('d-none')">Read More</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    @endforeach
                    <!-- Accordion card -->
                    </div>

                    <!-- Accordion card -->

                    <!-- Card header -->
{{--                    <div class="card-header" role="tab" id="headingThree3">--}}
{{--                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseThree3"--}}
{{--                            aria-expanded="false" aria-controls="collapseThree3">--}}
{{--                            <h5 class="mb-0">--}}
{{--                                Lorem ipsum dolor sit amet <i class="fa fa-angle-down" aria-hidden="true"></i>--}}
{{--                            </h5>--}}
{{--                        </a>--}}
{{--                    </div>--}}
                    <!-- Card body -->
{{--                    <div id="collapseThree3" class="collapse" role="tabpanel" aria-labelledby="headingThree3"--}}
{{--                        data-parent="#accordionEx">--}}
{{--                        <div class="card-body">--}}
{{--                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut--}}
{{--                            labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco--}}
{{--                            laboris nisi ut aliquip ex ea commodo consequat. . <br>--}}
{{--                            <a href="#">Read More</a>--}}
{{--                        </div>--}}
{{--                    </div>--}}

            <!-- Accordion wrapper -->
        </div>
    </div>
</section>
<!-- end of FAQ section  -->

@endsection
<!-- Footer include -->
