<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Condition extends CI_Controller
{

	private $guru_id;

	public function __construct()
	{
		parent::__construct();
		$this->sys->check_is_login();
		// $db2 = $this->load->database('db-kedua', true);
		$this->load->library('datatables', null, 'dt');
		$this->load->model('m_datamaster', 'dm');
		$this->load->model('m_condition', 'm');
		$this->load->model('m_crud', 'crud');
		// $this->load->library('form_validation');
		// $this->load->library('upload');
	}

	public function index()
	{
		$this->sys->add_javascript_top_custom('assets/plugins/datatables/datatables.min.js');
		$this->sys->add_css_custom('assets/plugins/datatables/datatables.min.css');
		$this->sys->render_metronic('index');
	}

	public function fetch()
	{
		print_r($this->dt->generate_json('v_condition'));
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

	public function delete(){
		$this->crud->set_table('condition');
		$this->crud->where('id');
		echo $this->crud->crud('delete');
	}

	public function modal($view)
	{
		$data['devisi'] = $this->db->get_where('devisi', ['status' => 1])->result();
		$data['condition'] = $this->db->where('id', @$_GET['id'])->get('condition')->row();
		$data['del_condition'] = $this->db->where('id', @$_GET['id'])->get('v_condition')->row();
		$this->sys->render_metronic_modal($view, $data);
	}

	
}

/* End of file Guru.php */
/* Location: ./application/modules/guru/controllers/Guru.php */
