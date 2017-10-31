//
//  GXServiceDetaiVC.m
//  CommShare
//
//  Created by guang hui on 2017/10/30.
//  Copyright © 2017年 Sandwind. All rights reserved.
//

#import "GXServiceDetaiVC.h"

@interface GXServiceDetaiVC ()<UISearchBarDelegate>

@property (nonatomic,strong) UISearchBar *searchBar;

@end

@implementation GXServiceDetaiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [GXGeneralHelp colorWithHexString:@"#ffffff" andAlpha:1.0];
    self.navTitleView.text = @"服务详情";
    
    [self configUI];
    
}
- (void)configUI
{
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KH(46))];
    self.searchBar.barStyle = UIBarStyleDefault;
    self.searchBar.placeholder = @"输入需求或故障，例如三星手机换屏";
    [self.view addSubview:self.searchBar];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
