<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | CFK</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="{{ asset('styles.css') }}">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

</head>
<body>

<div class="container">

<h1 class="py-5 text-danger text-center">
<a class="navbar-brand fw-bold d-flex justify-content-center align-items-center text-danger" href="{{ url('/') }}">
<i class="bi bi-shop me-2"></i> City Food Kitchen
</a>
</h1>

@if(session('error'))
<div class="alert alert-danger text-center">
{{ session('error') }}
</div>
@endif

@if(session('success'))
<div class="alert alert-success text-center">
{{ session('success') }}
</div>
@endif

@if ($errors->any())
<div class="alert alert-danger">
<ul class="mb-0">
@foreach ($errors->all() as $error)
<li>{{ $error }}</li>
@endforeach
</ul>
</div>
@endif

<form method="POST" action="{{ route('login.post') }}">
@csrf

<div class="row justify-content-center">
<div class="col-md-5 col-sm-8"> 

<div class="form-group py-2">
<label>Email</label>
<input type="email" class="form-control" name="email" value="{{ old('email') }}" required>
</div>

<div class="form-group py-2">
<label>Password</label>
<div class="input-group">
<input type="password" class="form-control" id="password" name="password" required>
<button type="button" class="btn btn-outline-secondary" onclick="togglePassword(this)">
<i class="bi bi-eye"></i>
</button>
</div>
</div>

<div class="form-group py-3">
<label>Enter the letters shown below:</label>

<div class="d-flex align-items-center gap-3">
<div id="captchaText" class="border px-3 py-2 fw-bold bg-light"></div>
<input type="text" name="captcha" class="form-control w-25" required>
</div>

<input type="hidden" id="captchaAnswer" name="captcha_answer">
</div>

<div class="form-group py-3">
<button type="submit" class="btn btn-danger">Login</button>
<button type="reset" class="btn btn-secondary">Clear</button>
</div>

</div>
</div>
</form>

<p class="text-center mt-3">
Don't have an account?
<a href="{{ route('register') }}">Register here</a>
</p>

@include('footer')

</div>

<script>
function togglePassword(btn){
let input = document.getElementById("password");
let icon = btn.querySelector("i");

if(input.type === "password"){
input.type = "text";
icon.classList.remove("bi-eye");
icon.classList.add("bi-eye-slash");
}else{
input.type = "password";
icon.classList.remove("bi-eye-slash");
icon.classList.add("bi-eye");
}
}

function generateCaptcha() {
let chars = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789";
let captcha = "";

for(let i=0;i<5;i++){
captcha += chars.charAt(Math.floor(Math.random()*chars.length));
}

document.getElementById("captchaText").innerText = captcha;
document.getElementById("captchaAnswer").value = captcha;
}

generateCaptcha();
</script>

</body>
</html>