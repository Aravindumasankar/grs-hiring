<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Hiring extends Admin_Controller {

	public function index()
	{
		redirect('/managers');
	}

	// Grocery CRUD -  Posts
	public function managers()
	{
		$crud = $this->generate_crud('job_hiring_managers');

		$this->mPageTitle = 'Hiring Managers';
		$this->render_crud();
	}

	public function practice_managers()
	{
		$crud = $this->generate_crud('job_practice_managers');

		$this->mPageTitle = 'Practice Managers';
		$this->render_crud();
	}

	
}
