// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  

	// if the check box master is checked the list of selectable countries is displayed 
	// if not then the list is hidden 
	// $('#master-category-check').click(function() {
	// 	var thisCheck = $(this);
	// 	if ( thischeck.is(':checked') ) {
 	//    		$('#category-country-list').toggle();
 	//  		}
 	//  		else {
 	//  			$('#category-country-list').;
 	//  		}	
	// });





	// Script to display the list of selectable master categories 
	$('.masters-select').chosen({
    no_results_text: "No match found.",
    search_contains:true, // Setting this option to true allows matches starting from anywhere within a word
    single_backstroke_delete:false,
    width: "100%"
  	});

});




