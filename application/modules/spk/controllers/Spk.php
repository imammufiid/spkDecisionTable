<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Spk extends CI_Controller
{

	private $guru_id;

	public function __construct()
	{
		parent::__construct();
		$this->sys->check_is_login();
		$this->load->library('datatables', null, 'dt');
		$this->load->model('m_datamaster', 'dm');
		$this->load->model('m_spk', 'm');
		$this->load->model('m_crud', 'crud');
	}

	public function index()
	{
		$devisi_id = $this->input->get('id');
		$data['devisi'] = $this->input->get('devisi');
		$this->sys->add_javascript_top_custom('assets/plugins/datatables/datatables.min.js');
		$this->sys->add_css_custom('assets/plugins/datatables/datatables.min.css');
		$this->db->select('condition');
		$this->db->select('value');
		$this->db->from('condition');
		$this->db->where('devisi_id', $devisi_id);
		$data['cond'] = $this->db->get()->result();
		
		$this->db->select('action');
		$this->db->select('value');
		$this->db->from('action');
		$this->db->where('devisi_id', $devisi_id);
		$data['act'] = $this->db->get()->result();
		$this->sys->render_metronic('index', $data);
	}

	public function fetch()
	{
		print_r($this->dt->generate_json('devisi'));
	}

	public function save()
	{
		$response = $this->m->save();
		if ($response) {
			echo json_encode(array('status' => true, 'msg' => 'berhasil disimpan!'));
		} else {
			echo json_encode(array('status' => false, 'msg' => 'gagal menyimpan!'));
		}
	}

	public function delete(){
		$this->crud->set_table('devisi');
		$this->crud->where('id');
		echo $this->crud->crud('delete');
	}

	public function modal($view)
	{
		$data['dvs'] = $this->db->where('id', @$_GET['id'])->get('devisi')->row();
		$this->sys->render_metronic_modal($view, $data);
	}

}

/* End of file Guru.php */
/* Location: ./application/modules/guru/controllers/Guru.php */
