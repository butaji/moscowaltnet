$(function(){
	$("#searchbox")
	.keypress(function(e) {
		if(e.which == 13 & $(this).val() != '') {
			googleSearch($(this).val());
		}
	});

});


function googleSearch(term){
	
	var text = term;
	term += " site:mosalt.net";

	var resultsUl = $("#searchresults");

	var apiURL = 'http://ajax.googleapis.com/ajax/services/search/web?v=1.0&callback=?';

	$.getJSON(apiURL,{
		q	: term,
		rsz	: 8,
		start	: 0
	},function(r){

		var results = r.responseData.results;
		resultsUl.empty().show();

		if(results.length){
			for (var i=0; i < results.length; i++) {
				var r = results[i];
				var li = '<li><h5><a href="' + r.url + '">' + r.title + '</a></h5><p>' + r.content + '</p><a href="' + r.url + '">' + 'http://' + r.visibleUrl + '</a></li>';
				resultsUl.append(li);
			};
		}
		else {
			resultsUl.append("<li><h2>Ничего не найдено.</h2><p>Вы искали <strong>'" + text  + "</strong>'. Попробуйте уточнить параметры поиска</p></li>");
		}
	});
}