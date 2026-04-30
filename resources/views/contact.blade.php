<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact | CFK</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="{{ asset('styles.css') }}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>

<div class="container">

    @include('header')

    <h1 class="py-5 text-dark fw-bold">Contact Us</h1>

    <div class="row text-center">

        <!-- Email -->
        <div class="col-md-4">
            <div class="py-5">
                <p>
                    <a href="mailto:customerservice@cityfoodkitchen.com">
                        <i class="bi bi-envelope-fill text-danger fs-4"></i>
                    </a>
                </p>
                <p>customerservice@cityfoodkitchen.com</p>
            </div>     
        </div>

        <!-- Phone -->
        <div class="col-md-4">
            <div class="py-5">
                <p>
                    <a href="tel:+12125550123">
                        <i class="bi bi-telephone-fill text-danger fs-4"></i>
                    </a>
                </p>
                <p>+1 212 555-0123</p>
            </div>
        </div>

        <!-- Address -->
        <div class="col-md-4">
            <div class="py-5">
                <p>
                    <a href="https://www.google.com/maps/search/?api=1&query=742+8th+Ave+New+York+NY+10036" target="_blank">
                        <i class="bi bi-geo-alt-fill text-danger fs-4"></i>
                    </a>
                </p>
                <p>
                    742 8th Ave,<br>
                    New York, NY 10036,<br>
                    United States
                </p>
            </div>
        </div>

    </div>

    @include('footer')

</div>

</body>
</html>