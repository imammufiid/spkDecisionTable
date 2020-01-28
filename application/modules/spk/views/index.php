<!--begin:: Widgets/Download Files-->
<div class="kt-portlet kt-portlet--height-fluid">
	<div class="kt-portlet__head">
		<div class="kt-portlet__head-label">
			<h3 class="kt-portlet__head-title">
				<?php echo $devisi ?>
			</h3>
		</div>
	</div>
	<div class="kt-portlet__body">
		<form id="form">
			<div class="form-group">
				<label for="">Nama</label>
				<input type="text" class="form-control" name="nama">
			</div>
			<div class="form-group">
				<label for="">Instansi</label>
				<input type="text" class="form-control" name="instansi">
			</div>
		</form>
		<br>
		<h2>Possible solutions:</h2>
		<br>
		<ul id="ul"></ul>
	</div>
</div>
<!--end:: Widgets/Download Files-->

<script type="text/javascript">
	var questions = [<?php foreach ($cond as $val) : ?>
			<?php $bools = unserialize($val->value); ?> {
				bools: [<?php foreach ($bools as $v) {
												echo $v . ", ";
											} ?>],
				text: "<?= $val->condition ?>"
			},
		<?php endforeach; ?>
	]

	var answers = [<?php foreach ($act as $val) : ?>
			<?php $boolss = unserialize($val->value); ?> {
				bools: [<?php foreach ($boolss as $v) {
											echo $v . ", ";
										} ?>],
				text: "<?= $val->action ?>"
			},
		<?php endforeach; ?>
	]

	$(document).ready(function() {

		var value = questions[0].bools.length;
		console.log(value);

		for (var i = 0; i < questions.length; i++) {
			value /= 2;
			var el = '<tr><td style="padding: 5px"><input type="checkbox" name="question" value="' + value + '"></td><td><h3>' + questions[i].text + '</h3></td></tr>';
			$("#form").append(el);
		}

		// Respond to a checkbox action.
		$('input:checkbox').change(function() {

			// Figure out which combination of checkboxes the user selected.
			var sum = 0;
			$.each($('input[name="question"]:checked'), function() {
				sum += Number(this.value);
			});

			// Translate sum into an index (column #) into bools.
			var index = questions[0].bools.length - sum - 1;

			// Clear the answers.
			$('#ul').html('');

			// Add appropriate answers.
			for (var i = 0; i < answers.length; i++) {
				if (answers[i].bools[index]) {
					$('#ul').append('<li><h3>' + answers[i].text + '</h3></li>')
					// alert(answers[i].text);
				}
			}
		});
	});
</script>