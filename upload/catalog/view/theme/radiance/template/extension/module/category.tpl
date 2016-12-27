<h3 class="rc-heading no-margin-top"><?php echo $category_heading_title; ?></h3>
<ul class="list-unstyled rc-vertical-navigation">
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?>
  <li><a href="<?php echo $category['href']; ?>" class="list-group-item active"><?php echo $category['name']; ?></a></li>
  <?php if ($category['children']) { ?>
  <ul class="list-unstyled">
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?>
  <li><a href="<?php echo $child['href']; ?>" class="list-group-item active"><?php echo $child['name']; ?></a></li>
  <?php } else { ?>
  <li><a href="<?php echo $child['href']; ?>" class="list-group-item"><?php echo $child['name']; ?></a></li>
  <?php } ?>
  <?php } ?>
  </ul>
  <?php } ?>
  <?php } else { ?>
  <li><a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a></li>
  <?php } ?>
  <?php } ?>
</ul>