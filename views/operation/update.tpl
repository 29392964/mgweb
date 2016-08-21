<form method="post" action="/update" class="form-horizontal">
    <fieldset>
    <legend>Update</legend>
    <div class="form-group">
      <label for="c" class="col-lg-2 control-label">Collection</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" id="c" name="c" value="{{.c}}" placeholder="collectionname">
      </div>
    </div>
    <div class="form-group">
      <label for="filter" class="col-lg-2 control-label">Filter</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="3" id="filter" name="filter" placeholder='{"a":"1","b":"2"}'></textarea>
      </div>
    </div>
    <div class="form-group">
      <label for="json" class="col-lg-2 control-label">Json</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="3" id="json" name="json" placeholder='{"$set":{"a":"1","b":"2"}}'></textarea>
      </div>
    </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Update</button>
      </div>
    </div>
    </fieldset>
</form>
