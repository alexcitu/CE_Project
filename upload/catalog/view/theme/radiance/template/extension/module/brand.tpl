<h3 class="rc-heading margin-top-forty"><?php echo $heading_title; ?></h3>
<ul class="list-unstyled rc-vertical-navigation">
  <?php foreach ($manufacturers as $manufacturer) { ?>
  	<li><a href="<?php echo $manufacturer['href']; ?>" class="list-group-item"><?php echo $manufacturer['name']; ?></a></li>
  <?php } ?>
</ul>