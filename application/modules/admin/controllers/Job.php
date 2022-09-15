<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Job extends Admin_Controller {

	public function index()
	{
		redirect('/post');
	}

	// Grocery CRUD -  Posts
	public function post()
	{
		$crud = $this->generate_crud('job_posts');
		$crud->columns('hiring_manager', 'category','location','skill','business-unit','status','project' ,'practice' ,'sub-practice' ,'title', 'publish_time', 'status');
		// $crud->set_field_upload('image_url', UPLOAD__POST);
		$crud->set_relation('hiring_manager', 'admin_users', '{first_name} {last_name}');
		$crud->set_relation('category', 'job_categories', 'title');
		$crud->set_relation('business-unit', 'job_bu', 'BU');
		$crud->set_relation('status', 'job_status', 'current_status');
		$crud->set_relation('project', 'job_deal_project', 'project');
		$crud->set_relation('practice', 'job_practice', 'practice');
		$crud->set_relation('sub-practice', 'job_sub_practice', 'sub_practice');
		$crud->set_relation_n_n('location', 'job_posts_location', 'job_location', 'post_id', 'location_id', 'location');
		$crud->set_relation_n_n('skill', 'job_posts_skills', 'job_role_skill', 'post_id', 'role_id', 'role');
		
		$state = $crud->getState();

		$this->mPageTitle = 'Job Posts';
		$this->render_crud();
	}

	// Grocery CRUD -  Categories
	public function category()
	{
		$crud = $this->generate_crud('job_categories');
		$crud->columns('title');
		$this->mPageTitle = ' Categories';
		$this->mViewData['crud_note'] = modules::run('adminlte/widget/btn', 'Sort Order', '/category_sortable');
		$this->render_crud();
	}
	
	// Sortable -  Categories
	public function category_sortable()
	{
		$this->load->library('sortable');
		$this->sortable->init('_category_model');
		$this->mViewData['content'] = $this->sortable->render('{title}', '/category');
		$this->mPageTitle = ' Categories';
		$this->render('general');
	}


	public function location()
	{
		$crud = $this->generate_crud('job_location');
		$this->mPageTitle = ' Location';
		$this->render_crud();
	}

	public function role()
	{
		$crud = $this->generate_crud('job_role_skill');
		$this->mPageTitle = 'Skill';
		$this->render_crud();
	}

	public function BU()
	{
		$crud = $this->generate_crud('job_bu');
		$this->mPageTitle = 'BU';
		$this->render_crud();
	}


	public function current_status()
	{
		$crud = $this->generate_crud('job_status');
		$this->mPageTitle = 'current_status';
		$this->render_crud();
	}

	public function project()
	{
		$crud = $this->generate_crud('job_deal_project');
		$this->mPageTitle = 'project';
		$this->render_crud();
	}

	public function practice()
	{
		$crud = $this->generate_crud('job_practice');
		$this->mPageTitle = 'practice';
		$this->render_crud();
	}

	public function sub_practice()
	{
		$crud = $this->generate_crud('job_sub_practice');
		$this->mPageTitle = 'sub_practice';
		$this->render_crud();
	}
}
