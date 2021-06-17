import $ from 'jquery';

$(document).ready(function () {
  $('.category btn').click(function () {
    const value = $(this).attr('data-filter');
    $('.product-cards').not('.' + value).hide('1000')
    $('.product-cards').filter('.'+value).show('1000')
  })
  $('.category btn').click(function () {
  $(this).addClass('active')
})
})
