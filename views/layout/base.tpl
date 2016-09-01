<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>mgweb</title>

    <!-- Bootstrap -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <div class="container">
  {{template "layout/nav.tpl" .}}
  <div id="table">
  {{template "layout/table.tpl" .}}
  </div>
  <div id="pager">
  </div>
  </div>
  {{template "modal/insert.tpl" .}}
  {{template "modal/drop.tpl" .}}
  {{template "modal/update.tpl" .}}
  {{template "modal/remove.tpl" .}}
  {{template "modal/find.tpl" .}}
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/jquery.pager.js"></script>
    <script type="text/javascript">
    {{template "layout/js.tpl" .}}
    </script>
  </body>
</html>
