//
//  SYFTextBoxController.m
//  模仿优酷的文本输入框
//
//  Created by syf on 15/8/3.
//  Copyright (c) 2015年 SYF. All rights reserved.
//

#import "SYFTextBoxController.h"
#import "SYFTextBox.h"
#define SYFNotificationCenter [NSNotificationCenter defaultCenter]
@interface SYFTextBoxController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *TFd;
@property (weak, nonatomic) SYFTextBox * textbox;
@end

@implementation SYFTextBoxController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textbox = [SYFTextBox createView];
    _TFd.inputAccessoryView = _textbox;
    _textbox.textTFd.delegate = self;
    [SYFNotificationCenter addObserver:self selector:@selector(textChange:) name:UITextViewTextDidChangeNotification object:_textbox.textTFd];

}
- (IBAction)TextEnterClicked:(id)sender {
    [_TFd becomeFirstResponder];
     [_textbox.textTFd becomeFirstResponder];
}

- (void)dealloc
{
    [SYFNotificationCenter removeObserver:self];
}

- (void)textChange:(NSNotification *)nori
{
    UITextView * textFd = nori.object;
    NSLog(@"%@",textFd.text);
    NSUInteger strACout = 300 - textFd.text.length;
    NSString * str = [NSString stringWithFormat:@"%ld",strACout];
    [_textbox.CheckBtn setTitle:str forState:UIControlStateNormal];
    _TFd.text = textFd.text;
}

#pragma mark textView 的代理方法
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        [_TFd resignFirstResponder];
        return NO;
    }
    return YES;
}
@end
