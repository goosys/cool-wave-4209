// Modal
$(function() {
  $('.modal-link').on('click', function() {
    const modalTarget = $(this).data('modal-target');
    const modal = document.querySelector('.' + modalTarget);
    $(modal).toggleClass('is-show');
  });
  $('.modal-bg').on('click', function() {
    $(this).parents('.modal').toggleClass('is-show');
  });
});
