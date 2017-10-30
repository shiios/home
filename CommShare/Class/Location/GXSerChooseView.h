//
//  GXSerChooseView.h
//  CommShare
//
//  Created by guang hui on 2017/10/23.
//  Copyright © 2017年 Sandwind. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SerBtnClickDelegate <NSObject>
- (void)serBtnClick;
@end

@interface GXSerChooseView : UIView

@property (nonatomic,strong) UIButton *serBtn;
@property (nonatomic,strong) UILabel *locLabel;
@property (nonatomic,strong) UILabel *ordMonLabel;
@property (nonatomic,strong) UIButton *serTimeChooseBtn;
@property (nonatomic,strong) UIButton *releaseOrderBtn;
@property (nonatomic,strong) UITextField *moneyTextFiled;
@property (nonatomic,weak) id<SerBtnClickDelegate>delegate;

@end
