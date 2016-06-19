// Script to display the list of selectable master categories 
$(document).ready(function(){

  $('.items-select').chosen({
    no_results_text: "No match found.",
    search_contains:true, // Setting this option to true allows matches starting from anywhere within a word
    single_backstroke_delete:false,
    width: "100%"
  	});
  
});

	