//
//  ViewController.m
//  WJTextFieldViewDemo
//
//  Created by jh navi on 15/8/7.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

#import "ViewController.h"
#import "WJTextFieldView.h"

#define kMainWidth    [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //使用方法
    WJTextFieldView *myTFViewEn = [[WJTextFieldView alloc]initWithFrame:(CGRectMake(0, 140, kMainWidth, 40))];
    myTFViewEn.leftTitleLbl.text = @"英文示例：";
    myTFViewEn.textLimitLength = 10;
    myTFViewEn.inputTextField.placeholder = @"请输入文字";
    myTFViewEn.mustFlagLbl.hidden = NO;
    [self.view addSubview:myTFViewEn];
    
    WJTextFieldView *myTFViewCH = [[WJTextFieldView alloc]initWithFrame:(CGRectMake(0, 200, kMainWidth, 40))];
    myTFViewCH.leftTitleLbl.text = @"中文示例：";
    myTFViewCH.textLimitLength = 10;
    myTFViewCH.inputTextField.placeholder = @"请输入文字";
    myTFViewCH.mustFlagLbl.hidden = NO;
    [self.view addSubview:myTFViewCH];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
