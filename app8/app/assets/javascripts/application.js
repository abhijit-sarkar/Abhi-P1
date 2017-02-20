
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

    
    $('.ind').click(function(){			
	localStorage.setItem("plan_detail_call","index");
    });
    
    $('.cust').click(function(){	
	localStorage.setItem("plan_detail_call","cust");
    });
    
    $('.plan').click(function(){	
	localStorage.setItem("plan_detail_call","plan");
    });
    
    if (localStorage.getItem("plan_detail_call") == "index")
    {
	$('.back_cust').hide();
	$('.back_plan').hide();
    }
    
    if (localStorage.getItem("plan_detail_call") == "cust")
    {
	$('.back_ind').hide();
	$('.back_plan').hide();
    }
    
    if (localStorage.getItem("plan_detail_call") == "plan")
    {
	$('.back_ind').hide();
	$('.back_cust').hide();
    }
    
    $('.pol_doc').click(function(){			
	localStorage.setItem("doc_call","detail");
    });

    $('.doc_list').click(function(){			
	localStorage.setItem("doc_call","doc_list");		
    });
    
    if (localStorage.getItem("doc_call") == "detail")
    {
	$('.doc').hide();	
    }
    
    if (localStorage.getItem("doc_call") == "doc_list")
    {
	$('.det').hide();		
    }
    
    $('.add1').click(function(){		   	
	localStorage.setItem("add_doc", "1");
    });
    
    $('.add2').click(function(){	
	localStorage.setItem("add_doc", "2");
    });
    
    if(localStorage.getItem("add_doc") == "1")
    {
	$('.view2').hide();
    }
    
    if(localStorage.getItem("add_doc") == "2")
    {
	$('.view1').hide();
    }
    
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

});
