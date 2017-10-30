//
//  GXServiceCollectionViewCell.m
//  CommShare
//
//  Created by guang hui on 2017/10/30.
//  Copyright © 2017年 Sandwind. All rights reserved.
//

#import "GXServiceCollectionViewCell.h"

@implementation GXServiceCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setUI];
        [self.contentView addSubview:self.nameLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

- (void)setUI
{
    //    CGFloat w = ([UIScreen mainScreen].bounds.size.width - 40) / 4.0;
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 2000, 30)];
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.layer.cornerRadius = 8.0;
    self.nameLabel.layer.masksToBounds = YES;
    self.nameLabel.layer.borderWidth = 1.0;
    self.nameLabel.layer.borderColor = [UIColor grayColor].CGColor;
    [self.nameLabel sizeToFit];
    
}
@end
