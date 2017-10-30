//
//  GXChooseServiceVC.m
//  CommShare
//
//  Created by guang hui on 2017/10/23.
//  Copyright © 2017年 Sandwind. All rights reserved.
//

#import "GXChooseServiceVC.h"
#import "GXServiceCollectionViewCell.h"
#import "GXServiceCollReusableHeaderView.h"

static NSString *cellID = @"GHCollectionViewCell";
static NSString *headerID = @"CollectionHeaderView";
#define KWScreen [UIScreen mainScreen] .bounds.size.width
#define KHScreen [UIScreen mainScreen].bounds.size.height
@interface GXChooseServiceVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UIView *navView;
@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong) NSMutableArray *servDatas;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation GXChooseServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self setUI];
    
}
- (void)setUI
{
   
    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 64)];
    self.navView.backgroundColor = [GXGeneralHelp colorWithRedValue:42 green:97 blue:218 andAlpha:1.0];
    [self.view addSubview:self.navView];
    self.backBtn = [[UIButton alloc]initWithFrame:CGRectMake(KW(10), 20, KW(40), KW(40))];
    [self.backBtn setTitle:@"back" forState:UIControlStateNormal];
    self.backBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.navView addSubview:self.backBtn];
    [self.backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((KScreenWidth - KW(80))/2.0, 20, KW(80), 40)];
    self.titleLabel.text = @"选择服务";
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [GXGeneralHelp colorWithHexString:@"#ffffff" andAlpha:1.0];
    [self.navView addSubview:self.titleLabel];
    
    self.dataArray = [NSMutableArray arrayWithObjects:@"开锁",@"灯管灯泡",@"下水道",@"洗手池",@"清洗油烟机",@"开锁",@"灯管灯泡",@"下水道",@"洗手池",@"清洗油烟机",@"开锁",@"灯管灯泡",@"下水道",@"洗手池",@"清洗油烟机",@"开锁",@"灯管灯泡",@"下水道",@"洗手池",@"清洗油烟机",@"开锁",@"灯管灯泡",@"下水道",@"洗手池",@"清洗油烟机",@"开锁",@"灯管灯泡",@"下水道",@"洗手池",@"清洗油烟机",@"开锁",@"灯管灯泡",@"下水道",@"洗手池",@"清洗油烟机",@"开锁",@"灯管灯泡",@"下水道",@"洗手池",@"清洗油烟机", nil];
    self.flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.flowLayout.minimumLineSpacing = 8;
    self.flowLayout.minimumInteritemSpacing = 8;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, KWScreen, KHScreen - 64) collectionViewLayout:self.flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[GXServiceCollectionViewCell class] forCellWithReuseIdentifier:cellID];
    [self.collectionView registerClass:[GXServiceCollReusableHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
    
    
    
}

- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GXServiceCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    //    cell.backgroundColor = [UIColor redColor];
    
    if (!cell) {
        cell = [[GXServiceCollectionViewCell alloc]init];
    }
    cell.nameLabel.text = self.dataArray[indexPath.item];
    NSLog(@"%@",cell.nameLabel.text);
    CGFloat w = [self getWidthWithTitle:cell.nameLabel.text font:[UIFont systemFontOfSize:14]];
    
    CGFloat w2 = ([UIScreen mainScreen].bounds.size.width - 49) / 4.0;
    if (w >= w2) {
        cell.nameLabel.frame = CGRectMake(0, 0, w, 30);
    }else{
        cell.nameLabel.frame = CGRectMake(0, 0, w2, 30);
    }
    return cell;
}

-(CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    
    CGSize size = [title boundingRectWithSize:CGSizeMake(300, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return size.width;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    CGFloat w = ([UIScreen mainScreen].bounds.size.width - 40) / 4.0;
    //    CGFloat w = [self getWidthWithTitle:self.dataArray[indexPath.row] font:[UIFont systemFontOfSize:14]];
    CGFloat margin = self.flowLayout.minimumInteritemSpacing;
    CGFloat columnMargin = self.flowLayout.minimumLineSpacing;
    //    NSLog(@"%.2f  %.2f  %.2f",w,margin,columnMargin);
    
    CGFloat w = [self getWidthWithTitle:self.dataArray[indexPath.row] font:[UIFont systemFontOfSize:14]];
    
    CGFloat w2 = ([UIScreen mainScreen].bounds.size.width - 49) / 4.0;
    if (w >= w2) {
        return CGSizeMake(w, 30);
        
    }else{
        return CGSizeMake(w2, 30);
        
    }
    
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reuseableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        GXServiceCollReusableHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerID forIndexPath:indexPath];
        
        if (headerView == nil) {
            headerView = [[GXServiceCollReusableHeaderView alloc]init];
        }
        
        headerView.backgroundColor = [UIColor greenColor];
        headerView.serNameLabel.text = self.dataArray[indexPath.section];
        reuseableView = headerView;
    }
    return reuseableView;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return (CGSize){KWScreen,44};
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat w = [self getWidthWithTitle:self.dataArray[indexPath.row] font:[UIFont systemFontOfSize:14]];
    NSLog(@"%ld   %.2f",(long)indexPath.row,w);
    
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

@end
