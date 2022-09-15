<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends Admin_Controller {

	public function index()
	{
		$this->load->model('user_model', 'users');
		$this->load->model('job_posts_model', 'job_posts');
		$this->load->model('job_practices_model', 'job_practices');
		$this->mViewData['count'] = array(
			'users' => $this->users->count_all(),
			'jobs' => $this->job_posts->count_all(),
			'practices' => $this->job_practices->count_all(),
		);
		$this->render('home');
	}
}
