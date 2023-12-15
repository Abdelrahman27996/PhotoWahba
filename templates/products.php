<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/photowahba/public/css/products.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/photowahba/public/css/jumbotron-narrow.css" rel="stylesheet">
    <link href="http://bootswatch.com/flatly/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="jumbotron">
    <h1>Jumbotron heading</h1>
    <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
    <p><a class="btn btn-lg btn-success" href="#" role="button">Sign up today</a></p>
    </div>
    <?php foreach ($products as $product) : ?>
    <div class="row marketing">
        <div class="col-md-10">
            <h4><?php echo $product->name; ?></h4>
            <img src="<?php echo $product->image;?>" width="100px"/>
            <p><?php echo $product->Price;?></p>
        </div>
        <div class="col-md-2">
            <a class="btn btn-default" href="#">View</a>
        </div>
    </div>
    <?php endforeach; ?>
</div> <!-- /container -->

</body>
</html>
