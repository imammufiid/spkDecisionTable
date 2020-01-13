<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Entrywd extends CI_Controller
{

	private $guru_id;

	public function __construct()
	{
		parent::__construct();
		$this->sys->check_is_login();
		// $db2 = $this->load->database('db-kedua', true);
		$this->load->library('datatables', null, 'dt');
		$this->load->model('m_datamaster', 'dm');
		$this->load->model('m_entrywd', 'm');
		$this->load->model('m_crud', 'crud');
		// $this->load->library('form_validation');
		// $this->load->library('upload');
	}

	public function index()
	{
		$this->sys->add_javascript_top_custom('assets/plugins/datatables/datatables.min.js');
		$this->sys->add_css_custom('assets/plugins/datatables/datatables.min.css');
		$data['condition'] = $this->db->get_where('condition', ['status' => 1, 'devisi_id' => 1])->result();
		$data['action'] = $this->db->get_where('action', ['status' => 1, 'devisi_id' => 1])->result();
		$data['count_action'] = $this->db->get_where('action', ['status' => 1, 'devisi_id' => 1])->num_rows();
		$this->sys->render_metronic('index', $data);
	}

	public function fetch()
	{
		print_r($this->dt->generate_json('condition'));
	}

	public function save()
	{
		// print_r($_FILES);die();
		$response = $this->m->save();
		if ($response) {
			echo json_encode(array('status' => true, 'msg' => 'berhasil disimpan!'));
		} else {
			echo json_encode(array('status' => false, 'msg' => 'gagal menyimpan!'));
		}
	}

	public function delete()
	{
		$this->crud->set_table('condition');
		$this->crud->where('id');
		echo $this->crud->crud('delete');
	}

	public function modal($view)
	{
		$data['condition'] = $this->db->where('id', @$_GET['id'])->get('condition')->row();
		$this->sys->render_metronic_modal($view, $data);
	}

	public function submit()
	{
		$condition = $this->db->get_where('condition', ['status' => 1])->result();
		foreach($condition as $val) {
			$cond[$val->id] = serialize($this->input->post('cond')[$val->id]);
			$this->db->set('value', $cond[$val->id]);
			$this->db->where('id', $val->id);
			$this->db->where('devisi_id', 1);
			$this->db->update('condition');
		}

		$action = $this->db->get_where('action', ['status' => 1])->result();
		foreach($action as $val) {
			$act[$val->id] = serialize($this->input->post('act')[$val->id]);
			$this->db->set('value', $act[$val->id]);
			$this->db->where('id', $val->id);
			$this->db->where('devisi_id', 1);
			$this->db->update('action');
		}

		foreach($action as $val){
			var_dump(unserialize($val->value)) . "<br>";
		}
	}
}

/* End of file Guru.php */
/* Location: ./application/modules/guru/controllers/Guru.php */
