$(document).ready(function(){
    $(".changeStatus").click(function(){
        var ajaxUrl = $(this).attr("aurl");
        //      alert(this.attributes["aurl"].nodeValue);
        var type = alert(this.text);
        alert(this);
        $.get(ajaxUrl, {
            Action:"get"
        }, function (data){
           if (data.ret) {
               alert("操作成功");
               if (type="隐藏") {
                   $(this).html("显示");
               } else {
                   $(this).html("隐藏");
               }
           } else {
               alert(data.errmsg);
           }
            
        });
      
    });
});