{{template "layout/base.tpl" .}}
{{define "layout/nav.tpl"}}
{{end}}
{{define "layout/table.tpl"}}
<form method="post" class="form-horizontal">
    <fieldset>
    <legend>Mgweb</legend>
    <div class="form-group">
      <label for="inputEmail" class="col-lg-2 control-label">MongoUri</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" id="uri" name="uri" placeholder="user:passwd@127.0.0.1:27017/test">
      </div>
    </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Login</button>
      </div>
    </div>
    </fieldset>
</form>
{{end}}
{{define "layout/js.tpl"}}
$("#pager").html("");
{{end}}
