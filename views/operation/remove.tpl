<form method="post" action="/remove" class="form-horizontal">
    <fieldset>
    <legend>Remove</legend>
    <div class="form-group">
      <label for="c" class="col-lg-2 control-label">Collection</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" id="c" name="c" value="{{.c}}" placeholder="collectionname">
      </div>
    </div>
    <div class="form-group">
      <label for="json" class="col-lg-2 control-label">Json</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="3" id="json" name="json" placeholder='{"a":"1","b":"2"}'></textarea>
      </div>
    </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Remove</button>
      </div>
    </div>
    </fieldset>
</form>
