<?php



class Courses extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Kursus');
	}

    public function index($id = null)
    {

		try {
			$data = $this->Kursus->get_all();
			$response = array(
				'status' => 'success',
				'message' => 'Fetched all data',
				'data' => $data
			);
		}catch (Exception $e) {
			$response = array(
				'status' => 'error',
				'message' => $e->getMessage()
			);
		}

		$this->output
			->set_content_type('application/json')
			->set_output(json_encode($response));
    }

	public function get($id = null){
		$status_code = null;
		try {
			if(empty($id)){
				$status_code = 400;
				throw new Exception('Slug is required');
			}
			$data = $this->Kursus->get($id);
			if(empty($data)){
				$status_code = 404;
				throw new Exception('Data not found');
			}
			$response = array(
				'status' => 'success',
				'message' => 'Fetched data',
				'data' => $data
			);
			$status_code = 200;
		}catch (Exception $e) {
			$response = array(
				'status' => 'error',
				'message' => $e->getMessage()
			);
			if($status_code == null) $status_code = 500;
		}

		$this->output
			->set_content_type('application/json')
			->set_status_header($status_code)
			->set_output(json_encode($response));
	}

	public function create(){
		$status_code = null;
		try {
			$data = $this->input->post();
			if(empty($data)){
				$status_code = 400;
				throw new Exception('Data is required');
			}
			$id = $this->Kursus->create($data);
			$response = array(
				'status' => 'success',
				'message' => 'Data created',
				'data' => $this->Kursus->get($id)
			);
			$status_code = 201;
		}catch (Exception $e) {
			$response = array(
				'status' => 'error',
				'message' => $e->getMessage()
			);
			if($status_code == null) $status_code = 500;
		}

		$this->output
			->set_content_type('application/json')
			->set_status_header($status_code)
			->set_output(json_encode($response));
	}

	public function update($id = null){
		$status_code = null;
		try {
			if(empty($id)){
				$status_code = 400;
				throw new Exception('Slug is required');
			}
			$data = $this->input->post();
			if(empty($data)){
				$status_code = 400;
				throw new Exception('Data is required');
			}
			$this->Kursus->update($id, $data);
			$response = array(
				'status' => 'success',
				'message' => 'Data updated',
				'data' => $this->Kursus->get($id)
			);
			$status_code = 200;
		}catch (Exception $e) {
			$response = array(
				'status' => 'error',
				'message' => $e->getMessage()
			);
			if($status_code == null) $status_code = 500;
		}

		$this->output
			->set_content_type('application/json')
			->set_status_header($status_code)
			->set_output(json_encode($response));
	}

	public function delete($id = null){
		$status_code = null;
		try {
			if(empty($id)){
				$status_code = 400;
				throw new Exception('Slug is required');
			}
			$this->Kursus->delete($id);
			$response = array(
				'status' => 'success',
				'message' => 'Data deleted',
				'data' => null
			);
			$status_code = 200;
		}catch (Exception $e) {
			$response = array(
				'status' => 'error',
				'message' => $e->getMessage()
			);
			if($status_code == null) $status_code = 500;
		}

		$this->output
			->set_content_type('application/json')
			->set_status_header($status_code)
			->set_output(json_encode($response));
	}


}


