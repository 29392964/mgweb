{{template "layout/base.tpl" .}}
{{define "layout/table.tpl"}}
请点击Collection菜单选择要查看的数据
{{end}}
{{define "layout/js.tpl"}}
var ss="";
var page=0;
var db="prm";
var c="";
var filter="{}";
var pCount=10;
jQuery.fn.extend({
  doAjax: function() {
    if($(this).attr("href").indexOf("delete")>0)
    {
      if(!confirm("Are you sure?"))return false;
    }
    $.ajax({
      url: $(this).attr("href"),
      cache: false,
      success: function(html){
        PageClick(page);
      }
    });
  },
  PageClick:function(pageclickednumber){
    page = pageclickednumber;
    if(db =="" || c=="")return;
    $("#table").html("<div class='text-center'><img src='/static/img/wait.gif'/></div>");
    $("#pager").html("");
    $.ajax({
      type: "POST",
      url: "/?db="+db+"&c="+c+"&page="+page+"&filter="+filter,
      data:ss,
      cache: false,
      success: function(html){
        if(html.substr(0,2) == "<!"){
            location.reload();
        }else{
            $("#table").html(html);
            $("#pager").pager({ pagenumber: page, pagecount: pCount, buttonClickCallback: $(this).PageClick });
        }
      }
    })
  },
  OpenInPage:function(url){
    $("#table").html("<div class='text-center'><img src='/static/img/wait.gif'/></div>");
    $("#pager").html("");
    $.ajax({
      type: "GET",
      url: url,
      cache: false,
      success: function(html){
        $("#table").html(html);
        //$("#pager").pager({ pagenumber: page, pagecount: pCount, buttonClickCallback: $(this).PageClick });
      }
    })
  }
});
$(document).ready(function(){
  reload = false;
  $(this).PageClick(1);
  $(".dropdown-menu").delegate(".sdb","click",function(){
    db=$(this).text();
    $(this).PageClick(1);
  });
  $(".dropdown-menu").delegate(".sc","click",function(){
    c=$(this).text();
    filter="{}";
    $(this).PageClick(1);
  });
  $("li").undelegate(); 
  $("li").delegate(".op","click",function(){
    url=$(this).attr("url");
    $(this).OpenInPage(url);
  });
  //窗口事件
  $("#table").delegate("a[data-target='#modalinsert']","click",function(){
    $("#modalinsert").find("#c").val($(this).attr("data-c"));
  })
  $("#table").delegate("a[data-target='#modaldrop']","click",function(){
    $("#modaldrop").find("#c").val($(this).attr("data-c"));
  })
  $("#table").delegate("a[data-target='#modalupdate']","click",function(){
    $("#modalupdate").find("#c").val($(this).attr("data-c"));
    $("#modalupdate").find("#filter").val("{\"_id\":\""+$(this).attr("data-id")+"\"}");
    $("#modalupdate").find("#json").val("{\"$set\":{\"\":\"\"}}");
  })
  $("#table").delegate("a[data-target='#modalremove']","click",function(){
    $("#modalremove").find("#c").val($(this).attr("data-c"));
    $("#modalremove").find("#filter").val("{\"_id\":\""+$(this).attr("data-id")+"\"}");
  })
  $("#table").delegate("a[data-target='#modalfind']","click",function(){
    $("#modalfind").find("#c").val($(this).attr("data-c"));
  })
  $("#newc").click(function(){
    reload = true;
    $("#modalinsert").find("#c").val("");
  })
  //操作按钮事件,通过ajax提交 
  $(".modal-footer").delegate("#btninsert","click",function(){
    c=$(this).parent().parent().find("#c").val()
    j=$(this).parent().parent().find("#json").val()
    $.post("/insert",{c:c,json:j},function(result){
      $('.modal').modal('hide');
      $(this).PageClick(1);
      if(reload){
        location.reload();
      }
    });
  })
  $(".modal-footer").delegate("#btndrop","click",function(){
    c=$(this).parent().parent().find("#c").val()
    $.post("/drop",{c:c},function(result){
      $('.modal').modal('hide');
      location.reload() 
    });
  })
  $(".modal-footer").delegate("#btnupdate","click",function(){
    c=$(this).parent().parent().find("#c").val()
    f=$(this).parent().parent().find("#filter").val()
    j=$(this).parent().parent().find("#json").val()
    $.post("/update",{c:c,filter:f,json:j},function(result){
      $('.modal').modal('hide');
      $(this).PageClick(1);
    });
  })
  $(".modal-footer").delegate("#btnremove","click",function(){
    c=$(this).parent().parent().find("#c").val()
    f=$(this).parent().parent().find("#filter").val()
    $.post("/remove",{c:c,json:f},function(result){
      $('.modal').modal('hide');
      $(this).PageClick(1);
    });
  })
  $(".modal-footer").delegate("#btnfind","click",function(){
    c=$(this).parent().parent().find("#c").val()
    filter=$(this).parent().parent().find("#filter").val()
    $('.modal').modal('hide');
    $(this).PageClick(1);    
  })

/*
  $("#table").delegate(".btn-primary","click",function(){
    return confirm("Are you sure??");
  });
*/  
});
{{end}}
