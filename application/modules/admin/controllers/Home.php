<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends Admin_Controller {

	public function index()
	{
		$data = array();
		$this->load->model('job_posts_model', 'job_posts');
		$this->load->model('job_practices_model', 'job_practices');
		$this->load->model('job_sub_practices_model', 'job_sub_practices');
		$this->load->model('job_hiring_managers_model', 'job_hiring_managers');
		$this->load->model('job_practice_managers_model', 'job_practice_managers');
		$data['job_trend'] = $this->job_posts->getJobTrend();
		$data['job_open_trend'] = $this->job_posts->getOpenJobTrend();
		$data['job_closed_trend'] = $this->job_posts->getClosedJobTrend();
		$this->mViewData['content'] = $data;
		$this->mViewData['count'] = array(
			'jobs' => $this->job_posts->count_all(),
			'active_jobs' => $this->job_posts->getActiveJobStatusCount(),
			'closed_jobs' => $this->job_posts->getClosedJobStatusCount(),
			'on_hold_jobs' => $this->job_posts->getOnHoldJobStatusCount(),
			'last_30_day_jobs'=> $this->job_posts->last30DaysOpenJobs(),
			'last_60_day_jobs'=> $this->job_posts->last60DaysOpenJobs(),
			'last_90_day_jobs'=> $this->job_posts->last90DaysOpenJobs(),
			'practices' => $this->job_practices->count_all(),
			'sub_practices' => $this->job_sub_practices->count_all(),
			'hiring_managers' => $this->job_hiring_managers->count_all(),
			'practice_managers' => $this->job_practice_managers->count_all(),
		);
		$this->render('home');
	}
}
