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
		$crud->columns('hiring_manager', 'practice_manager','source','category','location','skill','business-unit','status','project' ,'practice' ,'sub-practice' ,'title', 'publish_time', 'status');
		// $crud->set_field_upload('image_url', UPLOAD__POST);
		$crud->set_relation('hiring_manager', 'job_hiring_managers', '{manager} {email}');
		$crud->set_relation('practice_manager', 'job_practice_managers', '{manager} {email}');
		$crud->set_relation('category', 'job_categories', 'title');
		$crud->set_relation('business-unit', 'job_business_units', 'BU');
		$crud->set_relation('status', 'job_status', 'current_status');
		$crud->set_relation('project', 'job_deal_projects', 'project');
		$crud->set_relation('practice', 'job_practices', 'practice');
		$crud->set_relation('sub-practice', 'job_sub_practices', 'sub_practice');
		$crud->set_relation_n_n('location', 'job_posts_locations', 'job_locations', 'post_id', 'location_id', 'location');
		$crud->set_relation_n_n('skill', 'job_posts_skills', 'job_role_skills', 'post_id', 'role_id', 'role');
		$crud->set_relation_n_n('source', 'job_posts_sources', 'job_sources', 'post_id', 'source_id', 'source');
		
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


	public function locations()
	{
		$crud = $this->generate_crud('job_locations');
		$this->mPageTitle = ' Locations';
		$this->render_crud();
	}

	public function roles()
	{
		$crud = $this->generate_crud('job_role_skills');
		$this->mPageTitle = 'Skills';
		$this->render_crud();
	}

	public function business_units()
	{
		$crud = $this->generate_crud('job_business_units');
		$this->mPageTitle = 'Business Units';
		$this->render_crud();
	}


	public function current_status()
	{
		$crud = $this->generate_crud('job_status');
		$this->mPageTitle = 'Job Status';
		$this->render_crud();
	}

	public function projects()
	{
		$crud = $this->generate_crud('job_deal_projects');
		$this->mPageTitle = 'Deals/Projects';
		$this->render_crud();
	}

	public function practices()
	{
		$crud = $this->generate_crud('job_practices');
		$this->mPageTitle = 'Practices';
		$this->render_crud();
	}

	public function sub_practices()
	{
		$crud = $this->generate_crud('job_sub_practices');
		$this->mPageTitle = 'Sub Practices';
		$this->render_crud();
	}

	public function sources()
	{
		$crud = $this->generate_crud('job_sources');
		$this->mPageTitle = 'Sources';
		$this->render_crud();
	}
}
