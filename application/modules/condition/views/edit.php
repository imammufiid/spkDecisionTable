<div class="row">
  <input type="hidden" value="<?= $condition->id ?>" name="id">
  <div class="col-md-12">
    <div class="form-group">
      <label>Condition Stub</label>
      <input type="text" name="condition" value="<?= $condition->condition ?>" autocomplete="off" class="form-control">
    </div>
  </div>
  <div class="col-md-12">
    <div class="form-group">
      <label>Aktif</label>
      <select name="status" id="status" class="form-control">
        <?php if ($condition->status == 1) : ?>
          <option value="1" selected>Aktif</option>
          <option value="0">Non-Aktif</option>
        <?php else : ?>
          <option value="1">Aktif</option>
          <option value="0" selected>Non-Aktif</option>
        <?php endif; ?>
      </select>
    </div>
  </div>
</div>