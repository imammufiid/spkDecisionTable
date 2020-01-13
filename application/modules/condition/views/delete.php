<div class="row">
  <div class="col-md-12">
    <input type="hidden" name="id" value="<?= $del_condition->id ?>">
    <p>Anda yakin menghapus data : </p>
    <table border="0">
      <tr>
        <th>Devisi</th>
        <td>:</td>
        <td><?= $del_condition->nama_devisi ?></td>
      </tr>
      <tr>
        <th>Condition</th>
        <td>:</td>
        <td><?= $del_condition->condition ?></td>
      </tr>
    </table>
  </div>
</div>