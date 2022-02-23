<div class="header-blue">
    <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
        <div class="container">
            <a class="navbar-brand navbar-left" href="{{ route('home') }}">
{{--                <img src="{!! frontImage('logo-1.png') !!}" target="_self" />--}}
                <img src="{{ asset('storage/app/public/company')}}/{{\App\Model\BusinessSetting::where(['type' => 'company_web_logo'])->pluck('value')[0] }}" target="_self" />
            </a>
            <button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1">
                <span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon">
                    </span>
            </button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="nav-item" role="presentation"><a class="nav-link " href="{{ route('home') }}">Home </a>
                    </li>
                    @foreach(\App\CPU\CategoryManager::parents() as $key => $categories)
                        @if($key < 5)
                        <li>
                            <div class="dropdown">
                                <button class="nav-link dropbtn"
                                        onclick="location.href='{{ route('shop',[$categories->slug]) }}';">{!! $categories->name !!}</button>
                                <div class="dropdown-content">
                                    @foreach($categories->childes as $subCategories)
                                    <a href="{{ route('shop',[$categories->slug,$subCategories->slug]) }}">{!! $subCategories->name !!}</a>
                                    @endforeach
                                </div>
                            </div>
                        </li>
                        @endif
{{--                        <li class="nav-item" role="presentation">--}}
{{--                            <a class="nav-link " href="index.php">{!! $categories->name !!}</a>--}}
{{--                        </li>--}}
{{--                        <li class="nav-item {!! (isset($_GET['slug']) && $_GET['slug'] == $categories->slug && Request::is('shop') == 1) ? 'active' : '' !!}"><a class="nav-link" href="{!! route('shop') . '?id=' . $categories->id . '&slug=' . $categories->slug . '&data_from=category' !!}"></a></li>--}}
                    @endforeach
{{--                    <li>--}}
{{--                        <div class="dropdown">--}}
{{--                            <button class="nav-link dropbtn"--}}
{{--                                    onclick="location.href='souvenir.php';">Souvenirs</button>--}}
{{--                            <div class="dropdown-content">--}}
{{--                                <a href="#">Baby shower</a>--}}
{{--                                <a href="#">bridal shower</a>--}}
{{--                                <a href="#">henna night</a>--}}
{{--                                <a href="#">Grangaoh night</a>--}}
{{--                                <a href="#">graduation</a>--}}
{{--                                <a href="#">wedding</a>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    </li>--}}
{{--                    <li>--}}
{{--                        <div class="dropdown">--}}
{{--                            <button class="nav-link dropbtn" onclick="location.href='gifts.php';">Gifts</button>--}}
{{--                            <div class="dropdown-content">--}}
{{--                                <a href="#">Ramadan gifts</a>--}}
{{--                                <a href="#">Eid Al fater</a>--}}
{{--                                <a href="#">Eid Al adha</a>--}}
{{--                                <a href="#">Mother’s Day</a>--}}
{{--                                <a href="#">Breast cancer day</a>--}}
{{--                                <a href="#">Sports day</a>--}}
{{--                                <a href="#">National day</a>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    </li>--}}

