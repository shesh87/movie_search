// $('.test').on('click', function() {
// 	alert($('.test').data('year'));
// });


$('.js-movies').on('click', function() {
  movieYear(this.id);
});

var year = $('.title').data('year');

function movieYear(id) {
	if (id == year) {
		alert("You've Won!");
	} else {
		alert("Boo! You Lost!");
	}
}

$(window).load(function() {
	$("#search-box").focus();
});
