//
//  SYFTextBox.m
//  模仿优酷的文本输入框
//
//  Created by syf on 15/8/3.
//  Copyright (c) 2015年 SYF. All rights reserved.
//

#import "SYFTextBox.h"
#import "SYFCustomButton.h"

@implementation SYFTextBox
- (void)awakeFromNib
{
    self.textTFd.layer.borderWidth = 1.6;
    _textTFd.layer.borderColor = SYFColor(173, 210, 252).CGColor;
    _textTFd.layer.cornerRadius = 3;
 }

+ (instancetype)createView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"SYFTextBox" owner:nil options:nil] lastObject];
}

- (IBAction)cleanClicked:(SYFCustomButton *)sender {
    
    [sender setTitle:@"300" forState:UIControlStateNormal];
    _textTFd.text = nil;
}


@end
