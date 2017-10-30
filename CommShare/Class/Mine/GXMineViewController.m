//
//  GXMineViewController.m
//  CommShare
//
//  Created by Sandwind on 2017/10/20.
//  Copyright © 2017年 Sandwind. All rights reserved.
//

#import "GXMineViewController.h"
#import "GXTableViewCell.h"
@interface GXMineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *mineView;
@property (nonatomic,strong) NSMutableArray *mineInfoArray;

@end

@implementation GXMineViewController

- (UITableView *)mineView
{
    if (!_mineView) {
        _mineView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, KScreenWidth * 0.5, KScreenHeight-20) style:UITableViewStylePlain];
        _mineView.delegate = self;
        _mineView.dataSource = self;
        _mineView.scrollEnabled = YES;
        
    }
    return _mineView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mineInfoArray = [NSMutableArray arrayWithObjects:@"订单~师傅",@"服务保障",@"师傅加盟",@"关于我们", nil];
    [self.view addSubview:self.mineView];
    
}
#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mineInfoArray.count + 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"GXTableViewCell";
    GXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[GXTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    if (indexPath.row != 0) {
        cell.nameL.text = self.mineInfoArray[indexPath.row - 1];
        cell.porImageView.hidden = YES;;
        return cell;
    }else{
        cell.porImageView.image = nil;
        return cell;
    }
}

    

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row > 0){
        NSLog(@"%@",self.mineInfoArray[indexPath.row-1]);
    }else{
        NSLog(@"头像呗点击了");
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return KH(60);
    }else{
        return KH(40);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
