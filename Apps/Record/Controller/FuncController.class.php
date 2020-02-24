<?php
namespace Record\Controller;

class FuncController extends CommonController{
    public function index(){
        $m=D('module');
        $arr=$m->find(I('pathid'));
        $this->assign("arr",$arr);

        $where=array('branch'=>$arr['branch'],'deleted'=>"0");
        $data=$m->where($where)->select();
        $this->assign("data",$data);


	    $this->display();
    }




}