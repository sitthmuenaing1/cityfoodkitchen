<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile | CFK</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="{{ asset('styles.css') }}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>

<div class="container">

    @include('header')

    <h1 class="py-5 text-dark fw-bold">My Profile</h1>

<div class="card shadow-sm mt-4">
<div class="card-body">

<h3 class="card-title text-secondary">
<i class="bi bi-person-circle"></i>
{{ Auth::user()->name }}
</h3>

<p class="card-text">
<i class="bi bi-envelope"></i>
<strong>Email:</strong>
{{ Auth::user()->email }}
</p>

<p class="card-text">
<i class="bi bi-person-badge"></i>
<strong>User ID:</strong>
{{ Auth::user()->id }}
</p>

</div>
</div>

<form method="POST" action="{{ route('logout') }}" class="mt-3">
@csrf
<button type="submit" class="btn btn-secondary">
<i class="bi bi-box-arrow-right"></i> Logout
</button>
</form>

    
    @include('footer')

</div>

</body> 
</html>