<div class="modal" id="modalinsert">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Insert</h4>
      </div>
      <div class="modal-body">
        <fieldset>
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
        </fieldset>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btninsert">Insert</button>
      </div>
    </div>
  </div>
</div>
