<?php
defined('BASEPATH') or exit('No direct script access allowed');

class M_webdev extends CI_Model
{

	function save()
	{
		$this->db->set($_POST);
		if (!empty(@$_POST['id'])) {
			$this->db->where('id', @$_POST['id']);
			$this->db->update('devisi');
		} else {
			$this->db->insert('devisi');
		}

		return $this->db->affected_rows();
	}

}

/* End of file M_guru.php */
/* Location: ./application/modules/guru/models/M_guru.php */
