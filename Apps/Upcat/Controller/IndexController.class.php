<?php
namespace Upcat\Controller;
class IndexController extends WebInfoController {
    public function index(){
        // $where=array('deleted'=>'0');
        // $data=M('project')->where($where)
        //     ->field("id,name,code,begin,end,status,pri,acl,deleted,desc,PO,PM,QD,RD,order,deleted")
        //     ->order("end desc")->limit(20)->select();
        // $this->assign('data',$data);

        $this->display();
    }
	
	public function pre(){
		
		$this->display();
	}
	
	public function master(){
		
		$this->display();
	}

   

}