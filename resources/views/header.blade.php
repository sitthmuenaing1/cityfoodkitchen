<header>
<nav class="navbar navbar-expand-lg bg-light">
    
  <div class="container-fluid">
   <a class="navbar-brand fw-bold d-flex align-items-center text-danger" href="{{ url('/') }}">
      <i class="bi bi-shop me-2 fs-4"></i>
      City Food Kitchen
    </a>
    
    <button class="navbar-toggler" type="button" 
      data-bs-toggle="collapse" 
      data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">

        <li class="nav-item">
          <a class="nav-link text-danger" href="{{ url('/') }}">Home</a>
        </li>

      <li class="nav-item">
          <a class="nav-link text-danger" href="{{ url('/contact') }}">Contact</a>
        </li>

        <li class="nav-item">
          <a class="nav-link text-danger" href="{{ url('/food') }}">Food</a>
        </li>

        <li class="nav-item">
          <a class="nav-link text-danger" href="{{ url('/drinks') }}">Drinks</a>
        </li>
       
         <li class="nav-item">
          <a class="nav-link text-danger" href="{{ url('/cart') }}">Cart</a>
        </li>
  
        <li class="nav-item">
          <a class="nav-link text-danger" href="{{ url('/profile') }}">Profile</a>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-danger" href="#" 
             role="button" 
             data-bs-toggle="dropdown">
            Login/Register
          </a>
          <ul class="dropdown-menu dropdown-menu-end">
            <li>
              <a class="dropdown-item text-danger" href="{{ url('/login') }}">Login</a>
            </li>
            <li><hr class="dropdown-divider"></li>
            <li>
              <a class="dropdown-item text-danger" href="{{ url('/register') }}">Register</a>
            </li>
          </ul>
        </li>

      </ul>
    </div>
  </div>
</nav>


<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="{{ asset('images/h01.png') }}" class="d-block w-100" alt="h01">
    </div>
    <div class="carousel-item">
      <img src="{{ asset('images/h02.png') }}" class="d-block w-100" alt="h02">
    </div>
    <div class="carousel-item">
      <img src="{{ asset('images/h03.png') }}" class="d-block w-100" alt="h03">
    </div>
  </div>  

  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>

  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>

</header>