<div id="cart" class="btn-group btn-block">
  <?php if ($products || $vouchers) { ?>
  <h2 class="rc-heading"><?php echo $shopping_cart_heading; ?></h2>
  <ul class="list-unstyled">
    <li>
      <table class="table products-table">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left">
          <a href="<?php echo $product['href']; ?>" class="product-name"><?php echo $product['name']; ?>
          </a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?>
          <a href="javascript:void(0)" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="remove-product"><?php echo $button_remove; ?></a>
          </td>
          <td class="text-center">x <?php echo $product['quantity']; ?></td>
          <td class="text-right"><?php echo $product['total']; ?></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div>
        <table class="table prices-table">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <div class="pull-right hidden-xs">
        	<a href="<?php echo $cart; ?>" class="btn btn-default"><?php echo $text_cart; ?></a>
        	<a href="<?php echo $checkout; ?>" class="btn btn-primary btn-checkout"><?php echo $text_checkout; ?></a>
        </div>
        <div class="visible-xs cart-buttons">
        	<a href="<?php echo $cart; ?>" class="btn btn-default"><?php echo $text_cart; ?></a>
        	<a href="<?php echo $checkout; ?>" class="btn btn-primary btn-checkout"><?php echo $text_checkout; ?></a>
        </div>
      </div>
    </li>
  </ul>
  <?php } else { ?>
  	<h3 style="margin-top: 30px;"><?php echo $text_empty; ?></h3>
  <?php } ?>
</div>
