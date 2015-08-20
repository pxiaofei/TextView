//
//  SYFTextBox.h
//  模仿优酷的文本输入框
//
//  Created by syf on 15/8/3.
//  Copyright (c) 2015年 SYF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYFTextBox : UIView<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textTFd;
@property (weak, nonatomic) IBOutlet  UIButton * CheckBtn;
+ (instancetype)createView;
@end
