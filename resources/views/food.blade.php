<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Food | CFK</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="{{ asset('styles.css') }}">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>

<div class="container">

    @include('header')

    <h1 class="py-5 text-dark fw-bold">Food</h1>
     

    <!-- Cart Button -->
    <div class="text-end my-3">
        <a href="{{ url('cart') }}">
            <button type="button" class="btn btn-secondary">
                <i class="bi bi-cart"></i>
                <span class="badge bg-danger">
                    {{ session('cart') ? count(session('cart')) : 0 }}
                </span>
            </button>
        </a>
    </div>

    <div class="row">
        @foreach($menus as $row)
        <div class="col-12 col-sm-6 col-md-4 mb-4 text-center">
            <img src="{{ asset('images/'.$row->imgs) }}" 
                 alt="{{ $row->mname }}" 
                 class="images">

            <ul class="list-unstyled mt-2">
                <li><strong>{{ $row->mname }}</strong></li>
                <li>Price: $ {{ $row->price }}</li>
            </ul>

            <a href="{{ url('add-to-cart/'.$row->mid) }}" 
               class="btn btn-secondary add-to-cart">
                <i class="bi bi-cart"></i> Add to Cart
            </a>
        </div>
        @endforeach
    </div>

    @include('footer')

</div>

</body>
</html>