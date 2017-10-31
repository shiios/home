//
//  GXBaseViewController.m
//  CommShare
//
//  Created by guang hui on 2017/10/29.
//  Copyright © 2017年 Sandwind. All rights reserved.
//

#import "GXBaseViewController.h"

@interface GXBaseViewController ()


@end

@implementation GXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNav];
}

- (void)setNav
{
    self.view.backgroundColor = [GXGeneralHelp colorWithHexString:@"#f6f6f6" andAlpha:1.0];
    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 64)];
    self.navView.backgroundColor = [GXGeneralHelp colorWithRedValue:42 green:97 blue:218 andAlpha:1.0];
    [self.view addSubview:self.navView];
    self.backBtn = [[UIButton alloc]initWithFrame:CGRectMake(KW(10), 20, KW(40), KW(40))];
    [self.backBtn setTitle:@"back" forState:UIControlStateNormal];
    self.backBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.navView addSubview:self.backBtn];
    [self.backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navTitleView = [[UILabel alloc]initWithFrame:CGRectMake((KScreenWidth - KW(80))/2.0, 20, KW(80), 40)];
    self.navTitleView.font = [UIFont systemFontOfSize:14];
    self.navTitleView.textAlignment = NSTextAlignmentCenter;
    self.navTitleView.textColor = [GXGeneralHelp colorWithHexString:@"#ffffff" andAlpha:1.0];
    [self.navView addSubview:self.navTitleView];
    
}
- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
