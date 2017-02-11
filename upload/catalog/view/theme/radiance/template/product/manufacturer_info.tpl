<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php if($products) { ?>
      <div class="rc-headline-section category-sort-filters margin-bottom-thirty">
        <div class="left-section"><h2 class="rc-heading no-margin-top category-page"><?php echo $heading_title; ?></h2></div>
      	<div class="right-section">
          <div class="form-group input-group first-filter">
            <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
            <select id="input-sort" class="form-control" onchange="location = this.value;">
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
          <div class="form-group input-group second-filter">
            <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
            <select id="input-limit" class="form-control" onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
              <?php if ($limits['value'] == $limit) { ?>
              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
      </div>
      <?php if (!empty($supplier)) { ?>
        <h3><?php echo $supplier_text['info_title']; ?></h3>
        <div class="panel panel-default">
          <div class="panel-body">
            <div class="row">
              <?php if (!empty($supplier['website'])) { ?>
                <div class="col-sm-3"><strong><?php echo $supplier_text['website_title']; ?></strong><br>
                  <a href="http://<?php echo $supplier['website']; ?>" target="_blank"><?php echo $supplier['website']; ?></a><br />
                  <br />
                </div>
              <?php } ?>

              <?php if (!empty($supplier['telephone'])) { ?>
                <div class="col-sm-3"><strong><?php echo $supplier_text['telephone_title']; ?></strong><br>
                  <?php echo $supplier['telephone']; ?><br />
                  <br />
                </div>
              <?php } ?>

              <?php if (!empty($supplier['email'])) { ?>
                <div class="col-sm-3"><strong><?php echo $supplier_text['email_title']; ?></strong><br>
                  <a href="mailto:<?php echo $supplier['email']; ?>"><?php echo $supplier['email']; ?></a><br />
                  <br />
                </div>
              <?php } ?>
            </div>
          </div>
        </div>
      <?php } ?>
      <?php } else { ?>
      	<h2 class="rc-heading no-margin-top"><?php echo $heading_title; ?></h2>
      <?php } ?>
      <?php if ($products) { ?>
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-xs-12 col-sm-6 col-md-3">
            <div class="product-thumb transition">
              <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
                <?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
            </div>
            </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>