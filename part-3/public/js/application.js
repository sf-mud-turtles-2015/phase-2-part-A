$(document).ready(function() {
  $('.bid').submit(function(e) {
    e.preventDefault();
    var user_id = $('form').attr("id")
    var item_id = $('h2').attr("class")
    var data = $(this).serialize();
    alert("Thank you for your bid. Good luck!");
    $.ajax({
      // user id, item id
      url: "/users/" + user_id + "/items/" + item_id + "/bid",
      method: 'post',
      data: data
    })
    .done(function(response) {
      console.log(response)
      var bid = JSON.parse(response)
      $('ul').parent().append('<ul class="bid">' + bid.bidder + ', ' + bid.amount + '</ul>');
    })
  });
});
