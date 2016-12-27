<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/theme/radiance/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/theme/radiance/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/radiance/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/theme/radiance/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<div id="cartBox">
<div class="container">
	<div class="row">
		<div class="col-sm-12">
        <div class="closeCartBox">
        	<a href="javascript:void(0)"><img src="catalog/view/theme/radiance/image/radiance/close-button.png" alt="Close Cart Box"></a>
        </div>
        <?php echo $cart; ?>
        </div>
	</div>
</div>
</div>
<div id="searchBox">
<div class="container">
	<div class="row">
		<div class="col-sm-12"><?php echo $search; ?></div>
	</div>
</div>
</div>
<header>
<nav id="top">
  <div class="container">
  	<div class="row">
    	<div class="hidden-xs col-sm-5 col-md-4 col-lg-4 login-register-links">
        	<?php if($logged) { ?>
            <ul class="list-unstyled">
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            </ul>
        	<?php } else { ?>
            <?php echo $text_login_register; ?>
            <?php } ?>
        </div>
        <div class="col-xs-5 col-sm-4 col-md-5 col-lg-6">
        	<ul class="list-unstyled currency-language">
        	<li style="float: left;"><?php echo $currency; ?></li>
            <li style="float: left;"><?php echo $language; ?></li>
            </ul>
        </div>
        <div class="col-xs-7 col-sm-3 col-md-3 col-lg-2">
        	<div class="search-cart">
        		<div class="search">
                	<a href="javascript:void(0)" class="toggleSearch"><i class="fa fa-search"></i></a>
                </div>
        		<div class="cart">
                	<a href="javascript:void(0)" class="toggleCart"><?php echo $cart_text; ?><span><?php echo $text_quantity_items; ?></span></a>
                </div>
        	</div>
        </div>
    </div>
  </div>
</nav>
<nav id="top-mobile">
	<?php if (count($languages) > 1) {?>
   	<div class="language">
    	<a href="javascript:void(0)" class="visible-xs toggleLanguageSwitch">
        <?php foreach ($languages as $language) { ?>
        <?php if ($language['code'] == $code_lang) { ?>
        <img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">
        <?php } ?>
        <?php } ?>
        </a>
        <select id="languageSwitch" class="visible-xs">
        <?php foreach ($languages as $language) { ?>
        <?php if($language['code'] == $code_lang) { ?>
        <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
        <?php } ?>
        <?php } ?>
        </select>
    </div>
    <?php } ?>
    <?php if (count($currencies) > 1) {?>
	<div class="currency">
    	<a href="javascript:void(0)" class="visible-xs toggleCurrencySwitch">
        	<?php foreach ($currencies as $currency) { ?>
            <?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
            <?php echo $currency['symbol_left']; ?>
            <?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
            <?php echo $currency['symbol_right']; ?>
            <?php } ?>
            <?php } ?>
        </a>
        <select id="currencySwitch" class="visible-xs">
        <?php foreach ($currencies as $currency) { ?>
        <?php if($currency['code'] == $code) { ?>
        <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
        <?php } ?>
        <?php } ?>
        </select>
    </div>
    <?php } ?>
	<div class="search">
        <a href="javascript:void(0)" class="toggleSearch"><i class="fa fa-search"></i></a>
    </div>
	 <div class="cart">
        <a href="javascript:void(0)" class="toggleCart"><i class="fa fa-shopping-cart"></i></a>
    </div>
</nav>
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="hidden-sm hidden-xs col-md-9 col-lg-9">
      <?php if($categories) {?>
      	  <nav id="menu" class="navbar">
            <div class="navbar-header"><span id="category" class="visible-xs visible-sm"><?php echo $text_category; ?></span>
              <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
              <ul class="nav navbar-nav">
                <?php foreach ($categories as $category) { ?>
                <?php if ($category['children']) { ?>
                <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
                  <div class="dropdown-menu">
                    <div class="dropdown-inner">
                      
                      <ul class="list-unstyled">
                      <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                        <?php foreach ($children as $child) { ?>
                        <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                        <?php } ?>
                      <?php } ?>
                      </ul>
                      
                    </div>
                    <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
                </li>
                <?php } else { ?>
                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                <?php } ?>
                <?php } ?>
              </ul>
            </div>
          </nav>
      <?php } ?>
      </div>
    </div>
  </div>
  <nav id="menu-mobile">
	<div class="container">
    	<div class="navbar-header"><span id="category"><?php echo $text_category_mobile; ?></span>
          <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
        </div>
     </div>
     <div class="collapse navbar-collapse navbar-ex1-collapse">
     	<div class="container">
          <ul class="nav navbar-nav main-menu">
            <?php foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
            <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
              <div class="dropdown-menu">
                <div class="dropdown-inner">
                  
                  <ul class="list-unstyled">
                  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                    <?php foreach ($children as $child) { ?>
                    <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                    <?php } ?>
                  <?php } ?>
                  </ul>
                  
                </div>
                <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
            </li>
            <?php } else { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
        </div>
          <ul class="nav navbar-nav account-menu">
              <li><a href="index.php?route=account/login"><?php echo $text_account_radiance; ?></a></li>
          </ul>
	</div>
  </nav>
</header>