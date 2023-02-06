<?php

class Home extends CI_Controller
{
	

	

	public function index()
	{
        $x['header'] = $this->load->view('frontend/header', '', TRUE);
        $x['footer'] = $this->load->view('frontend/footer', '', TRUE);
		$this->load->view('frontend/view_home',$x);
	}

}

?>
