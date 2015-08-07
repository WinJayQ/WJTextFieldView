# WJTextFieldView
组合View，适合注册登录，填写信息等界面。并对TextField的字符长度进行限制，英文，中文等，包括中文的联想词

##使用介绍
###1)将WJTextFieldView.h,WJTextFieldView.m拷贝到工程，提示框需要MBProgressHUD支持。
###2)使用方法如下
    WJTextFieldView *myTFViewCH = [[WJTextFieldView alloc]initWithFrame:(CGRectMake(0, 200, kMainWidth, 40))];
    myTFViewCH.leftTitleLbl.text = @"中文示例：";                   //左边标题
    myTFViewCH.textLimitLength = 10;                                //字符限制长度
    myTFViewCH.inputTextField.placeholder = @"请输入文字";
    myTFViewCH.mustFlagLbl.hidden = NO;                            //必填标识是否隐藏
    [self.view addSubview:myTFViewCH];

##效果图
![WJTextFieldView](https://github.com/WinJayQ/WJTextFieldView/raw/master/WJTextFieldViewDemo/wj.gif) 
