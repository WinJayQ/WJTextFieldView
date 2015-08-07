//
//  WJTextFieldView.h
//  WJTextFieldViewDemo
//
//  Created by jh navi on 15/8/7.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJTextFieldView : UIView<UITextFieldDelegate>
@property (nonatomic, strong)UILabel *leftTitleLbl;//左边标题
@property (nonatomic, strong)UITextField *inputTextField;//文本输入框
@property (nonatomic, strong)UILabel *mustFlagLbl;//必须输入标识
@property (nonatomic, assign)int textLimitLength;//限制字符长度


@end
