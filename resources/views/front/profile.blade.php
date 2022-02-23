@extends('layouts.front.app')

@section('title','Welcome To '. $web_config['name']->value.' Profile')

@section('content')
    <!-- Header include -->
    <!-- Header include -->

    <!-- Stylesheet -->
    <link rel="stylesheet" href="{{ frontCss('profile.css') }}">
    <!-- Stylesheet -->

    <!-- Banner Section Start Here -->
    <section class="uncover-banner hero universal-banner" style="background: url('{{ frontImage('aun1.png') }}'); ">
        <div class="container">
            <div class="row py-5">
                <div class="col-md-12 pb-3">
                    <h2 class="title fw-500 font-80 line-height-1 text-center">My Profile</h2>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End Here -->

    <!-- Profile Content Start Here -->
    <section class="profileActions">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="nav flex-column nav-pills mb-4" id="v-pills-tab" role="tablist"
                         aria-orientation="vertical">
                        <h3 class="pb-3">Manage My Account</h3>
                        <a class="nav-link active" id="v-pills-myprofile-tab" data-toggle="pill"
                           href="#v-pills-myprofile"
                           role="tab" aria-controls="v-pills-myprofile" aria-selected="true"><span></span> My
                            Profile</a>

                        <a class="nav-link" id="v-pills-myorders-tab" data-toggle="pill" href="#v-pills-myorders"
                           role="tab"
                           aria-controls="v-pills-myorders" aria-selected="false"><span></span>My Orders</a>

                        <a class="nav-link" id="v-pills-myreturn-tab" data-toggle="pill" href="#v-pills-myreturn"
                           role="tab"
                           aria-controls="v-pills-myreturn" aria-selected="false"><span></span> My returns</a>

                        <a class="nav-link" id="v-pills-mycancelation-tab" data-toggle="pill"
                           href="#v-pills-mycancelation"
                           role="tab" aria-controls="v-pills-mycancelation" aria-selected="false"><span></span> My
                            Cancellations</a>
                    </div>
                    <div class="vertical-Line"></div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content" id="v-pills-tabContent">
                        <!-- First tab Start Here -->
                        <div class="tab-pane fade show active" id="v-pills-myprofile" role="tabpanel"
                             aria-labelledby="v-pills-myprofile-tab">
                            <div class="title pb-4">
                                <h3>My Profile</h3>
                            </div>
                            <div class="profileDeatils mb-5">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="BoxOne Box my-2">
                                            <div class="txtDetail">
                                                <div class="head">
                                                    <h5>Full Name</h5>
                                                    <!-- <a id="editprofileBtn" href="#!">Edit</a> -->
                                                    {{--                                                <button onclick="goeditProfileButton();" class="editt">Edit</button>--}}
                                                </div>
                                                <div class="value">
                                                    <h6>{{ $customerDetail->full_name }}</h6>
                                                </div>
                                            </div>
                                            <div class="imgBox">
                                                <figure><img src="img/profile.png" alt=""></figure>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="BoxTwo Box my-2">
                                            <div class="txtDetail">
                                                <div class="head">
                                                    <h5>Email Address</h5>
                                                    <!-- <a href="#">Edit</a> -->
                                                    {{--                                                <button onclick="goeditProfileButton();" class="editt">Edit</button>--}}
                                                </div>
                                                <div class="value">
                                                    <h6>{{ $customerDetail->email }}</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="BoxThree Box my-2">
                                            <div class="txtDetail">
                                                <div class="head">
                                                    <h5>Mobile Number</h5>
                                                    <!-- <a href="#">Edit</a> -->
                                                    {{--                                                <button onclick="goeditProfileButton();" class="editt">Edit</button>--}}
                                                </div>
                                                <div class="value">
                                                    <h6>{{ $customerDetail->phone }}</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="BoxFour Box my-2">
                                            <div class="txtDetail">
                                                <div class="head">
                                                    <h5>Birthday</h5>
                                                    <!-- <a href="#">Edit</a> -->
                                                    <!-- <button class="editt">Edit</button> -->
                                                </div>
                                                <div class="value">
                                                    <h6>
                                                        <span
                                                            class="day">{{ ($customerDetail->dob)? date('M d,Y',strtotime($customerDetail->dob)) : '00-00-000'  }}</span>
                                                    </h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="BoxFive Box my-2">
                                            <div class="txtDetail">
                                                <div class="head">
                                                    <h5>Gender</h5>
                                                </div>
                                                <div class="value">
                                                    <h6>{{ ($customerDetail->gender)? $customerDetail->gender : 'not selected' }}</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="button-group mt-3">
                                    <button class="mb-4" id="" onclick="goeditProfileButton();">Edit Profile</button>
                                    <button type="button" data-toggle="modal" data-target="#changePassword">Change
                                        Password
                                    </button>
                                </div>
                            </div>

                            <div class="addressBook">
                                <div class="head">
                                    <h3>Home Address</h3>
                                </div>
                                <div class="addressDv">
                                    <h5>Address Book</h5>
                                    <table>
                                        <tr class="topBar">
                                            <th class="name">Country</th>
                                            <th class="address">City</th>
                                            <th class="address">Zip</th>
                                            <th class="region">Address</th>
                                            <th class="actnBtn"></th>
                                        </tr>
                                        <tr>
                                            <td class="name">
                                                <p>{{ ($customerDetail->country)? $customerDetail->country : '' }}</p>
                                            </td>
                                            <td class="name">
                                                <p>{{ ($customerDetail->city)? $customerDetail->city : '' }}</p>
                                            </td>
                                            <td class="name">
                                                <p>{{ ($customerDetail->zip)? $customerDetail->zip : '' }}</p>
                                            </td>
                                            <td class="name">
                                                <p>{{ ($customerDetail->street_address)? $customerDetail->street_address : '' }}</p>
                                            </td>
                                            {{--                                        <td class="actnBtn"><button>Edit</button></td>--}}
                                        </tr>
                                    </table>
                                </div>
                            </div>

                            <!-- For Edit Profile Start Here -->
                            <div class="editProfileDv">
                                <form method="post" action="{{ route('user-update') }}">
                                    @csrf
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="fullname">First Name</label>
                                                <input type="text" class="form-control"
                                                       value="{{ $customerDetail->f_name }}" id="f_name" name="f_name"
                                                       placeholder="Your First name">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="fullname">Last Name</label>
                                                <input type="text" class="form-control"
                                                       value="{{ $customerDetail->l_name }}" id="l_name" name="l_name"
                                                       placeholder="Your Last name">
                                            </div>
                                        </div>
                                        {{--                                    <div class="col-md-4">--}}
                                        {{--                                        <div class="form-group">--}}
                                        {{--                                            <label for="email">Email Address</label>--}}
                                        {{--                                            <input type="text" class="form-control" id="email" name="email"--}}
                                        {{--                                                placeholder="Your Email Address">--}}
                                        {{--                                        </div>--}}
                                        {{--                                    </div>--}}
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="phone">Mobile Number</label>
                                                <input type="text" class="form-control"
                                                       value="{{ $customerDetail->phone }}" id="phone" name="phone"
                                                       placeholder="Your Mobile Number">
                                            </div>
                                        </div>
                                        <div class="col-lg-8 col-md-12">
                                            <div class="row">
                                                <div class="col-lg-6 col-md-9">
                                                    <div class="form-group">
                                                        <label for="dob">Date Of Birth</label>
                                                        <input type="date" class="form-control"
                                                               value="{{ $customerDetail->dob }}" id="dob" name="dob"
                                                               placeholder="Your Mobile Number">

                                                        {{--                                                    <div class="input-group">--}}
                                                        {{--                                                        <input type="number" name="month" required class="form-control" id="month"--}}
                                                        {{--                                                            placeholder="Month">--}}
                                                        {{--                                                        <input type="number" name="day" required class="form-control" id="day"--}}
                                                        {{--                                                            placeholder="Day">--}}
                                                        {{--                                                        <input type="number" name="year" required class="form-control" id="year"--}}
                                                        {{--                                                            placeholder="Year">--}}
                                                        {{--                                                    </div>--}}
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-3">
                                                    <div class="form-group">
                                                        <label for="tel">Gender</label>
                                                        <select name="gender" id="gender" class="form-control">
                                                            <option value="{{ $customerDetail->gender }}"
                                                                    hidden>{{ ($customerDetail->gender)? $customerDetail->gender : 'Select Male/Female' }}</option>
                                                            <option value="male">Male</option>
                                                            <option value="female">Female</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="country">Country</label>
                                                <input type="text" class="form-control"
                                                       value="{{ $customerDetail->country }}" id="country"
                                                       name="country"
                                                       placeholder="Your Country">
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="city">City</label>
                                                <input type="text" class="form-control"
                                                       value="{{ $customerDetail->city }}" id="city" name="city"
                                                       placeholder="Your City">
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="zip">Zip-Code</label>
                                                <input type="text" class="form-control"
                                                       value="{{ $customerDetail->zip }}" id="zip" name="zip"
                                                       placeholder="Your Zip Code">
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="street_address">Street Address</label>
                                                <input type="text" class="form-control" id="street_address"
                                                       value="{{ $customerDetail->street_address }}"
                                                       name="street_address"
                                                       placeholder="Your Street Address">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="button-group">
                                        <button type="submit" id="savBtn">Save / Changes</button>
                                        <button type="button" onclick="goBackEditProfile();">Go Back</button>
                                    </div>
                                </form>
                            </div>
                            <!-- For Edit Profile End Here -->

                            <!-- For Email Verification Start Here -->
                            <div class="EditemailVerification verification hide">
                                <div class="head mb-4">
                                    <h2>Security Verification</h2>
                                </div>
                                <div class="verifyBox">
                                    <div class="img-box">
                                        <figure><img src="img/security.png" alt=""></figure>
                                    </div>
                                    <p>To protect your account security, we need to verify your identity
                                        Please choose a way to verify:</p>
                                    <form>
                                        <div class="form-group">
                                            <input type="email" class="form-control black"
                                                   placeholder="Verify Through Email">
                                        </div>
                                        <div class="form-group">
                                            <input type="tel" class="form-control transparent"
                                                   placeholder="Verify Through Sms Code">
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- For Email Verification End Here -->

                            <!-- For Edit Mobile Number Box Start Here -->
                            <div class="EditMobileNumber verification hide">
                                <div class="head mb-4">
                                    <h2>Security Verification</h2>
                                </div>
                                <div class="verifyBox">
                                    <div class="img-box">
                                        <figure><img src="img/security.png" alt=""></figure>
                                    </div>
                                    <p>To protect your account security, we need to verify your identity
                                        Please choose a way to verify:</p>
                                    <form>
                                        <div class="form-group">
                                            <input type="email" class="form-control black"
                                                   placeholder="Verify Through Email">
                                        </div>
                                        <div class="form-group">
                                            <input type="tel" class="form-control transparent"
                                                   placeholder="Verify Through Sms Code">
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- For Edit Mobile Number Box End Here -->

                        </div>
                        <!-- First tab End Here -->

                        <!-- Second tab Second Start Here -->
                        <div class="tab-pane fade" id="v-pills-myorders" role="tabpanel"
                             aria-labelledby="v-pills-myorders-tab">
                            <div class="title">
                                <h3>My Orders</h3>
                            </div>
                            @if(count($orders) > 0)
                                @foreach($orders as $k=>$v)
                                    <div class="orderDetailDv">
                                        <div class="aboutOrder">
                                            <div class="topBar">
                                                <div class="orderNumberDate">
                                                    <div class="orderNo">
                                                        <div class="property">
                                                            <h5>Order No.</h5>
                                                        </div>
                                                        <div class="value">
                                                            <h5 class="Number">#{{ $v->id }}</h5>
                                                        </div>
                                                    </div>
                                                    <div class="date">
                                                        <p><span>Placed</span>
                                                            on {{ date('d M Y H:i:s',strtotime($v->created_at)) }}</p>
                                                    </div>
                                                </div>

                                                <div class="actionBtn">
                                                    <a class="btn btn-light" data-toggle="collapse"
                                                       href="#collapse{{ $v->id }}"
                                                       role="button" aria-expanded="false"
                                                       aria-controls="collapse{{ $v->id }}">
                                                        <i class="fa fa-angle-down"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="Productstable collapse" id="collapse{{ $v->id }}">
                                                @foreach($v->details as $val)
                                                    @if(!empty($val->product))
                                                        <div class="row align-items-center">
                                                            <div class="col-lg-5">
                                                                <div class="productview">
                                                                    <div class="img-box">
                                                                        <?php $images = json_decode($val->product->images, true); ?>
                                                                        @if(count($images) > 0)
                                                                            <img
                                                                                src="{!! \App\CPU\ProductManager::product_image_path('product','/'.$images[0]) !!}"
                                                                                width="100%" alt="Card image cap">
                                                                        @else
                                                                            <img src="{!! frontImage('Clip.png') !!}"
                                                                                 width="100%" alt="Card image cap">
                                                                        @endif
                                                                    </div>
                                                                    <div class="contentDv">
                                                                        <p class="m-0">{{ $val->product->name }}</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-2">
                                                                <div class="qtyDv">
                                                                    <label for="quantity">Qty :</label>
                                                                    <input type="text" id="quantity"
                                                                           value="{{ $val->qty }}">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-2">
                                                                <div class="status">
                                                                    <div class="tag">
                                                                        {{ $v->order_status }}
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            {{--                                        <div class="col-lg-3">--}}
                                                            {{--                                            <div class="deliveredDate">--}}
                                                            {{--                                                <p><span>Delivered</span> on 04 Oct 2021 23:20:55</p>--}}
                                                            {{--                                            </div>--}}
                                                            {{--                                        </div>--}}
                                                        </div>
                                                    @endif
                                                @endforeach
                                            </div>
                                        </div>

                                    </div>
                                @endforeach
                            @else
                                <p>Orders Not Found</p>
                            @endif
                        </div>
                        <!-- Second tab Second End Here -->

                        <!-- Third Tab Start Here -->
                        <div class="tab-pane fade" id="v-pills-myreturn" role="tabpanel"
                             aria-labelledby="v-pills-myreturn-tab">
                            <div class="title">
                                <h3>My Returns</h3>
                            </div>
                            @if(count($return_orders) > 0)
                            @foreach($return_orders as $k=>$v)
                                <div class="orderDetailDv">
                                    <div class="aboutOrder">
                                        <div class="topBar">
                                            <div class="orderNumberDate">
                                                <div class="orderNo">
                                                    <div class="property">
                                                        <h5>Order No.</h5>
                                                    </div>
                                                    <div class="value">
                                                        <h5 class="Number">#{{ $v->id }}</h5>
                                                    </div>
                                                </div>
                                                <div class="date">
                                                    <p><span>Placed</span>
                                                        on {{ date('d M Y H:i:s',strtotime($v->created_at)) }}</p>
                                                </div>
                                            </div>

                                            <div class="actionBtn">
                                                <a class="btn btn-light" data-toggle="collapse"
                                                   href="#collapse{{ $v->id }}"
                                                   role="button" aria-expanded="false"
                                                   aria-controls="collapse{{ $v->id }}">
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="Productstable collapse" id="collapse{{ $v->id }}">
                                            @foreach($v->details as $val)
                                                @if(!empty($val->product))
                                                    <div class="row align-items-center">
                                                        <div class="col-lg-5">
                                                            <div class="productview">
                                                                <div class="img-box">
                                                                    <?php $images = json_decode($val->product->images, true); ?>
                                                                    @if(count($images) > 0)
                                                                        <img
                                                                            src="{!! \App\CPU\ProductManager::product_image_path('product','/'.$images[0]) !!}"
                                                                            width="100%" alt="Card image cap">
                                                                    @else
                                                                        <img src="{!! frontImage('Clip.png') !!}"
                                                                             width="100%" alt="Card image cap">
                                                                    @endif
                                                                </div>
                                                                <div class="contentDv">
                                                                    <p class="m-0">{{ $val->product->name }}</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <div class="qtyDv">
                                                                <label for="quantity">Qty :</label>
                                                                <input type="text" id="quantity"
                                                                       value="{{ $val->qty }}">
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <div class="status">
                                                                <div class="tag">
                                                                    {{ $v->order_status }}
                                                                </div>
                                                            </div>
                                                        </div>
                                                        {{--                                        <div class="col-lg-3">--}}
                                                        {{--                                            <div class="deliveredDate">--}}
                                                        {{--                                                <p><span>Delivered</span> on 04 Oct 2021 23:20:55</p>--}}
                                                        {{--                                            </div>--}}
                                                        {{--                                        </div>--}}
                                                    </div>
                                                @endif
                                            @endforeach
                                        </div>
                                    </div>

                                </div>
                            @endforeach
                            @else
                                <p>Returned Orders Not Found</p>
                                @endif
                        </div>
                        <!-- Third Tab End Here -->

                        <!-- Fourth Tab Start Here -->
                        <div class="tab-pane fade" id="v-pills-mycancelation" role="tabpanel"
                             aria-labelledby="v-pills-mycancelation-tab">
                            <div class="title">
                                <h3>My Cancellations</h3>
                            </div>
                            @if(count($cancelled_orders) > 0)

                            @foreach($cancelled_orders as $k=>$v)
                                <div class="orderDetailDv">
                                    <div class="aboutOrder">
                                        <div class="topBar">
                                            <div class="orderNumberDate">
                                                <div class="orderNo">
                                                    <div class="property">
                                                        <h5>Order No.</h5>
                                                    </div>
                                                    <div class="value">
                                                        <h5 class="Number">#{{ $v->id }}</h5>
                                                    </div>
                                                </div>
                                                <div class="date">
                                                    <p><span>Placed</span>
                                                        on {{ date('d M Y H:i:s',strtotime($v->created_at)) }}</p>
                                                </div>
                                            </div>

                                            <div class="actionBtn">
                                                <a class="btn btn-light" data-toggle="collapse"
                                                   href="#collapse{{ $v->id }}"
                                                   role="button" aria-expanded="false"
                                                   aria-controls="collapse{{ $v->id }}">
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="Productstable collapse" id="collapse{{ $v->id }}">
                                            @foreach($v->details as $val)
                                                @if(!empty($val->product))
                                                    <div class="row align-items-center">
                                                        <div class="col-lg-5">
                                                            <div class="productview">
                                                                <div class="img-box">
                                                                    <?php $images = json_decode($val->product->images, true); ?>
                                                                    @if(count($images) > 0)
                                                                        <img
                                                                            src="{!! \App\CPU\ProductManager::product_image_path('product','/'.$images[0]) !!}"
                                                                            width="100%" alt="Card image cap">
                                                                    @else
                                                                        <img src="{!! frontImage('Clip.png') !!}"
                                                                             width="100%" alt="Card image cap">
                                                                    @endif
                                                                </div>
                                                                <div class="contentDv">
                                                                    <p class="m-0">{{ $val->product->name }}</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <div class="qtyDv">
                                                                <label for="quantity">Qty :</label>
                                                                <input type="text" id="quantity"
                                                                       value="{{ $val->qty }}">
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <div class="status">
                                                                <div class="tag">
                                                                    {{ $v->order_status }}
                                                                </div>
                                                            </div>
                                                        </div>
                                                        {{--                                        <div class="col-lg-3">--}}
                                                        {{--                                            <div class="deliveredDate">--}}
                                                        {{--                                                <p><span>Delivered</span> on 04 Oct 2021 23:20:55</p>--}}
                                                        {{--                                            </div>--}}
                                                        {{--                                        </div>--}}
                                                    </div>
                                                @endif
                                            @endforeach
                                        </div>
                                    </div>

                                </div>
                            @endforeach
                            @else
                                <p>Cancellations Not Found</p>
                                @endif
                        </div>
                        <!-- Fourth Tab End Here -->
                    </div>
                </div>
            </div>
        </div>
    </section>


    <div class="modal" id="changePassword" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <form action="{{ route('account-security') }}" method="post">
                @csrf
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Change Password</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="fullname">Old Password</label>
                            <input type="password" class="form-control" id="old_password" name="current_password"
                                   placeholder="Your Old Password">
                        </div>
                        <div class="form-group">
                            <label for="fullname">New Password</label>
                            <input type="password" class="form-control" id="new_password" name="password"
                                   placeholder="Your New Password">
                        </div>
                        <div class="form-group">
                            <label for="fullname">Confirm Password</label>
                            <input type="password" class="form-control" id="confirm_password" name="confirm_password"
                                   placeholder="Your Confirm Password">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Change</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Profile Content End Here -->

    <!-- Footer include -->
    <!-- Footer include -->
    <script>

        function goeditProfileButton() {
            $(".profileActions .profileDeatils , .profileActions .addressBook").removeClass('show');
            $(".profileActions .profileDeatils , .profileActions .addressBook").addClass('hide');
            $(".profileActions .editProfileDv").removeClass('hide');
            $(".profileActions .editProfileDv").addClass('show');
        }

        function goBackEditProfile() {
            $(".profileActions .profileDeatils , .profileActions .addressBook").removeClass('hide');
            $(".profileActions .profileDeatils , .profileActions .addressBook").addClass('show');
            $(".profileActions .editProfileDv").removeClass('show');
            $(".profileActions .editProfileDv").addClass('hide');
        }
    </script>
@endsection
