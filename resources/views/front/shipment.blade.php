@extends('layouts.front.app')

@section('title','Welcome To '. $web_config['name']->value.' CheckOut')

@section('content')
<!-- Header include -->
<!-- Stylesheet -->
<link rel="stylesheet" href="{{ frontCss('shipment.css') }}">
<!-- Stylesheet -->
<link rel="stylesheet" href="https://unpkg.com/materialize-stepper@3.1.0/dist/css/mstepper.min.css">
<script src="https://polyfill.io/v3/polyfill.min.js?version=3.52.1&features=fetch"></script>
<script src="https://js.stripe.com/v3/"></script>

<!-- steps section  -->
<section class="signup-step-container shipment-form">
    <div class="container">
        <div class="shipment-form-head">
            <h2>CheckOut Process</h2>
        </div>

        <form id="paymentFrm" method="post" action="{{ route('checkout-payment') }}">
            @csrf
        <div class="row d-flex justify-content-center">
            <div class="col-md-8">
                <h4 class="">Enter Your Address Details</h4>
                <div class="card p-5">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <!-- <label>First and Last Name *</label>  -->
                                <input class="form-control" type="text" value="{{ $customerDetail->f_name }}" name="f_name"
                                       placeholder="First Name">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <!-- <label>Phone Number  *</label>  -->
                                <input class="form-control" type="text" required value="{{ $customerDetail->l_name }}" name="l_name" placeholder="Last Name">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <!-- <label>Email Address *</label>  -->
                                <input class="form-control" type="tel" required name="phone" value="{{ $customerDetail->phone }}"
                                       placeholder="Phone Number">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <!-- <label>Password *</label>  -->
                                <input class="form-control" type="email" name="email" value="{{ $customerDetail->email }}" placeholder="Email">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <input class="form-control" type="text" name="country" value="{{ $customerDetail->country }}" placeholder="Country">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <!-- <label>Email Address *</label>  -->
                                <input class="form-control" type="text" name="city" value="{{ $customerDetail->city }}" placeholder="City">
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <input class="form-control" type="text" name="zip" value="{{ $customerDetail->zip }}" placeholder="Zip Code">
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-textarea form-group">
                                <textarea name="address" class="form-control" id="exampleFormControlTextarea1" rows="3"
                                placeholder="Enter Your Street Address">{{ $customerDetail->street_address }}</textarea>
                            </div>
                        </div>
                    </div>
                </div>

{{--                <div class="card mt-3 p-5">--}}
{{--                    <h4 class="">Payment Options</h4>--}}
{{--                    <div class="main-areas">--}}
{{--                        <div class="input-details">--}}
{{--                            <div class="form-group">--}}
{{--                                <label>CARD NUMBER</label>--}}
{{--                                <div id="card_number" class="form-control field"></div>--}}
{{--                            </div>--}}

{{--                            <div class="row">--}}
{{--                                <div class="col-6">--}}
{{--                                    <div class="form-group">--}}
{{--                                        <label>EXPIRY DATE</label>--}}
{{--                                        <div id="card_expiry" class="form-control field"></div>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                                <div class="col-6">--}}
{{--                                    <div class="form-group">--}}
{{--                                        <label>CVC CODE</label>--}}
{{--                                        <div id="card_cvc" class="field form-control"></div>--}}
{{--                                    </div>--}}
{{--                                </div>--}}
{{--                            </div>--}}

{{--                        </div>--}}
{{--                    </div>--}}
                    <button type="submit" style="width: 100%;" class="mt-2 btn btn-rounded btn-info">Checkout</button>

