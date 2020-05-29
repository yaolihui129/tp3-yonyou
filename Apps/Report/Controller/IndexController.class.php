<?php
namespace Report\Controller;
class IndexController extends WebInfoController {
    public function index(){
		$status=array('closed');
		//只看这些人员
		$map['status']=array('not in',$status);
		$map['deleted']='0';
        $data=M('project')->where($map)
            ->field("id,name,code,begin,end,status,deleted,order,deleted")
            ->order("end desc")->limit(20)->select();
        $this->assign('data',$data);

        $this->display();
    }

}