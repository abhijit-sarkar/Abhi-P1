// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load',function(){

    $('.divp').hide();
    $('.butv').click(function(){
	$('.divp').fadeIn(2000);
    });


    $('.table4').hide();
    $('.butp').click(function(){
	$('.table4').fadeIn(2000);
    });

    $('.table1').hide();
    $('.table2').hide();
    $('.table5').hide();
    $('input').change(function(){
	var sel = $(this).val();
	if (sel == "c1")
	{
	    $('.table2').hide();
	    $('.table3').hide();
	    $('.table5').hide();
	    $('.table1').fadeIn(2000);
	}
	if (sel == "c2")
	{
	    $('.table1').hide();
	    $('.table3').hide();
	    $('.table5').hide();
	    $('.table2').fadeIn(2000);
	}
	if (sel == "c3")
	{
	    $('.table1').hide();
	    $('.table2').hide();
	    $('.table5').hide();
	    $('.table3').fadeIn(2000);
	}
	if (sel == "c5")
	{
	    $('.table1').hide();
	    $('.table2').hide();
	    $('.table3').hide();
	    $('.table5').fadeIn(2000);
	}
    });
    
    $('.num').blur(function(){
	if ($('.num').val().length != 10) 
	{
	    $("#ntext").css("color", "red");
	    $('.num').val('');
	}
	else
	{
	    $("#ntext").css("color", "black");
	}

    });




    $('.dd2').hide();
    var pattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    var email = $('.email').val().trim();
    var count = 0;
    $('.next').click(function(){
	if($.trim($('.cust').val()) == '')
	{
	    count = 1;
	}

	if($.trim($('.cont').val()) == '')
	{
	    count = 1;
	}



	if ((count == 1))
	{
	    count = 0;
	    alert("Please fill all the values properly to proceed");
	}
	else{
	    
	    $('.dd1').hide();	
	    $('.dd2').fadeIn(1000);


	}
    });
    $('.back').click(function(){
	$('.dd2').hide();	
	$('.dd1').fadeIn(1000);
    });
    $('.cc1').fadeOut(2000);
});
