<div class="row">
  <input type="hidden" value="<?= $action->id ?>" name="id">
  <div class="col-md-12">
    <div class="form-group">
      <label>Devisi</label>
      <select name="devisi_id" id="" class="form-control select-group" style="width: 100%">
        <option value selected disabled>-- Pilih --</option>
        <?php foreach ($devisi as $key => $val) : ?>
          <option value="<?php echo $val->id ?>" <?php if ($action->devisi_id == $val->id) echo "selected" ?>><?php echo $val->nama_devisi ?></option>
        <?php endforeach ?>
      </select>
    </div>
  </div>
  <div class="col-md-12">
    <div class="form-group">
      <label>Action Stub</label>
      <input type="text" name="action" value="<?= $action->action ?>" autocomplete="off" class="form-control">
    </div>
  </div>
  <div class="col-md-12">
    <div class="form-group">
      <label>Aktif</label>
      <select name="status" id="status" class="form-control">
        <?php if ($action->status == 1) : ?>
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