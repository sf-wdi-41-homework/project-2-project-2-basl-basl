
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery3


$(document).on('turbolinks:load', function() {
    $checks = $(":checkbox");
    $checks.on('change', function() {
        var string = $checks.filter(":checked").map(function(i,v){
            return this.value + ",";
        }).get().join(" ");
        firstValue = $('.searchbar').val(string);
        $('.confirm').text("Your Ingredients:   " + $('.searchbar').val())
    }).trigger('change');


    $('.add').on('click', function(e){
      e.preventDefault();
      var single_item = $('.single').val()
      var check = $('.searchbar').val(firstValue.val() + single_item + ",");
      $('.confirm').text("Your Ingredients:   " + $('.searchbar').val());

  })
});