{{--                </div>--}}

            </div>
            <div class="col-md-4">
                <h4 class="">Products</h4>

                <div class="card px-2 py-3">
                    @if (count($cart) > 0)
                    <div class="row">
                        <?php $subTotal = 0; ?>
                        @foreach ($cart as $key => $cartItem)
                            <?php $total =  intval($cartItem['price']) * intval($cartItem['quantity']);
                            $subTotal += $total;
                            ?>
                        <div class="col-md-12 py-5 " style="{{ ($key+1 !== count($cart))? 'border-bottom: 1px solid #70707042' : '' }}">
                            <div class="form-pro form-group">
                                <img class="img-fluid" width="20%" src="{{ productImage('/thumbnail',$cartItem['thumbnail']) }}" alt="">
                                <h3 style="width: 70%" class="ml-2">{{ $cartItem['name'] }}</h3>
                                <h5 style="width: 10%;">X{{ $cartItem['quantity'] }}</h5>
                            </div>
                        </div>
                        @endforeach



                    </div>
                    @endif
                </div>

                <div class="card my-2">
                    <div class="col-md-12 py-5" style="border-bottom: 1px solid #70707042">
                        <div class="productSummary">
                            <div class="subTotal d-flex justify-content-between align-items-center">
                                <h6 class="rightt" style="color:#989898;">Subtotal</h6>
                                <h6 style="color:#989898;" id="subTotalPrice">${{ abs($subTotal) }}</h6>
                            </div>

                            <div class="coupon d-flex justify-content-between align-items-center">
                                <h6 class="rightt" style="color:#989898;">Coupon</h6>
                                <h6 style="color:#989898;" id="couponPrice">$0.00</h6>
                            </div>

                        </div>
                        <div class="Total d-flex justify-content-between align-items-center">
                            <div class="property">
                                <p>TOTAL COST</p>
                            </div>
                            <div class="value">
                                <p id="totalPrice">${{ abs($subTotal) }}</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card my-2">
                    <div class="col-md-12 py-5">
                        <div class="discountCode">
                            <div class="head">
                                <p>Discount codes</p>
                            </div>
                            <div class="applyCoupon">
                                <input type="text" id="code" class="form-control"
                                placeholder="Enter your coupon code if you have one.">
                            </div>
                            <button onclick="applyCoupon();" type="button" style="width: 100%;" class="mt-2 btn btn-rounded btn-info">Apply</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>
</section>
<!-- end of steps section  -->

<script src="https://js.stripe.com/v3/"></script>
<script>
    // Create an instance of the Stripe object
    // Set your publishable API key
    var stripe = Stripe('pk_test_51Htt4kBWz16oBSwkY9pAtAjnUTMRJgTO2IT9kAFvhOWAr7azMnMD5ArGoYDVUVIw0j592abv5KvRm2HCAuw4p5Zt00415ahcE4');

    // Create an instance of elements
    var elements = stripe.elements();

    var style = {
        base: {
            fontWeight: 400,
            fontFamily: 'Roboto, Open Sans, Segoe UI, sans-serif',
            // fontSize: '16px',
            // lineHeight: '1.4',
            color: '#555',
            // backgroundColor: '#fff',
            '::placeholder': {
                color: '#888',
            },
        },
        invalid: {
            color: '#eb1c26',
        }
    };

    var cardElement = elements.create('cardNumber', {
        style: style
    });
    cardElement.mount('#card_number');

    var exp = elements.create('cardExpiry', {
        'style': style
    });
    exp.mount('#card_expiry');

    var cvc = elements.create('cardCvc', {
        'style': style
    });
    cvc.mount('#card_cvc');

    // Validate input of the card elements
    var resultContainer = document.getElementById('paymentResponse');
    cardElement.addEventListener('change', function(event) {
        if (event.error) {
            resultContainer.innerHTML = '<p>'+event.error.message+'</p>';
        } else {
            resultContainer.innerHTML = '';
        }
    });

    // Get payment form element
    var form = document.getElementById('paymentFrm');

    // Create a token when the form is submitted.
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        createToken();
    });

    // Create single-use token to charge the user
    function createToken() {
        stripe.createToken(cardElement).then(function(result) {
            if (result.error) {
                // Inform the user if there was an error
                resultContainer.innerHTML = '<p>'+result.error.message+'</p>';
            } else {
                // Send the token to your server
                stripeTokenHandler(result.token);
            }
        });
    }

    // Callback to handle the response from stripe
    function stripeTokenHandler(token) {
        // Insert the token ID into the form so it gets submitted to the server
        var hiddenInput = document.createElement('input');
        console.log("Stripe Token",token.id);
        hiddenInput.setAttribute('type', 'hidden');
        hiddenInput.setAttribute('name', 'stripeToken');
        hiddenInput.setAttribute('value', token.id);
        form.appendChild(hiddenInput);

        // Submit the form
        form.submit();
    }

    function applyCoupon(){
        let code = $('#code').val();
        $.post('{{ route('coupon.apply') }}',{_token : '{{ csrf_token() }}', code :code },function (e){
            console.log(e);
            if(e['status']== '0'){
                toastr.error(e['messages']);
            }else{
                toastr.error(e['messages'][0]);
                $('#couponPrice').html(e['discount']);
                $('#totalPrice').html(e['total']);
                $('.discountCode').html(`
                <div class="head">
                <p>Coupon Code is Applied</p>
                </div>
`               );
            }
        })
    }
</script>

<!-- Footer include -->
@endsection

<!-- Footer include -->
