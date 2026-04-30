<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home | CFK</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="{{ asset('styles.css') }}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
</head>
<body>

<div class="container">

    @include('header')

    <h1 class="py-5 text-dark fw-bold">Welcome to City Food Kitchen</h1>
     <p class="lead text-center">Delicious meals delivered to your doorstep, with love and care!</p>

     


<div class="container mt-5">
    <h2>About Us</h2>
    <p style="text-align: justify;">
        City Food Kitchen started with a simple mission: to bring fresh, high-quality food to everyone in New York. 
        We believe in using the finest ingredients, preparing each meal with care, and offering an unforgettable dining experience. 
        Whether you are enjoying our freshly prepared meals at our restaurant or at your home, at your work and on the go, we strive to make every bite flavorful and satisfying.
    </p>
    <p style="text-align: justify;">
        Here, you can explore our <a href="{{ url('food') }}" class="text-danger">Food</a> page for main dishes, and visit our <a href="{{ url('drinks') }}" class="text-danger">Drinks</a> page to explore refreshing beverages. 
        Hungry? Let City Food Kitchen bring the taste of quality meals right to you!
    </p>
    <p class="text-align: justify;">Firstly, you must be logged in to place an order and access your profile. And then, you can review and complete your order on the Cart page.</p>
<p class="text-align: justify;">You can also click the pictures below to explore the menu!</p>

</div>

<div class="row">

  <div class="col-6 p-2">
    <div class="bg-light-subtle py-5 text-center h-100">
      <a href="{{ url('food') }}">
        <img src="{{ asset('images/03.jpg') }}" class="img-fluid">
      </a>
      <p class="mt-2">Food</p>
    </div>
  </div>

  <div class="col-6 p-2">
    <div class="bg-light-subtle py-5 text-center h-100">
      <a href="{{ url('drinks') }}">
        <img src="{{ asset('images/16.png') }}" class="img-fluid">
      </a>
      <p class="mt-2">Drinks</p>
    </div>
  </div>

</div>

<div class="container mt-4">
    <h2>Our Vision</h2>
    <p style="text-align: justify;">
        At City Food Kitchen, our vision is to become the most trusted and loved restaurant in New York. 
        We aim to combine tradition with innovation, bringing new flavors while keeping the comfort of familiar favorites. 
        Sustainability, customer satisfaction, and culinary creativity guide everything we do. 
        Every decision we make, from sourcing ingredients to delivering your order, is guided by our passion for excellence.
    </p>
    <p style="text-align: justify;">
        We envision a world where everyone can enjoy delicious, nutritious meals without compromise. 
        Join us on this journey, and experience the joy of food made with care.
    </p>

<p style="text-align: justify;">Here is the location map of City Food Kitchen.</p>
</div>

<div id="map"></div>

<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
<script>
  
    const storeLocation = [40.7625, -73.9860];

   
    const map = L.map('map').setView(storeLocation, 15);

    
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '© OpenStreetMap'
    }).addTo(map);

  
    L.marker(storeLocation).addTo(map)
        .bindPopup('<b>City Food Kitchen</b><br>742 8th Ave, New York, NY 10036, USA')
        .openPopup();
</script>

<div class="container mt-4 mb-5">
    <h2>Contact Us</h2>
    <p style="text-align: justify;">If you have any questions, feedback, or special requests, we'd love to hear from you! Reach out via our <a href="{{ url('contact') }}" class="text-danger">Contact Page</a> and we'll respond promptly.</p>
</div>


    @include('footer')

</div>

</body> 
</html>