
//
//  GXSerChooseView.m
//  CommShare
//
//  Created by guang hui on 2017/10/23.
//  Copyright © 2017年 Sandwind. All rights reserved.
//

#import "GXSerChooseView.h"

@interface GXSerChooseView()<UITextFieldDelegate>

@property (nonatomic,strong) UIView *view1;

@property (nonatomic,strong) UIView *view2;

@end
@implementation GXSerChooseView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        
        [self setUI];
        [self addSubview:self.view1];
        [self addSubview:self.view2];
        [self addSubview:self.releaseOrderBtn];
    }
    return self;
}

- (void)setUI
{
    self.view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 0.35)];
    self.view1.backgroundColor = [GXGeneralHelp colorWithHexString:@"#ffffff" andAlpha:1.0];
    self.view1.layer.cornerRadius = 5.0;
//        self.view1.layer.masksToBounds = YES;
    //设置投影
    self.view1.layer.shadowColor = [UIColor blackColor].CGColor;
    self.view1.layer.shadowOpacity = 0.8f;
    self.view1.layer.shadowRadius = 5.0f;
    self.view1.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    
    
    self.view2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view1.frame) + KH(10), self.frame.size.width, self.view1.frame.size.height)];
    self.view2.backgroundColor = [GXGeneralHelp colorWithHexString:@"#ffffff" andAlpha:1.0];
    self.view2.layer.cornerRadius = 5.0;
//        self.view2.layer.masksToBounds = YES;
    //设置投影
    self.view2.layer.shadowColor = [ UIColor blackColor].CGColor;
    self.view2.layer.shadowOpacity = 0.8f;
    self.view2.layer.shadowRadius = 5.0f;
    self.view2.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    
    
    self.serBtn = [[UIButton alloc]initWithFrame:CGRectMake(KW(15), KH(8), KScreenWidth - KW(100), KH(30))];
    [self.serBtn setTitle:@"插座开关维修" forState:UIControlStateNormal];
    [self.serBtn setTitleColor:[GXGeneralHelp colorWithHexString:@"#21241A" andAlpha:1.0] forState:UIControlStateNormal];
    self.serBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.serBtn addTarget:self action:@selector(serBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view1 addSubview:self.serBtn];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(KW(15), CGRectGetMaxY(self.serBtn.frame), KScreenWidth - KW(100), 1)];
    line1.backgroundColor = [UIColor grayColor];
    [self.view1 addSubview:line1];
    
    self.locLabel = [[UILabel alloc]initWithFrame:CGRectMake(KW(15), CGRectGetMaxY(self.serBtn.frame) + KH(8), KScreenWidth - KW(100), KH(50))];
    self.locLabel.font = [UIFont systemFontOfSize:14];
    self.locLabel.numberOfLines = 0;
    self.locLabel.textAlignment = NSTextAlignmentLeft;
    self.locLabel.textColor = [GXGeneralHelp colorWithHexString:@"#21241A" andAlpha:1.0];
    [self.view1 addSubview:self.locLabel];
    
   
    
    self.ordMonLabel = [[UILabel alloc]initWithFrame:CGRectMake(KW(15), KH(8), KScreenWidth - KW(100), KH(30))];
    self.ordMonLabel.text = @"愿付酬劳:";
    self.ordMonLabel.font = [UIFont systemFontOfSize:18];
    self.ordMonLabel.textAlignment = NSTextAlignmentLeft;
    [self.view2 addSubview:self.ordMonLabel];
    
    
    self.moneyTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(KScreenWidth - KW(220), KH(8), KW(200), KH(30))];
    self.moneyTextFiled.placeholder = @"请填写订单酬劳";
    self.moneyTextFiled.textColor = [GXGeneralHelp colorWithHexString:@"#21241A" andAlpha:1.0];
    self.moneyTextFiled.textAlignment = NSTextAlignmentLeft;
    [self.view2 addSubview:self.moneyTextFiled];
    
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(KW(15), CGRectGetMaxY(self.ordMonLabel.frame), KScreenWidth - KW(100), 1)];
    line2.backgroundColor = [UIColor grayColor];
    [self.view2 addSubview:line2];
   
    self.serTimeChooseBtn = [[UIButton alloc]initWithFrame:CGRectMake(KW(15), CGRectGetMaxY(self.ordMonLabel.frame) + KH(8), KScreenWidth - KW(100), KH(30))];
    [self.serTimeChooseBtn setTitle:@"服务时间:" forState:UIControlStateNormal];
    [self.serTimeChooseBtn setTitleColor:[GXGeneralHelp colorWithHexString:@"#21241A" andAlpha:1.0] forState:UIControlStateNormal];
    self.serTimeChooseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.view2 addSubview:self.serTimeChooseBtn];
    
    
    self.releaseOrderBtn = [[UIButton alloc]initWithFrame:CGRectMake(KW(15), CGRectGetMaxY(self.view2.frame) + KH(10), KScreenWidth - KW(50), KH(46))];
    [self.releaseOrderBtn setTitle:@"发布订单" forState:UIControlStateNormal];
    self.releaseOrderBtn.layer.cornerRadius = 5;
    self.releaseOrderBtn.layer.masksToBounds = YES;
    self.releaseOrderBtn.backgroundColor = [GXGeneralHelp colorWithRedValue:42 green:97 blue:218 andAlpha:1.0];
    
}

#pragma mark - delegate
- (void)serBtnClick
{
    if ([self.delegate respondsToSelector:@selector(serBtnClick)]) {
        [self.delegate serBtnClick];
    }
}

@end
