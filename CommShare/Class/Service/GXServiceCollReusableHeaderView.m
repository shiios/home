//
//  GXServiceCollReusableHeaderView.m
//  CommShare
//
//  Created by guang hui on 2017/10/30.
//  Copyright © 2017年 Sandwind. All rights reserved.
//

#import "GXServiceCollReusableHeaderView.h"

@implementation GXServiceCollReusableHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setUI];
        [self addSubview:self.serNameLabel];
        
    }
    return self;
}

- (void)setUI
{
    self.serNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 0, 200, 40)];
    self.serNameLabel.font = [UIFont systemFontOfSize:15];
    self.serNameLabel.textColor = [UIColor blackColor];
    self.serNameLabel.textAlignment = NSTextAlignmentLeft;
}

@end
