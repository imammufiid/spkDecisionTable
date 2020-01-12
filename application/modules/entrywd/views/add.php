<div class="row">
    <input type="hidden" name="id">
    <div class="col-md-12">
        <div class="form-group">
            <label>Condtion Stub</label>
            <input type="text" name="condition" autocomplete="off" class="form-control">
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