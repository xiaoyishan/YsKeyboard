//
//  ViewController.m
//  YsKeyboard
//
//  Created by xiaSang on 2017/11/28.
//  Copyright © 2017年 xiaSang. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 全局隐藏键盘
    [UITextField appearance].inputView = [[UIView alloc]initWithFrame:CGRectZero];
    
    
    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 100, 40)];
    field.backgroundColor = [UIColor orangeColor];
    field.delegate = self;
    [self.view addSubview:field];
    
    
    NumView = [[NumberKeyboard alloc]initWithFrame:CGRectMake(10, 200, 300, 300)];
    NumView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:NumView];
    
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NumView.Field = textField;
}

@end
