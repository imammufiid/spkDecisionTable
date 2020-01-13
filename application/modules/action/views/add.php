<div class="row">
    <input type="hidden" name="id">
    <div class="col-md-12">
        <div class="form-group">
            <label>Devisi</label>
            <select name="devisi_id" id="devisi_id" class="form-control">
                <option value selected disabled>-- Pilih Devisi --</option>
                <?php foreach($devisi as $key => $val): ?>
                    <option value="<?= $val->id ?>"><?= $val->nama_devisi ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <div class="col-md-12">
        <div class="form-group">
            <label>Action Stub</label>
            <input type="text" name="action" autocomplete="off" class="form-control">
        </div>
    </div>
    <div class="col-md-12">
        <div class="form-group">
            <label>Aktif</label>
            <select name="status" id="status" class="form-control">
                <option value="1">Aktif</option>
                <option value="0">Non-Aktif</option>
            </select>
        </div>
    </div>
    <input type="hidden" name="created_at" value="<?= date('Y-m-d H:i:s'); ?>">
</div>