{{template "layout/base.tpl" .}}
{{define "layout/table.tpl"}}
请点击Collection菜单选择要查看的数据
{{end}}
{{define "layout/js.tpl"}}
var ss="";
var page=0;
var db="prm";
var c="";
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
    $.ajax({
      type: "POST",
      url: "/?db="+db+"&c="+c+"&page="+page,
      data:ss,
      cache: false,
      success: function(html){
        $("#table").html(html);
        $("#pager").pager({ pagenumber: page, pagecount: pCount, buttonClickCallback: $(this).PageClick });
      }
    })
  }
});
$(document).ready(function(){
  $(this).PageClick(3);
  $(".dropdown-menu").delegate(".sdb","click",function(){
    db=$(this).text();
    $(this).PageClick(1);
  });
  $(".dropdown-menu").delegate(".sc","click",function(){
    c=$(this).text();
    $(this).PageClick(1);
  });
});
{{end}}
