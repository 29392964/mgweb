<form method="post" action="/drop" class="form-horizontal">
    <fieldset>
    <legend>Drop</legend>
    <div class="form-group">
      <label for="c" class="col-lg-2 control-label">Collection</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" id="c" name="c" value="{{.c}}" placeholder="collectionname">
      </div>
    </div>
    <div class="form-group">
      <div class="confirm col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Drop</button>
      </div>
    </div>
    </fieldset>
</form>
