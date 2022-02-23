@extends('layouts.front.app')
@section('title','Register')
@section('content')
    <div class="container frmssxx">
        <div class="row">
            <div class="col-sm-12 text-center">
                <div class="loginsxx">
                    <h2>Register</h2>
                    <h4>Register for a more personalized shopping experience</h4>
                    <form id="sign-up-form" autocomplete="off" method="post" role="form">
                        <div class="messages"></div>
                        <div class="controls">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" name="first_name" class="form-control"
                                               placeholder="First Name" required>
{{--                                        <div class="help-block with-errors"></div>--}}
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" name="last_name" class="form-control"
                                               placeholder="Last Name" required>
{{--                                        <div class="help-block with-errors"></div>--}}
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="email" name="email" class="form-control"
                                               placeholder="Email Address" required pattern="([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})"
                                               title="Please provide a valid email">
{{--                                        <div class="help-block with-errors"></div>--}}
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" name="phone" class="form-control"
                                               placeholder="Phone Number" required>
{{--                                        <div class="help-block with-errors"></div>--}}
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="input-group" id="show_hide_password">
                                            <input class="form-control" name="password" type="password"
                                                   placeholder="Password" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="input-group" id="show_hide_password">
                                            <input name="confirm_password" type="password" class="form-control"
                                                   placeholder="Confirm Password" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <input type="submit" class="btn btn-dark btn-submit mt-3" value="Register">
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="newx mt-2">
                        Already have an account? <a href="{!! route('customer.auth.login') !!}">Sign In</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script>
        // $('#inputCheckd').change(function () {
        //     // console.log('jell');
        //     if ($(this).is(':checked')) {
        //         $('#sign_in').removeAttr('disabled');
        //     } else {
        //         $('#sign_in').attr('disabled', 'disabled');
        //     }
        //
        // });
        $('#sign-up-form').submit(function (e) {
            e.preventDefault();
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                url: '{{route('customer.auth.register')}}',
                dataType: 'json',
                method: 'POST',
                data: $('#sign-up-form').serialize(),
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    if (data.errors) {
                        for (var i = 0; i < data.errors.length; i++) {
                            toastr.error(data.errors[i].message, {
                                CloseButton: true,
                                ProgressBar: true
                            });
                        }
                    } else {
                        toastr.success(data.message, {
                            CloseButton: true,
                            ProgressBar: true
                        });
                        setInterval(function () {
                            location.href = data.url;
                        }, 2000);
                    }
                },
                complete: function () {
                    $('#loading').hide();
                },
                error: function () {
                    toastr.error('password does not match!', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        });
    </script>
@endpush
