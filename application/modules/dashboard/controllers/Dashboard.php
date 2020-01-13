<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->sys->check_is_login();
		$this->load->library('datatables', null, 'dt');
	}

	public function index()
	{
		$this->sys->render_metronic('dashboard/index');
	}

	public function tes()
	{
		echo $this->dt->generate_json('penyakit');
	}
}

/* End of file Dashboard.php */
/* Location: ./application/controllers/administrator/Dashboard.php */
