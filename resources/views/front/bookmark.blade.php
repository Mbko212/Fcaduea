@extends('layouts.front.app')

@section('title','Welcome To '. $web_config['name']->value.' Bookmark')

@section('content')

<!-- Stylesheet -->
<link rel="stylesheet" href="{{ frontCss('bookmark.css') }}">
<!-- Stylesheet -->

<!-- Book Mark Start Here -->
<section class="bookmark">
    <div class="container">
        <div class="heading">
            <h3 class="text-center title font-40 fw-600">Product BookMarks</h3>
        </div>
        <div class="tableDv">
            <table>
                <tr class="topbar">
                    <th class="productDetail">PRODUCT NAME</th>
                       <th class="Proprice">UNIT PRICE</th>
                    <th class="addcart">ADD TO CART</th>
                </tr>
                @foreach($wishlists as $k=>$v)
                    @if(!empty($v->product))
                        <tr class="products">
                            <td class="productDetail">
                                <div class="product-detail flex-column">
                                    <div class="img-box">
                                        <figure class="text-center">
                                            <img class="img-fluid" width="30%"
                                            src="{{ productImage('/thumbnail',$v->product->thumbnail) }}" alt="">
                                        </figure>
                                    </div>
                                    <div class="name">
                                        <p class="font-13">{{ $v->product->name }}</p>
                                    </div>
                                </div>
                            </td>
                            <td class="Proprice">
                                <h5 class="font-15">${{ $v->product->unit_price }}</h5>
                            </td>
                            <td class="addcart">
                                <div class="ActionBtn">
                                    <div class="cartBtn">
                                        <form action="{{ route('cart.add') }}" id="cart" method="post">
                                            @csrf
                                            <input type="hidden" name="product_id" value="{{ $v->product->id }}">
                                            <input type="hidden" name="slug" value="{{ $v->product->slug }}">
                                            <input type="hidden" name="quantity" min="1" value="1" id="qty">
                                            <p>
                                                <button type="submit">
                                                    Add to cart
                                                    <i class="fa fa-shopping-basket" aria-hidden="true"></i>
                                                </button>
                                            </p>
                                        </form>
                                    </div>
                                    <div class="deleteBtn" onclick="window.location.href='{{ route('delete-wishlist',$v->product->slug) }}';">
                                        <i class="fa fa-times" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    @endif
                @endforeach
            </table>
            @if(!empty($wishlists))
                <div class="button-group">
                    <a href="{{ route('shop') }}" class="btn">Continue Shopping</a>
                    <a href="{{ route('delete-all-wishlist') }}" class="btn grey">Clear Bookmarks</a>
                </div>
            @endif
        </div>
    </div>
</section>
<!-- Book Mark End Here -->

<!-- Footer include -->
@endsection

<!-- Footer include -->
