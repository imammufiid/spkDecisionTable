<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Entry extends CI_Controller
{


	public function __construct()
	{
		parent::__construct();
		$this->sys->check_is_login();
		$this->load->library('datatables', null, 'dt');
		$this->load->model('m_datamaster', 'dm');
		$this->load->model('m_entry', 'm');
		$this->load->model('m_crud', 'crud');
	}

	public function index()
	{
		$devisi_id = $this->input->get('id');
		$data['nama_devisi'] = $this->input->get('devisi');
		$this->sys->add_javascript_top_custom('assets/plugins/datatables/datatables.min.js');
		$this->sys->add_css_custom('assets/plugins/datatables/datatables.min.css');
		$data['condition'] = $this->db->get_where('condition', ['status' => 1, 'devisi_id' => $devisi_id])->result();
		$data['action'] = $this->db->get_where('action', ['status' => 1, 'devisi_id' => $devisi_id])->result();
		$data['count_action'] = $this->db->get_where('action', ['status' => 1, 'devisi_id' => $devisi_id])->num_rows();
		$data['condition_stub'] = $this->db->get_where('condition', ['status' => 1, 'devisi_id' => $devisi_id])->num_rows();
		$data['devisi'] = $devisi_id;
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
		// var_dump($this->input->post('devisi_id'));die();
		$devisi_id = $this->input->post('devisi_id');
		$condition = $this->db->get_where('condition', ['status' => 1, 'devisi_id' => $devisi_id])->result();
		foreach($condition as $val) {
			$cond[$val->id] = serialize($this->input->post('cond', false)[$val->id]);
			// var_dump($cond);die();
			$this->db->set('value', $cond[$val->id]);
			$this->db->where('id', $val->id);
			$this->db->where('devisi_id', $devisi_id);
			$this->db->update('condition');
		}

		$action = $this->db->get_where('action', ['status' => 1, 'devisi_id' => $devisi_id])->result();
		foreach($action as $val) {
			$act[$val->id] = serialize($this->input->post('act', false)[$val->id]);
			$this->db->set('value', $act[$val->id]);
			$this->db->where('id', $val->id);
			$this->db->where('devisi_id', $devisi_id);
			$this->db->update('action');
		}

	}
}

/* End of file Guru.php */
/* Location: ./application/modules/guru/controllers/Guru.php */