{{--                    <li class="nav-item" role="presentation"><a class="nav-link" href="candels.php">--}}
{{--                            candels</a></li>--}}
{{--                    <li class="nav-item" role="presentation"><a class="nav-link" href="#">--}}
{{--                            Soap</a></li>--}}
{{--                    <li class="nav-item" role="presentation"><a class="nav-link" href="#">--}}
{{--                            Chocolates</a></li>--}}
                    <li class="nav-item" role="presentation"><a class="nav-link" href="{{ route('shop') }}">
                            Accessories</a></li>
                    <li class="nav-item p-2 pl-4" role="presentation">
                        <a href="#" onclick="$('.search-box').addClass('show');"> <img width="18px" src="{!! frontImage('search-interface-symbol.png') !!}" alt=""></a>
                    </li>
                    @if(auth('customer')->check())
                        <li class="nav-item p-2" role="presentation">
                            <div class="dropdown">
                                <a href="javascript:void(0);" id="dropdownMenuButton" data-toggle="dropdown"
                                   aria-haspopup="true" aria-expanded="false">
                                    <img width="18px" src="{{ frontImage('user.png') }}" alt="">
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="{{ route('user-account') }}">Profile</a>
                                    <a class="dropdown-item" href="{{ route('customer.auth.logout') }}">Logout</a>
                                </div>
                            </div>
{{--                            <a href="{{ route('user-account') }}">--}}
{{--                                <img width="18px" src="{!! frontImage('user.png') !!}" alt="">--}}
{{--                            </a>--}}
                        </li>
                        <li class="nav-item p-2" role="presentation">
                            <a href="{{ route('wishlists') }}"> <img width="18px" src="{!! frontImage('ribbon.png') !!}" alt=""></a>
                        </li>
                    @else
                        <li class="nav-item p-2" role="presentation">
                            <a href="{{ route('customer.auth.login') }}">
                                <img width="18px" src="{!! frontImage('user.png') !!}" alt="">
                            </a>
                        </li>
                    @endif

                    <li class="nav-item p-2" role="presentation">
                        <a href="{{ route('cart.list') }}"> <img width="18px" src="{!! frontImage('shopping-bag.png') !!}" alt=""></a>
                    </li>
                </ul>
                <!-- <ul class="nav navbar-nav navbar-right">

                </ul> -->
            </div>
            <div class="canvas-icon text-right">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </div>
        </div>
    </nav>
    <div class="mobile-header navbar-dark">
        <div class="cancel">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-x"
                 viewBox="0 0 16 16">
                <path
                    d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
            </svg>
        </div>
        <ul class="mobile-nav navbar-nav">
            <li class="nav-link"><a class="text-black" href="{{ route('home') }}">Home</a></li>
            @foreach(\App\CPU\CategoryManager::parents() as $key => $categories)
                @if($key < 5)
                    <li class="nav-link">
                        <a class="text-black" href="{{ route('shop',[$categories->slug]) }}">
                            {{ $categories->name }}
                        </a>
                    </li>
                @endif
            @endforeach

            <li class="nav-link"><a class="text-black" href="{{ route('shop') }}">Accessories</a></li>
            <li>
                <div class="button-group mt-3">
                    @if(auth('customer')->check())
                        <div class="dropdown">
                            <a href="javascript:void(0);" id="dropdownMenuButton" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                <img width="18px" src="{{ frontImage('user.png') }}" alt="">
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="{{ route('user-account') }}">Profile</a>
                                <a class="dropdown-item" href="{{ route('customer.auth.logout') }}">Logout</a>
                            </div>
                        </div>
{{--                        {{ route('user-account') }}--}}
                        <a href="{{ route('wishlists') }}" class="mx-2"><img width="18px"
                                                                             src="{{ frontImage('ribbon.png') }}"
                                                                             alt=""></a>
                    @else
                        <a href="{{ route('customer.auth.login') }}"><img width="18px"
                                                                          src="{{ frontImage('user.png') }}" alt=""></a>
                    @endif
                    <a href="{{ route('cart.list') }}"><img width="18px" src="{{ frontImage('shopping-bag.png') }}"
                                                            alt=""></a>
                </div>
            </li>
        </ul>
    </div>
</div>

