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
		$crud->columns('hiring_manager_id', 'category_id', 'title', 'tags', 'publish_time', 'status');
		// $crud->set_field_upload('image_url', UPLOAD__POST);
		$crud->set_relation('category_id', 'job_categories', 'title');
		$crud->set_relation_n_n('tags', 'job_posts_tags', 'job_tags', 'post_id', 'tag_id', 'title');
		
		$state = $crud->getState();
		if ($state==='add')
		{
			$crud->field_type('hiring_manager_id', 'hidden', $this->mUser->id);
			$this->unset_crud_fields('status');
		}
		else
		{
			$crud->set_relation('hiring_manager_id', 'admin_users', '{first_name} {last_name}');
		}

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

	// Grocery CRUD -  Tags
	public function tag()
	{
		$crud = $this->generate_crud('job_tags');
		$this->mPageTitle = ' Tags';
		$this->render_crud();
	}
}
