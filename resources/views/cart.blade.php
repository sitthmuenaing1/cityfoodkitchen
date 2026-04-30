<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart | CFK</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="{{ asset('styles.css') }}">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>

<div class="container">

@include('header')

<h1 class="py-5 text-dark fw-bold">Shopping Cart</h1>

{{-- Success message --}}
@if(session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
@endif

{{-- Cart content --}}
@if(!empty($menus) && count($menus) > 0)

<table class="table table-bordered text-center align-middle">
    <thead>
        <tr>
            <th>No</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Amount</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        @php $no = 1; $allTotal = 0; @endphp

        @foreach($menus as $key => $menu)
            @php
                $quantity = $menu->quantity;
                $total = $menu->price * $quantity;
                $allTotal += $total;
            @endphp
            <tr>
                <td>{{ $no++ }}</td>
                <td>{{ $menu->mname }}</td>
                <td>${{ $menu->price }}</td>
                <td>
                    <a href="{{ route('qty.minus', $key) }}" class="btn btn-sm btn-secondary">-</a>
                    <span class="mx-2">{{ $quantity }}</span>
                    <a href="{{ route('qty.plus', $key) }}" class="btn btn-sm btn-secondary">+</a>
                </td>
                <td>${{ $total }}</td>
                <td>
                    <a href="{{ route('cart.remove', $key) }}" class="btn btn-sm btn-secondary">Clear</a>
                </td>
            </tr>
        @endforeach

        <tr>
            <td colspan="4" class="text-end"><strong>Total</strong></td>
            <td colspan="2"><strong>${{ $allTotal }}</strong></td>
        </tr>
    </tbody>
</table>

{{-- Place order form --}}
<form method="POST" action="{{ route('place.order') }}">
    @csrf

    <div class="mb-3">
        <label for="phonenumber" class="form-label">Phone Number</label>
        <input type="text" name="phone" id="phonenumber"
               class="form-control @error('phone') is-invalid @enderror"
               value="{{ old('phone') }}" required>
        @error('phone')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>

    <div class="mb-3">
        <label for="billingaddress" class="form-label">Address</label>
        <textarea name="billingaddress" id="billingaddress"
                  class="form-control @error('billingaddress') is-invalid @enderror"
                  required>{{ old('billingaddress') }}</textarea>
        @error('billingaddress')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>

    <h5>Payment Method</h5>
    <div class="mb-3 d-flex flex-column flex-md-row gap-3">
        <div class="form-check">
            <input class="form-check-input" type="radio" name="payment" value="Credit Card" id="credit" required>
            <label class="form-check-label" for="credit"><i class="bi bi-credit-card"></i> Credit Card</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="payment" value="PayPal" id="paypal">
            <label class="form-check-label" for="paypal"><i class="bi bi-paypal"></i> PayPal</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="payment" value="Cash" id="cash">
            <label class="form-check-label" for="cash"><i class="bi bi-cash"></i> Cash</label>
        </div>
    </div>

    <button type="submit" class="btn btn-secondary">Place Order</button>
</form>

@else
    {{-- Only show "Your cart is empty" if there is no success message --}}
    @unless(session('success'))
        <p>Your cart is empty.</p>
    @endunless
@endif

@include('footer')

</div>

</body>
</html>