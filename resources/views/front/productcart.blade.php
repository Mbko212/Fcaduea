@extends('layouts.front.app')

@section('title','Welcome To '. $web_config['name']->value.' Accessories')

@section('content')
<!-- Stylesheet -->
<link rel="stylesheet" href="{!! frontCss('productcart.css') !!}">
<!-- Stylesheet -->

<!-- Book Mark Start Here -->
<section class="productCart">
    <div class="container">
        <div class="heading">
            <h3 class="text-center title font-40 fw-600">Product Cart</h3>
        </div>
        @if(!empty($cart))
        <div class="tableDv tabel">
            @if ( count($cart) > 0)

            <table class="table-responsive">
                <tr class="topbar">
                    <th class="productDetail">PRODUCT NAME</th>
                    <th class="Proprice">UNIT PRICE</th>
                    <th class="qty">QUANTITY</th>
                    <th class="addcart">SUB TOTAL</th>
                </tr>
                        <?php $subTotal = 0; ?>
                        @foreach ($cart as $key => $cartItem)
                            <?php $total =  intval($cartItem['price']) * intval($cartItem['quantity']);
                                  $subTotal += $total;
                            ?>
{{--                            {{ var_dump($cartItem) }}--}}
                            <tr class="products">
                                <td class="productDetail">
                                    <div class="product-detail flex-column">
                                        <div class="img-box">
                                            <figure class="text-center"><img class="img-fluid" width="30%" src="{{ productImage('/thumbnail',$cartItem['thumbnail']) }}" alt=""></figure>
                                        </div>
                                        <div class="name">
                                            <p class="font-13">{{ $cartItem['name'] }}</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="Proprice">
                                    <h5 class="font-15">${{ $cartItem['price'] }}</h5>
                                </td>
                                <td class="qty">
                                    <input type="number" min="1" id="quantity{{ $cartItem['id'] }}" name="quantity{{ $cartItem['id'] }}" onchange="updateQuantity({{ $cartItem['id'] }});" value="{{ $cartItem['quantity'] }}">
                                </td>
                                <td class="addcart">
                                    <div class="ActionBtn">
                                        <div class="cartBtn">
                                            <p id="subTotal{{ $cartItem['id'] }}">${{ $total }}</p>
                                        </div>
                                        <div class="deleteBtn" onclick="window.location.href='{{ route('cart.remove', $key) }}'">
                                            <i class="fa fa-times" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
            </table>

            <div class="row pt-5">
                <div class="col-lg-6">
{{--                    <div class="discountCode">--}}
{{--                        <div class="head">--}}
{{--                            <p>Discount codes</p>--}}
{{--                        </div>--}}
{{--                        <div class="applyCoupon">--}}
{{--                            <input type="text" placeholder="Enter your coupon code if you have one.">--}}
{{--                            <button>APPLY</button>--}}
{{--                        </div>--}}
{{--                    </div>--}}
                </div>
                <div class="col-lg-6 text-right">
                    <div class="productSummary">
                        <div class="subTotal">
                            <h6 class="rightt" style="color:#989898;">Subtotal</h6>
                            <h6 style="color:#989898;">Estimated Shipping Cost</h6>
                        </div>
                        <div class="shipping">
                            <h6 class="price totalPriceUpdate" style="color:#989898;">$ {{ $subTotal }}</h6>
                            <h6 style="color:#989898;">Free Shipping</h6>
                        </div>
                    </div>
                    <div class="Total">
                        <div class="property">
                            <p>TOTAL COST</p>
                        </div>
                        <div class="value">
                            <p class="totalPriceUpdate">$ {{ $subTotal }}</p>
                        </div>
                    </div>
                </div>
            </div>
            @endif

        </div>
        @endif

        <div class="row align-items-baseline">
            <div class="col-lg-6">
                <div class="button-group">
                    <a href="{{ route('shop') }}" class="btn">Continue Shopping</a>
                    <a href="{{ route('cart.remove.all') }}" class="btn grey">Clear</a>
                </div>
            </div>
            @if(!empty($cart))
            <div class="col-lg-6 text-right">
                <div class="proceed">
                    <a href="{{ route('checkout') }}" class="btn">Proceed To Checkout</a>
                    <h6 style="color:#989898;">You’ll still have a chance to review your order</h6>
                </div>
            </div>
            @endif

        </div>
    </div>
</section>

@push('js')
    <script>
        function updateQuantity(key) {
           let qty = $(`input[name=quantity${key}]`).val();
            $.post('{{ route('cart.updateQuantity') }}?key='+key,{
                _token : '{{ csrf_token() }}',
                quantity : qty,
            },function (e) {
                // console.log("qty",qty);
                if(e.message === 'Cart has been updated!'){
                    toastr.success(e.message);
                    let total = 0;
                    e.cart.map((val)=>{
                        total += parseInt(val['price']) * parseInt(val['quantity']);
                    });
                    let cart = e.cart.filter((val)=>val.id == key);
                    $(`#subTotal${key}`).html('$'+parseInt(cart[0]['price']) * parseInt(cart[0]['quantity']));
                    $('.totalPriceUpdate').html('$'+total);
                    console.log("TOtla",total);
                }else if(e.message === 'Product out of stock!'){
                    toastr.warning(e.message);
                }
                console.log(e,key);
            });
        }
    </script>
@endpush
<!-- Book Mark End Here -->

@endsection
