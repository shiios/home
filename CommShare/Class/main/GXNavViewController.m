//
//  GXNavViewController.m
//  CommShare
//
//  Created by guang hui on 2017/10/23.
//  Copyright © 2017年 Sandwind. All rights reserved.
//

#import "GXNavViewController.h"
#import "GXUserLocationViewController.h"

@interface GXNavViewController ()<UINavigationControllerDelegate>

@end

@implementation GXNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationBar.hidden = YES;
    
    
    
    
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
