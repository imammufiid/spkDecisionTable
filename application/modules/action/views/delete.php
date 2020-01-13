<div class="row">
  <div class="col-md-12">
    <input type="hidden" name="id" value="<?= $del_action->id ?>">
    <p>Anda yakin menghapus data :</p>
    <table border="0">
      <tr>
        <th>Devisi</th>
        <td>:</td>
        <td><?= $del_action->nama_devisi ?></td>
      </tr>
      <tr>
        <th>Action</th>
        <td>:</td>
        <td><?= $del_action->action ?></td>
      </tr>
    </table>
  </div>
</div>