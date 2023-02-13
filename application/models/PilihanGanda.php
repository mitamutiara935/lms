<?php
class PilihanGanda extends CI_Model{
	public $table = 'Choice';

	public function __construct(){
		parent::__construct();
	}

	public function get($id){
		if(empty($id)){
			throw new Exception('PilihanGanda ID is required');
		}
		$query = $this->db->get_where($this->table, array('id' => $id));
		return $query->row_array();
	}

	public function get_all($quiz_id=null){
		if(!empty($quiz_id)) {
			$query = $this->db->get_where($this->table, array('Quiz_Id' => $quiz_id));
		} else {
			$query = $this->db->get($this->table);
		}
		return $query->result_array();
	}

	public function create($data){
		if(empty($data)){
			throw new Exception('PilihanGanda data is required');
		}
		$this->db->insert($this->table, $data);
		return $this->db->insert_id();
	}

	public function update($id, $data){
		if(empty($id)){
			throw new Exception('PilihanGanda ID is required');
		}
		if(empty($data)){
			throw new Exception('PilihanGanda data is required');
		}
		$this->db->where('id', $id);
		$this->db->update($this->table, $data);
		return $this->db->affected_rows();
	}

	public function delete($id){
		if(empty($id)){
			throw new Exception('PilihanGanda ID is required');
		}
		$this->db->delete($this->table, array('id' => $id));
		return $this->db->affected_rows();
	}


}
