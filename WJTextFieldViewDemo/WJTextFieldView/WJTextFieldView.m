//
//  WJTextFieldView.m
//  WJTextFieldViewDemo
//
//  Created by jh navi on 15/8/7.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

#import "WJTextFieldView.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"

#define kMainWidth    [[UIScreen mainScreen] bounds].size.width
#define kMainHeight   [[UIScreen mainScreen] bounds].size.height
#define kFont [UIFont systemFontOfSize:14]

@implementation WJTextFieldView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadUI];
    }
    return self;
}

- (void)loadUI{
    self.leftTitleLbl = [[UILabel alloc]initWithFrame:(CGRectMake(10, 20, 70, 20))];
    self.leftTitleLbl.font = kFont;
    [self addSubview:self.leftTitleLbl];
    self.inputTextField = [[UITextField alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(self.leftTitleLbl.frame), 15, kMainWidth - 97, 25))];
    self.inputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;;
    self.inputTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    UIImage* imageNor = [UIImage imageNamed:@"common_edit_bg.png"];
    UIEdgeInsets insetsReg = UIEdgeInsetsMake(0, 4, 3, 4);
    self.textLimitLength = 50;
    imageNor = [imageNor resizableImageWithCapInsets:insetsReg resizingMode:UIImageResizingModeStretch];
    self.inputTextField.background = imageNor;
    self.inputTextField.borderStyle = UITextBorderStyleNone;
    self.inputTextField.returnKeyType = UIReturnKeyDone;
    self.inputTextField.font = kFont;
    self.inputTextField.delegate = self;
    self.inputTextField.text = @"";
    [self addSubview:self.inputTextField];
    int textFieldHeight = CGRectGetHeight(self.inputTextField.frame);
    self.mustFlagLbl = [[UILabel alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(self.inputTextField.frame)+5, textFieldHeight / 2+10, 20, 20))];
    self.mustFlagLbl.text = @"*";
    self.mustFlagLbl.font = [UIFont systemFontOfSize:20];
    self.mustFlagLbl.textColor = [UIColor redColor];
    self.mustFlagLbl.hidden = YES;
    [self addSubview:self.mustFlagLbl];
    [self.inputTextField addTarget:self action:@selector(limitLength:) forControlEvents:UIControlEventEditingChanged];
    
}

-(void)limitLength:(UITextField *)sender
{
    bool isChinese;//判断当前输入法是否是中文
    if ([[[UITextInputMode currentInputMode] primaryLanguage] isEqualToString: @"en-US"]) {
        isChinese = false;
    }
    else
    {
        isChinese = true;
    }
    
    if(sender == self.inputTextField) {
        // 8位
        NSString *str = [[self.inputTextField text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
        if (isChinese) { //中文输入法下
            UITextRange *selectedRange = [self.inputTextField markedTextRange];
            //获取高亮部分
            UITextPosition *position = [self.inputTextField positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position) {
                // NSLog(@"汉字");
                if ( str.length>=(self.textLimitLength+1)) {
                    NSString *strNew = [NSString stringWithString:str];
                    [self.inputTextField setText:[strNew substringToIndex:self.textLimitLength]];
                    
                    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
                    MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:app.window animated:YES];
                    hud.labelText = [NSString stringWithFormat:@"输入字符限制%d个字符",self.textLimitLength];
                    hud.dimBackground = NO;
                    hud.mode = MBProgressHUDModeCustomView;
                    hud.minShowTime = 1;
                    [MBProgressHUD hideAllHUDsForView:app.window animated:YES];
                }
            }
            else
            {
                // NSLog(@"输入的英文还没有转化为汉字的状态");
                
            }
        }else{
            // NSLog(@"str=%@; 本次长度=%d",str,[str length]);
            if ([str length]>=(self.textLimitLength+1)) {
                NSString *strNew = [NSString stringWithString:str];
                [self.inputTextField setText:[strNew substringToIndex:self.textLimitLength]];
                
                AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
                MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:app.window animated:YES];
                hud.labelText = [NSString stringWithFormat:@"输入字符限制%d个字符",self.textLimitLength];
                hud.dimBackground = NO;
                hud.mode = MBProgressHUDModeCustomView;
                hud.minShowTime = 1;
                [MBProgressHUD hideAllHUDsForView:app.window animated:YES];
            }
        }
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    if ([string isEqualToString:@"\n"])
    {
        return YES;
    }
    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (self.inputTextField == textField)
    {
        if ([toBeString length] > self.textLimitLength) {
            [self endEditing:YES];
            AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
            MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:app.window animated:YES];
            hud.labelText = [NSString stringWithFormat:@"输入字符限制%d个字符",self.textLimitLength];
            hud.dimBackground = NO;
            hud.mode = MBProgressHUDModeCustomView;
            hud.minShowTime = 1;
            [MBProgressHUD hideAllHUDsForView:app.window animated:YES];
            
            return NO;
        }
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self endEditing:YES];
    return YES;
}



@end
