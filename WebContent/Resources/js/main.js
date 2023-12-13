$(document).ready(function(){
    $('nav ul li').click(function(){
        $(this).addClass('active').siblings().removeClass('active');
    });

    /*$('.scroll').hide();*/
    $('.scroll').click(function(){
        $('html , body').animate({
            scrollTop: 0
        }),100;
    });
    
});