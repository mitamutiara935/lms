<?php



class Courses extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Kursus');
	}

    public function index()
    {

		$data = $this->Kursus->get_all();
		$this->output
			->set_content_type('application/json')
			->set_output(json_encode($data));
    }

}


