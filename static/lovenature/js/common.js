$(function(){
    $(".copyright li").first().before("<li class='left'></li>");
    $(".copyright li:gt(1)").before("<li>|</li>");
    
    $(".userinfo a").before("<span>|</span>");
    /* 模块展开和关闭 */
    $(".sidebar h2:lt(1)").append("<em class='module_up_down'><img src='http://erp.nzonly.com/wp-content/themes/erp/images/down.png' alt='' /></em>");
    $(".module_up_down").toggle(function(){
        $(this).parent().next().slideToggle(600,function(){
            $("img",$(this)).attr("src","http://erp.nzonly.com/wp-content/themes/erp/images/up.png");
        });
     },function(){
        $(this).parent().next().slideToggle(600,function(){
            $("img",$(this)).attr("src","http://erp.nzonly.com/wp-content/themes/erp/images/down.png");
        });
    });
    $(".wrapper .table tbody tr").addClass("odd");
    $(".wrapper .table tbody tr:even").addClass("even");
    $('.jqtransform').jqTransform();
});