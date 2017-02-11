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
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $text_message; ?>
      <?php if (isset($isLoggedCheckout) && !$isLoggedCheckout) { ?>
        <div id="create-acc" class="buttons">
          <div class="pull-right button-spacing"><a href="<?php echo $create_account; ?>" class="btn btn-primary"><?php echo $button_create_account; ?></a></div>
        </div>
      <div id="popover-encr" style="display: block;" class="popover fade bottom in" role="tooltip">
        <div style="left: 80%;" class="arrow"></div>
        <h3 style="display: none;" class="popover-title"></h3>
        <div class="popover-content"><?php echo $text_encouragement;?></div>
      </div>
      <?php } ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

<script>
  $(document).ready(function(){
    renderPopover();

    $(window).resize(function(){
      renderPopover();
    });
  });

  var renderPopover = function()
  {
    var createAccBtn = $('#create-acc');
    var createAccBtnOffset = createAccBtn.position();
    var windowWidth = $(document).width();
    var left, top, display;

    if (windowWidth > 767 )
    {
      left = createAccBtnOffset.left + (windowWidth > 990 ? 580 : 280);
      top = createAccBtnOffset.top + 50;
      display = 'block';
    }
    else
    {
      display = 'none';
    }

    $('#popover-encr').css({
      'left': left,
      'top': top,
      'display': display
    });
  }
</script>