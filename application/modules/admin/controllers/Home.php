<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends Admin_Controller {

	public function index()
	{
		$this->load->model('job_posts_model', 'job_posts');
		$this->load->model('job_practices_model', 'job_practices');
		$this->load->model('job_sub_practices_model', 'job_sub_practices');
		$this->load->model('job_hiring_managers_model', 'job_hiring_managers');
		$this->load->model('job_practice_managers_model', 'job_practice_managers');
		$this->mViewData['count'] = array(
			'jobs' => $this->job_posts->count_all(),
			'practices' => $this->job_practices->count_all(),
			'sub_practices' => $this->job_sub_practices->count_all(),
			'hiring_managers' => $this->job_hiring_managers->count_all(),
			'practice_managers' => $this->job_practice_managers->count_all(),
		);
		$this->render('home');
	}
}
