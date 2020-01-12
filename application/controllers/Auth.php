<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('m_auth', 'm');
	}

	public function login() {
		$this->check_is_login();
		$this->load->view('auth/login');
	}
	public function registrasi() {
		$this->load->view('auth/registrasi');
	}

	public function register(){
		$username = $this->input->post('user_username');
		$email    = $this->input->post('user_email');
		$password    = $this->input->post('password');

		$data = [
			'user_username' => $username,
			'user_email' => $email,
			'user_password'   => md5($password),
			'user_group_id' => 3,
			'user_status_id' => 1
		];
		$register = $this->db->insert('_sys_user', $data);
		if($register){
			print_r(json_encode(array('status' => true, 'msg' => 'berhasil registrasi!')));
		} else {
			print_r(json_encode(array('status' => true, 'msg' => 'gagal registrasi!')));
		}
	}

	private function check_is_login() {
		$is_logged_in = $this->session->userdata('is_logged_in');
		if ($is_logged_in) {
			redirect('dashboard','refresh');
		}
	}

	public function check_login() {
		$is_logged_in = $this->m->check_login($_POST);
		if ($is_logged_in->num_rows() > 0) {
			$this->m->set_userdata($is_logged_in->row());
			print_r(json_encode(array('status' => true, 'msg' => 'berhasil login!')));
		} else {
			print_r(json_encode(array('status' => false, 'msg' => 'login gagal!')));
		}
	}

	public function logout() {
		$this->session->sess_destroy();
		redirect('auth/login','refresh');
	}

}

/* End of file Auth.php */
/* Location: ./application/controllers/Auth.php */