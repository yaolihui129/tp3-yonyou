<?php
    function getState($key){// 根据id获取状态
        $where=array('type'=>'state','k'=>$key);
        $data=M('tp_dict')->where($where)->find();
        return $data['v'];
    }

    function getBuild($buildId){
        $arr=M('build')->find($buildId);
        if($arr){
            return $arr['name'];
        }else {
            return 'trunk';
        }
    }
    function getBuildVersion($branchId){
        $where=array("branch"=>$branchId);
        $arr=M('build')->where($where)->order('id desc')->select();
        if($arr){
            return $arr[0]['name'];
        }else {
            return '暂无版本';
        }
    }

    //获取字典值
    function getDictV($key,$type){
        $where=array('type'=>'state','k'=>$key);
        $data=M('tp_dict')->where($where)->find();
        return $data['v'];
    }

    //根据id获取产品名
    function getProd($id){
        $data=M('product')->find($id);
        return $data['name'];
    }


    //根据pid获取分类数
    function countCate($pidCateId){
        $where=array('pidCateId'=>$pidCateId);
        $data=M('tp_cate')->where($where)->count();
        return $data;
    }
    //获取分类名字
    function getCatname($cateid){
        if ($cateid){
            $data=M('tp_cate')->find($cateid);
            $str=getCatname($data['pidcateid'])."-".$data['catname'];
            return $str;
        }else {
            return "|-";
        }
    }

    //获取父级分类ID
    function getCatePid($cateId){
        $data=M('tp_cate')->find($cateId);
        return $data['pidcateid'];
    }
    //获取页面信息
    function getWebInfo($qz){
        $data=M('product')->where(array('qz'=>$qz))->field('id,web,adress,desc,phone,tel,qq,qz,url,record')->find();
        $_SESSION[$qz]=$data;
        $_SESSION['ip']=get_client_ip();
        $_SESSION['browser']=GetBrowser();
        $_SESSION['os']=GetOs();
//         import('Org.Net.IpLocation');// 导入IpLocation类
// //         $Ip = new IpLocation('UTFWry.dat'); // 实例化类 参数表示IP地址库文件
//         $_SESSION['area'] = $Ip->getlocation(get_client_ip()); // 获取某个IP地址所在的位置
    }

   //登录
   function login($phone,$password){
        $where=array('phone'=>$phone,['password']=>md5($password));
        $data=M('tp_credit')->where($where)->find();
        if ($data){
            $_SESSION['isCLogin']= C(PRODUCT);
            $_SESSION['realname']= $data['realname'];
            $m=M('tp_customer');
            $where=array('creditid'=>$data['creditid'],'prodid'=>C(PRODID));
            $arr=$m->where($where)->find();
            if($arr){
                $_SESSION['userid'] =   $arr['id'];
                $_POST['id']        =   $arr['id'];
                $_POST['lastLoginTime']=date("Y-m-d H:i:s",time());
                $_POST['lastLoginIP']=get_client_ip();
                $m->save($_POST);//更新最后登录信息
            }else {
                $_POST['prodid']=C(PRODID);
                $_POST['creditid']=$data['id'];
                $_POST['name']=$data['realname'];
                $_POST['type']=0;
                $_POST['lastLoginTime']=date("Y-m-d H:i:s",time());
                $_POST['lastLoginIP']=get_client_ip();
                $_POST['adder']='客户登录';
                $_POST['moder']='客户登录';
                $_POST['ctime']=time();
                $m->create();
                $_SESSION['userid']=$m->add();
            }

            return $data;
        }else{
            return 0;
        }
    }
    //注销
    function logout(){
        $_SESSION = array();
        if (isset($_COOKIE[session_name()])) {
            setcookie(session_name(),'',time()-3600,'/');
        }
        session_destroy();// 销毁sesstion
    }


    //获得访客浏览器类型
    function GetBrowser(){
        if(!empty($_SERVER['HTTP_USER_AGENT'])){
            $br = $_SERVER['HTTP_USER_AGENT'];
            if (preg_match('/MSIE/i',$br)) {
                $br = 'MSIE';
            }elseif (preg_match('/Firefox/i',$br)) {
                $br = 'Firefox';
            }elseif (preg_match('/Chrome/i',$br)) {
                $br = 'Chrome';
            }elseif (preg_match('/Safari/i',$br)) {
                $br = 'Safari';
            }elseif (preg_match('/Opera/i',$br)) {
                $br = 'Opera';
            }else {
                $br = 'Other';
            }
            return $br;
        }else{return "获取浏览器信息失败！";}
    }
    //获取访客操作系统
    function GetOs(){
        if(!empty($_SERVER['HTTP_USER_AGENT'])){
            $OS = $_SERVER['HTTP_USER_AGENT'];
            if (preg_match('/win/i',$OS)) {
                $OS = 'Windows';
            }elseif (preg_match('/mac/i',$OS)) {
                $OS = 'MAC';
            }elseif (preg_match('/linux/i',$OS)) {
                $OS = 'Linux';
            }elseif (preg_match('/unix/i',$OS)) {
                $OS = 'Unix';
            }elseif (preg_match('/bsd/i',$OS)) {
                $OS = 'BSD';
            }else {
                $OS = 'Other';
            }
            return $OS;
        }else{return "获取访客操作系统信息失败！";}
    }

    //获取随机码
    function getRandCode($length){
        $array = array(
            'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
            'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
            '0','1','2','3','4','5','6','8','9'
        );
        $tmpstr ='';
        $max =count($array);
        for($i=1;$i<=$length;$i++){
            $key =rand(0,$max-1);
            $tmpstr.=$array[$key];
        }
        return $tmpstr;
    }

    // CURL_GET操作
    function httpGet($url){
        $ch=curl_init(); //1.获取初始化URL
        //2.设置curl的参数
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, 500);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_URL, $url);
        $res = curl_exec($ch);//3.采集
        curl_close($ch);//4.关闭
        if(curl_errno($ch)){
            $res=curl_errno($ch);
        }
        return $res;
    }

    function httpPost($url,$postJson){
        $ch=curl_init();//1.获取初始化URL
        //2.设置curl的参数
        curl_setopt($ch, CURLOPT_TIMEOUT, 500);       //设置超时时间
        curl_setopt($ch, CURLOPT_URL, $url);          //设置抓取的url
        curl_setopt($curl, CURLOPT_HEADER, 1);        //设置头文件的信息作为数据流输出
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);  //设置获取的信息以文件流的形式返回，而不是直接输出。
        curl_setopt($ch, CURLOPT_POST, 1);            //设置post方式提交
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postJson);//post变量
        $res = curl_exec($ch);//3.采集
        curl_close($ch);//4.关闭
        if(curl_errno($ch)){
            $res=curl_errno($ch);
        }
        return $res;
    }

    //微信纯文本回复
    function wxReplyText($toUser,$fromUser,$content){
        //回复用户消息(纯文本格式)
        $msgType   = 'text';
        $time      = time();
        $template  ="<xml>
                     <ToUserName><![CDATA[%s]]></ToUserName>
                     <FromUserName><![CDATA[%s]]></FromUserName>
                     <CreateTime>%s</CreateTime>
                     <MsgType><![CDATA[%s]]></MsgType>
                     <Content><![CDATA[%s]]></Content>
                     </xml>";
        echo sprintf($template,$toUser,$fromUser,$time,$msgType,$content);
    }

    //微信图文回复
    function wxReplyNews($toUser,$fromUser,$arr){
        $msgType   = 'news';
        $time      = time();
        $template = "<xml>
        				<ToUserName><![CDATA[%s]]></ToUserName>
        				<FromUserName><![CDATA[%s]]></FromUserName>
        				<CreateTime>%s</CreateTime>
        				<MsgType><![CDATA[%s]]></MsgType>
        				<ArticleCount>".count($arr)."</ArticleCount>
        				<Articles>";
        foreach($arr as $v){
            $template .="<item>
        					<Title><![CDATA[".$v['title']."]]></Title>
        					<Description><![CDATA[".$v['description']."]]></Description>
        					<PicUrl><![CDATA[".$v['picUrl']."]]></PicUrl>
        					<Url><![CDATA[".$v['url']."]]></Url>
    					</item>";
        }
        $template .="</Articles>
    				</xml> ";
        echo sprintf($template, $toUser, $fromUser, $time, $msgType);

    }

    //微信图片回复
    function wxReplyImage($toUser,$fromUser,$mediaId){
        $msgType   = 'image';
        $time      = time();
        $template = "<xml>
                        <ToUserName><![CDATA[%s]]></ToUserName>
                        <FromUserName><![CDATA[%s]]></FromUserName>
                        <CreateTime>%s</CreateTime>
                        <MsgType><![CDATA[%s]]></MsgType>
                        <Image><MediaId><![CDATA[%s]]></MediaId></Image>
                    </xml>";
        echo sprintf($template, $toUser, $fromUser, $time, $msgType,$mediaId);
    }

    //微信语音回复
    function wxReplyVoice($toUser,$fromUser,$mediaId){
        $msgType   = 'voice';
        $time      = time();
        $template  = "<xml>
                        <ToUserName><![CDATA[%s]]></ToUserName>
                        <FromUserName><![CDATA[%s]]></FromUserName>
                        <CreateTime>%s</CreateTime>
                        <MsgType><![CDATA[%s]]></MsgType>
                        <Voice><MediaId><![CDATA[%s]]></MediaId></Voice>
                    </xml>";
        echo sprintf($template, $toUser, $fromUser, $time, $msgType,$mediaId);
    }

    //微信视频回复
    function wxReplyVideo($toUser,$fromUser,$mediaId,$title,$description){
        $msgType   = 'video';
        $time      = time();
        $template = "<xml>
                        <ToUserName><![CDATA[%s]]></ToUserName>
                        <FromUserName><![CDATA[%s]]></FromUserName>
                        <CreateTime>%s</CreateTime>
                        <MsgType><![CDATA[%s]]></MsgType>
                        <Video>
                            <MediaId><![CDATA[%s]]></MediaId>
                            <Title><![CDATA[%s]]></Title>
                            <Description><![CDATA[%s]]></Description>
                        </Video>
                    </xml>";
        echo sprintf($template, $toUser, $fromUser, $time, $msgType,$mediaId,$title,$description);
    }

    //微信音乐回复
    function wxReplyMusic($toUser,$fromUser,$mediaId,$title,$description,$musicUrl,$HQMusicUrl,$thumbMediaId){
        $msgType   = 'music';
        $time      = time();
        $template = "<xml>
                        <ToUserName><![CDATA[%s]]></ToUserName>
                        <FromUserName><![CDATA[%s]]></FromUserName>
                        <CreateTime>%s</CreateTime>
                        <MsgType><![CDATA[%s]]></MsgType>
                        <Music>
                            <Title><![CDATA[%s]]></Title>
                            <Description><![CDATA[%s]]></Description>
                            <MusicUrl><![CDATA[%s]]></MusicUrl>
                            <HQMusicUrl><![CDATA[%s]]></HQMusicUrl>
                            <ThumbMediaId><![CDATA[%s]]></ThumbMediaId>
                        </Music>
                      </xml>";
        echo sprintf($template, $toUser, $fromUser, $time, $msgType,$title,$description,$musicUrl,$HQMusicUrl,$thumbMediaId);
    }

    function wxNewsArr($size){
        for ($x=0; $x<=$size; $x++) {
                $str.="array(
                             'title'        =>  ".'$data['.$x."]['name'],
                             'description'  =>  ".'$data['.$x."]['content'],
                             'picUrl'       =>  C(WEBSERVER).'/Upload/'.".'$data['.$x."]['productimg'],
                             'url'          =>  C(WEBSERVER).'/index.php/'.C(PRODUCT).'/Service/index/id/'.".'$data['.$x."]['productid']".".'/wxOpenId/'".'.$toUser.'."'/wxAppId/'".'.$fromUser,'."
                        ),
                   ";
        }

        return $str;
    }


    //换取微信短链接
    function getShortUrl($token,$long_url){
        $url='https://api.weixin.qq.com/cgi-bin/shorturl?access_token='.$token;
        $array=array('action'=>'long2short','long_url'=>$long_url );                        //组装数组
        $postJson = json_encode($array);                                                    //封装json
        $res = httpPost($url, $postJson);
        $res = json_decode($res,true);
        return $res['short_url'];
    }

    //获取临时二维码
    function getTimeQrCode($token,$scene_id,$expire=30){
        $url='https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token='.$token;
        $expire = $expire*24*60*60;
        $postArr =array(                                                                //组装数组
            'expire_seconds'=>$expire,
            'action_name'=>"QR_SCENE",
            'action_info'=>array('scene'=>array('scene_id'=>$scene_id) )
        );
        $postJson = json_encode($postArr);                                              //封装json
        $res = httpPost($url, $postJson);                                               //获取 $ticket
        $res = json_decode($res,true);                                                  //转换成数组
        $long_url='https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket='.$res['ticket']; //使用$ticket换去二维码图片
        return getShortUrl($token,$long_url);
    }

    //获取临时二维码
    function getForeverQrCode($token,$scene_id){
        $url='https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token='.$token;
        $postArr =array(                                                                //1.组装数组
            'action_name'=>"QR_LIMIT_SCENE",
            'action_info'=>array('scene'=>array('scene_id'=>$scene_id))
        );
        $postJson = json_encode($postArr);                                              //2.封装json
        $res = httpPost($url, $postJson);
        $res = json_decode($res,true);
        $long_url='https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket='.$res['ticket']; //3.使用$ticket换去二维码图片
        return getShortUrl($token,$long_url);
    }


    //群发接口
    function wxSendMsgAll($token,$array,$type='preview'){
        if($type=='preview'){           //预览接口
            $url='https://api.weixin.qq.com/cgi-bin/message/mass/preview?access_token='.$token;
            $postJson =urldecode(json_encode($array));
            $res = httpPost($url, $postJson);
            return $res;
        }elseif ($type=='send'){        //群发接口
            $url='https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token='.$token;
            $postJson =urldecode(json_encode($array));
            $res = httpPost($url, $postJson);
            return $res;
        }else {
            return '发送类型不合规！';
        }
    }

    //获取微信服务器IP
    function wxGetServerIp($token){
        if(!$_SESSION['wx_ip_list']){
            $url = "https://api.weixin.qq.com/cgi-bin/getcallbackip?access_token=".$token;
            $res = httpGet($url);
            $_SESSION['wx_ip_list'] =json_decode($res,true);
        }
        return $_SESSION['wx_ip_list'];
    }

    //获取wxGetJsApiTicket全局票据
    function wxGetJsApiTicket($token){
        if ((time()-$_SESSION['jsapi_ticket_expire_time']) < 0){//从session中取值  jsapi_ticket
            $jsapi_ticket = $_SESSION['jsapi_ticket'];
        }else {//重新获取jsapi_ticket
            $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=".$token."&type=jsapi";
            $res =json_decode(httpGet($url),true);
            $_SESSION['jsapi_ticket']=$res['ticket'];
            $_SESSION['jsapi_ticket_expire_time']=time()+7000;
            $jsapi_ticket=$res['ticket'];
        }
        return $jsapi_ticket;
    }

    //发送微信模板消息
    function wxSendTemplateMsg($token,$touser,$template_id,$call_url,$data){
        $url      = 'https://api.weixin.qq.com/cgi-bin/message/template/send?access_token='.$token;
        $Meg      = array('touser'=>$touser,'template_id'=>$template_id,'url'=>$call_url,'data'=>$data);   //2.组装数组
        $postJson = json_encode($Meg);      //将数组转化成json
        $res      = httpPost($url, $postJson);
        return $res;
    }

    //创建自定义菜单
    function wxMenuCreat($token,$postJson) {
        $url      = 'https://api.weixin.qq.com/cgi-bin/menu/create?access_token='.$token;
        $res      = httpPost($url,$postJson);
        return $res;
    }

    //获取自定义菜单
    function wxGetMenu($token) {
        $url   = 'https://api.weixin.qq.com/cgi-bin/menu/get?access_token='.$token;
        $res   = httpGet($url);
        $arr   = json_decode($res,true);
        return $arr;
    }

    //截取字符串最后的“。”（不管几个一并截取）用于语音识别结果
    function wxRtrim($arr,$a='。'){
        $arr=rtrim($arr, $a);
        return $arr;
    }

    //根据日期获取星期
    function wk($date) {
            $datearr = explode("-",$date);     //将传来的时间使用“-”分割成数组
            $year = $datearr[0];       //获取年份
            $month = sprintf('%02d',$datearr[1]);  //获取月份
            $day = sprintf('%02d',$datearr[2]);      //获取日期
            $hour = $minute = $second = 0;   //默认时分秒均为0
            $dayofweek = mktime($hour,$minute,$second,$month,$day,$year);    //将时间转换成时间戳
            $shuchu = date("w",$dayofweek);      //获取星期值
            $weekarray=array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
            return  $weekarray[$shuchu];
     }

    //根据funcid获取测试数据
    function getTest($funcid){
        $where=array('funcid'=>$funcid);
        $arr=D('tp_exefunc')->where($where)->order('updateTime desc')->limit(15)->select();
        $str.='<ul class="list-group">';
                    foreach ($arr as $ar){
                          $str.='<li class="list-group-item">'
                                    .'<span class=badge>'.$ar['result'].'</span>'
                                            .getExescene($ar['exesceneid']).';'.getFunc($ar['funcid']);
                                      $str.='('.$ar['funcremarks'].')'.'备注：'.$ar['remark'].'<br>
                                            <b>意图：</b>'.$ar['casemain'];
                                      if($ar['caseexpected']){
                                            $str.=";<b>预期：</b>".$ar['caseexpected'];
                                      }
                                      if($ar['bugid']){
                                            $str.="&nbsp;BUGid:".$ar['bugid'];
                                      }
                                      $str.='<span class="badge">'.$ar['updatetime'].'</span>'
                                .'</li>';
                    }
        $str.='</ul>';
        return $str;
    }

    //根据id获取功能名
    function getFunc($funcid){
        $data=M('tp_func')->find($funcid);
        return $data['func'];
    }

    //根据funcid获取功能结果
    function getFResult($funcid){
        $data=M('tp_func')->find($funcid);
        return $data['result'];
    }

    //更具funcid获取项目用例
    function getPFCase($funcid){
        $where=array('funcid'=>$funcid,'state'=>'正常','fproid'=>$_SESSION['proid']);
        $arr=D('tp_case')->where($where)->order('sn,id')->select();
        $str.='<ul class="list-group">';
                foreach ($arr as $ar){
                     $str.='<li class="list-group-item">';
                     $str.=    $ar['id'].".<b>意图：</b>".$ar['main'].";<b>预期：</b>".$ar['expected']
                              .'<span class="badge">'.$ar['adder'].':'.$ar['updatetime'].'</span>';
                     $str.='</li>';
                 }
         $str.='</ul>';
        return $str;
    }

   //根据proid获取风险数
    function countRisk($proid){
        $where=array("proid"=>$proid);
        $count=M("tp_risk")->where($where)->count();
        return $count;
    }

    //状态选择控件,@param $name 控件name;@param $value 选中值
    function formselect($value="正常",$name="state",$type="state") {
        $where=array("type"=>$type,"state"=>"正常");
        $cats = M('dict')->where($where)->order('k')->select();
        $html = '<select name="'.$name.'" class="form-control">';
                    foreach($cats as $v) {
                        $selected = ($v['v']==$value) ? "selected" : "";
                        $html .= '<option '.$selected.' value="'.$v['v'].'">'.$v['v'].'</option>';
                    }
        $html .='<select>';
        return $html;
    }
    //状态选择控件,@param $name 控件name;@param $value 选中值
    function formSV($value="正常",$name="state",$type="state") {
        $where=array("type"=>$type,"state"=>1);
        $cats = M('tp_dict')->where($where)->order('k')->select();
        $html = '<select name="'.$name.'" class="form-control">';
                foreach($cats as $v) {
                    $selected = ($v['k']==$value) ? "selected" : "";
                    $html .= '<option '.$selected.' value="'.$v['k'].'">'.$v['v'].'</option>';
                }
        $html .='<select>';
        return $html;
    }


    // 根据id获取项目信息
    function getPro($proid){
        $data=M('project')->find($proid);
        return $data['name'];
    }
    // 根据id获取项目信息
    function getProname($proid){
        $data=M('project')->find($proid);
        return $data['name'];
    }

    //根据id获取项目编号
    function getProNo($proid){
        $data=M('project')->find($proid);
        return $data['code'];
    }

    //根据prodid 获取机构名称
    function getProduct($prodid){
        $data=M('product')->find($prodid);
        return $data['name'];
    }

    function getProProdunct($pro){
        $where=array('project'=>$pro);
        $data=M('projectproduct')->where($where)->find();
        return $data['product'];
    }

    function countPRules($proid){
        $m=D('module');
        $where=array("zt_projectstory.project"=>$proid, 'zt_story.deleted'=>'0');
        $count=$m->where($where)->join('zt_story ON zt_story.module =zt_module.id')
        ->join('zt_projectstory ON zt_projectstory.story =zt_story.id')->count();
        return $count;
    }


    //根据branchid获取路径数
    function countPath($branchid){
        $where=array("branch"=>$branchid);
        $count=M("module")->where($where)->count();
        return $count;
    }

    // 根据$testgp获取项目数
    function countPro($testgp){
        $where=array("testgp"=>$testgp);
        $count=M("project")->where($where)->count();
        return $count;
    }





    //自动化执行场景数
    function countAExescene($Tester){
        $where=array('zt_tp_stagetester.tester'=>$Tester,'zt_tp_stagetester.type'=>'A','zt_project.status'=>'doing','zt_tp_stage.state'=>'进行中','zt_tp_exescene.results'=>'未测试');
        $count=M("project")->where($where)->join('zt_tp_stage ON zt_tp_stage.proid =zt_project.id')
                ->join('zt_tp_stagetester ON zt_tp_stage.id =zt_tp_stagetester.stageid')
                ->join('zt_tp_exescene ON zt_tp_exescene.stagetesterid =zt_tp_stagetester.id')
                ->count();
        return $count;
    }

    //手工执行场景数
    function countMExescene($Tester){
        $where=array('zt_tp_stagetester.tester'=>$Tester,'zt_tp_stagetester.type'=>'M','zt_project.status'=>'doing','zt_tp_stage.state'=>'进行中','zt_tp_exescene.results'=>'未测试');
        $count=M("project")->where($where)->join('zt_tp_stage ON zt_tp_stage.proid =zt_project.id')
            ->join('zt_tp_stagetester ON zt_tp_stage.id =zt_tp_stagetester.stageid')
            ->join('zt_tp_exescene ON zt_tp_exescene.stagetesterid =zt_tp_stagetester.id')
            ->count();
        return $count;
    }






    //根据$pathid获取功能信息
    function getSPath($pathid){
        $where=array("zt_module.id"=>$pathid);
        $data=M("branch")->where($where)->join('inner JOIN zt_module ON zt_branch.id = zt_module.branch')->find();
        $str.= '<span class="label label-default">'
                    .getBranchName($data['branch'])
                .'</span>&nbsp;';
        $str.= '<span class="label label-info">'
                    .getModuleName($data['parent'])
                ."</span>" ;
        $str.=  "<b>".$data['name']."(".$data['id'].")</b>";
        return $str;
    }





    //根据$pathid获取模块名
    function getModuleName($pathid){
       $data=M('module')->find($pathid);
            if ($data['parent']){
                $str=getModuleName($data['parent']).'-'.$data['name'];
            }else {
                $str=$data['name'];
            }
        return $str;
    }
    //获取需求详情
    function getStorySpec($storyId){
        $where=array('story'=>$storyId);
        $arr=M('storyspec')->where($where)->order('version desc')->select();
            foreach ($arr as $ar){
               $str.='<li class="list-group-item">#'.$ar['version'].'<hr><p>'.$ar['spec'].'</p></li>';
            }
        return $str;
    }

    //获取平台名称
    function getBranchName($branchid){
        $data=M('branch')->find($branchid);
        return $data['name'];
    }


    function getBugStauts($value){
        if($value=='active'){
            return '激活';
        }elseif ($value=='closed'){
            return '已关闭';
        }elseif ($value=='resolved'){
            return '已解决';
        }elseif ($value=='changed'){
            return '已变更';
        }else{
            return ;
        }
    }


    //获取真实姓名
    function getRealname($username){
        $where=array('account'=>$username);
        $data=M('user')->where($where)->find();
        return $data['realname'];
    }


    function countId($table,$name,$value){
        $where=array($name=>$value,"deleted"=>'0');
        $count=M($table)->where($where)->count();
        return $count;
    }
    function getName($table,$id,$name='name'){
        $data=M($table)->find($id);
        return $data[$name];
    }
    function countBug($proid){
        $where=array("project"=>$proid,"deleted"=>'0');
        $count=M("bug")->where($where)->count();
        return $count;
    }

















  //获取禅道用户名
  function getZTUserName($account){
      if($account){
          $where=array('account'=>$account);
          $arr=M('user')->where($where)->find();
          return $arr['realname'];
      }else {
          return 'NoBody';
      }

  }