{{--<div class="container">--}}
{{--    <div class="hideboth">--}}
{{--        <div class="arrivalscon">--}}
{{--            <nav class="navbar navbar-expand-lg navbar-light bg-broder">--}}
{{--                <a class="navbar-brand" href="{!! route('home') !!}"><img src="{!! frontImage('fl-logo.png') !!}"></a>--}}
{{--                <ul class="nav navbar-nav navbar-right hidden-menu">--}}
{{--                    <li class="nav-item">--}}
{{--                        <button class="canvasx"><img src="{!! frontImage('cart.png') !!}"></button>--}}
{{--                        <!--<a class="canvasx" href="{!! url('url') !!}"><img src="{!! frontImage('cart.png') !!}"></a>-->--}}
{{--                        <span ID="lblCartCount" Class="badge badge-warning"  ForeColor="White">3</span></a>--}}
{{--                    </li>--}}
{{--                </ul>--}}
{{--                <button class="navbar-toggler" type="button" data-toggle="collapse"--}}
{{--                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"--}}
{{--                        aria-expanded="false" aria-label="Toggle navigation">--}}
{{--                    <span class="navbar-toggler-icon"></span>--}}
{{--                </button>--}}
{{--                <div class="collapse navbar-collapse" id="navbarSupportedContent">--}}
{{--                    <ul class="navbar-nav mr-auto">--}}
{{--                        <li class="nav-item {!! (isset($_GET['data_from']) && $_GET['data_from'] == 'latest' && Request::is('shop') == 1) ? 'active' : '' !!}"><a class="nav-link" href="{!! route('shop') . '?data_from=latest' !!}">New Arrivals<span--}}
{{--                                    class="sr-only">(current)</span></a></li>--}}
{{--                        <li class="nav-item {!! (Request::is('brands') == 1) ? 'active' : '' !!}"><a class="nav-link" href="{!! route('brands') !!}">Brands</a></li>--}}
{{--                        @foreach(\App\CPU\CategoryManager::parents() as $key => $categories)--}}
{{--                            <li class="nav-item {!! (isset($_GET['slug']) && $_GET['slug'] == $categories->slug && Request::is('shop') == 1) ? 'active' : '' !!}"><a class="nav-link" href="{!! route('shop') . '?id=' . $categories->id . '&slug=' . $categories->slug .'&data_from=category' !!}">{!! $categories->name !!}</a></li>--}}
{{--                        @endforeach--}}

{{--                        <li class="nav-item {!! (isset($_GET['data_from']) && $_GET['data_from'] == 'sale' && Request::is('shop') == 1) ? 'active' : '' !!}"><a class="nav-link" href="{!! route('shop') . '?data_from=sale' !!}">SALE</a></li>--}}
{{--                        <li class="nav-item"><a class="nav-link hidden-menu" href="{!! route('blog') !!}">Blog</a></li>--}}
{{--                        <li class="nav-item"><a class="nav-link hidden-menu" href="{!! route('consign') !!}">Consign</a></li>--}}
{{--                        <li class="nav-item"><a class="nav-link hidden-menu" href="{!! route('pull') !!}">Pull</a></li>--}}
{{--                        <li class="nav-item pl-2 mb-2 mb-md-0 hidden-menu">--}}
{{--                            <a href="" data-toggle="modal" data-target="#exampleModal" type="button"--}}
{{--                               class="btn btn-outline-info btn-md btn-rounded btn-navbar waves-effect waves-light login">Login</a>--}}
{{--                        </li>--}}
{{--                    </ul>--}}
{{--                    <ul class="nav navbar-nav navbar-right">--}}
{{--                        <li class="nav-item pl-2 mb-2 mb-md-0">--}}
{{--                            <a href="{!! route('request') !!}" type="button"--}}
{{--                               class="btn btn-outline-info btn-md btn-rounded btn-navbar waves-effect waves-light">Request--}}
{{--                                an Item</a>--}}
{{--                        </li>--}}
{{--                    </ul>--}}
{{--                </div>--}}
{{--            </nav>--}}
{{--        </div><!-- end arrivalscon-->--}}
{{--        <div class="blogcon">--}}
{{--            <nav class="navbar navbar-expand-lg navbar-light bg-broder">--}}
{{--                <a class="navbar-brand" href="{!! route('home') !!}"><img alt="{!! $web_config['name']->value!!}"--}}
{{--                                                                          onerror="this.src='{!! asset('public/assets/front-end/img/image-place-holder.png') !!}'"--}}
{{--                                                                          src="{!! asset("storage/app/public/company") .'/'. $web_config['web_logo']->value !!}"></a>--}}
{{--                <ul class="nav navbar-nav navbar-right hidden-menu">--}}
{{--                    <li class="nav-item">--}}
{{--                        <button class="canvasx"><img src="{!! frontImage('cart.png') !!}"></button>--}}
{{--                        <span ID="lblCartCount" Class="badge badge-warning"  ForeColor="White">3</span>--}}
{{--                        <!--<a class="canvasx" href="{!! url('cart') !!}"><img src="{!! frontImage('cart.png') !!}"></a>-->--}}
{{--                    </li>--}}
{{--                </ul>--}}
{{--                <button class="navbar-toggler" type="button" data-toggle="collapse"--}}
{{--                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"--}}
{{--                        aria-expanded="false" aria-label="Toggle navigation">--}}
{{--                    <span class="navbar-toggler-icon"></span>--}}
{{--                </button>--}}
{{--                <div class="collapse navbar-collapse" id="navbarSupportedContent">--}}
{{--                    <ul class="navbar-nav mr-auto">--}}
{{--                        <li class="nav-item b-shop"><a class="nav-link" href="{!! route('shop') . '?data_from=latest' !!}"><img--}}
{{--                                    src="{!! frontImage('arrow-big2.png') !!}"> Back to Shop</a></li>--}}
{{--                    </ul>--}}
{{--                    <ul class="navbar-nav mr-auto blog-menu">--}}
{{--                        <li class="nav-item {!! (isset($_GET['data_from']) && $_GET['data_from'] == 'latest' && Request::is('shop') == 1) ? 'active' : '' !!}"><a class="nav-link" href="{!! route('shop') . '?data_from=latest' !!}">New Arrivals<span--}}
{{--                                    class="sr-only">(current)</span></a></li>--}}
{{--                        <li class="nav-item {!! (Request::is('brands') == 1) ? 'active' : '' !!}"><a class="nav-link" href="{!! url('brand') !!}">Brands</a></li>--}}
{{--                        @foreach(\App\CPU\CategoryManager::parents() as $key => $categories)--}}
{{--                            <li class="nav-item {!! (isset($_GET['slug']) && $_GET['slug'] == $categories->slug && Request::is('shop') == 1) ? 'active' : '' !!}"><a class="nav-link" href="{!! route('shop') . '?id=' . $categories->id . '&slug=' . $categories->slug . '&data_from=category' !!}">{!! $categories->name !!}</a></li>--}}
{{--                        @endforeach--}}

{{--                        <li class="nav-item {!! (isset($_GET['data_from']) && $_GET['data_from'] == 'sale' && Request::is('shop') == 1) ? 'active' : '' !!}"><a class="nav-link" href="{!! route('shop') . '?data_from=sale' !!}">SALE</a></li>--}}
{{--                        <li class="nav-item"><a class="nav-link hidden-menu" href="{!! route('blog') !!}">Blog</a></li>--}}
{{--                        <li class="nav-item"><a class="nav-link hidden-menu" href="{!! route('consign') !!}">Consign</a></li>--}}
{{--                        <li class="nav-item"><a class="nav-link hidden-menu" href="{!! route('pull') !!}">Pull</a></li>--}}
{{--                        <li class="nav-item pl-2 mb-2 mb-md-0 hidden-menu">--}}
{{--                            <a href="" data-toggle="modal" data-target="#exampleModal" type="button"--}}
{{--                               class="btn btn-outline-info btn-md btn-rounded btn-navbar waves-effect waves-light login">Login</a>--}}
{{--                        </li>--}}
{{--                    </ul>--}}
{{--                    <ul class="nav navbar-nav navbar-right blog-menu">--}}
{{--                        <li class="nav-item pl-2 mb-2 mb-md-0">--}}
{{--                            <a href="{!! route('request') !!}" type="button"--}}
{{--                               class="btn btn-outline-info btn-md btn-rounded btn-navbar waves-effect waves-light">Request--}}
{{--                                an Item</a>--}}
{{--                        </li>--}}
{{--                    </ul>--}}
{{--                    <ul class="nav navbar-nav navbar-right">--}}
{{--                        <li class="nav-item pl-2 mb-2 mb-md-0">--}}
{{--                            <a href="#!" type="button"--}}
{{--                               class="btn btn-outline-info btn-md btn-rounded btn-navbar waves-effect waves-ligh subscribe-btn">Subscribe</a>--}}
{{--                        </li>--}}
{{--                    </ul>--}}
{{--                </div>--}}
{{--            </nav>--}}
{{--        </div><!-- end blogcon-->--}}
{{--    </div>--}}
{{--    <div class="headertbottom">! Note: Do Not Delete It; this div is for (jQuery)</div>--}}
{{--</div><!-- Nav Container -->--}}

<div class="search-box">
    <div class="container">
        <div class="cancel" onclick="$('.search-box').removeClass('show');">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
            </svg>
        </div>
        <form method="get" action="{{ route('shop') }}">
            <div class="form-group">
                <input type="text" name="name" class="form-control" placeholder="Search Product..."/>
                <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
            </div>
        </form>
    </div>
</div>
