//
//  NumberKeyboard.m
//  RollingHD
//
//  Created by xiaSang on 2017/11/24.
//  Copyright © 2017年 xiaSang. All rights reserved.
//

#import "NumberKeyboard.h"

@implementation NumberKeyboard


- (void)layoutSubviews {
    [super layoutSubviews];
    [self CustomViewSetting];
}

-(void)CustomViewSetting{
    
    
    NSArray *KeyArr = @[@"7",@"8",@"9"  ,
                        @"4",@"5",@"6"  ,
                        @"1",@"2",@"3"  ,
                        @"0",@".",@"退格",
                        @"取消",@"确定",@""];
    
    for (int k=0; k<5; k++) {
        for (int L=0; L<3; L++) {
            
            CGFloat width   = self.mj_w/3;
            CGFloat height  = self.mj_h/5;
            CGFloat padding = 5;
            
            UIButton *Button = [UIButton buttonWithType:UIButtonTypeSystem];
            Button.backgroundColor = [UIColor lightGrayColor];
            Button.frame = CGRectMake(L*width+padding/2, height*k+padding/2, width-padding, height-padding);
            [self addSubview:Button];
            
            [Button setTitle:KeyArr[L+k*3] forState:0];
            [Button addTarget:self action:@selector(ClickKeyBoardButton:) forControlEvents:UIControlEventTouchUpInside];
        
            //确定按钮
            if (L+k*3 == 14) [Button removeFromSuperview];
            if (L+k*3 == 13) {
                Button.mj_w = width*2 - padding;
            }
        
        }
    }
    
}

-(void)ClickKeyBoardButton:(UIButton*)button{
    NSString *Link = [button currentTitle];

    
    
    if ([Link isEqual:@"退格"]) {

        [_Field deleteBackward];
        // 小数点补位 小数点左边被清除
        if([_Field.text hasPrefix:@"."])[_Field insertText:@"0"];
        
    }else if ([Link isEqual:@"取消"]) {
        NSLog(@"keyboard:Cancel");
    }else if ([Link isEqual:@"确定"]) {
        NSLog(@"keyboard:Done");
        
    }else{
        if ([_Field.text containsString:@"."] && [Link isEqual:@"."]){
            NSLog(@"重复输入小数点!");
        }else{
            
            // 小数点补位 首次输入"."
            if([Link isEqual:@"."] && [_Field.text isEqual:@""]){
                [_Field insertText:@"0"];
            }
            
            [_Field insertText:Link];
            
            // 小数点补位 光标前移
            if ([_Field.text hasPrefix:@"."]) {
                [_Field deleteBackward];
                [_Field insertText:@"0"];
                [_Field insertText:Link];
            }
            
        }
            
        
    }
    
    
 
}





@end
