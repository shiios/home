//
//  GXTableViewCell.m
//  CommShare
//
//  Created by Sandwind on 2017/10/20.
//  Copyright © 2017年 Sandwind. All rights reserved.
//

#import "GXTableViewCell.h"

@implementation GXTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUI];
        [self.contentView addSubview:self.porImageView];
        [self.contentView addSubview:self.nameL];
        
    }
    return self;
}

- (void)setUI
{
    
    self.porImageView = [[UIImageView alloc]initWithFrame:CGRectMake(KW(8), KH(8), KW(40), KW(40))];
    self.porImageView.backgroundColor = [UIColor blackColor];
    self.porImageView.layer.cornerRadius = KW(20);
    self.porImageView.layer.masksToBounds = NO;
    
    
    self.nameL = [[UILabel alloc]initWithFrame:CGRectMake(KW(10), KH(4), KW(100), KH(30))];
    self.nameL.textColor = [UIColor blackColor];
    self.nameL.font = [UIFont systemFontOfSize:15];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
