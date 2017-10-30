//
//  GXUserLocationViewController.m
//  CommShare
//
//  Created by Sandwind on 2017/10/20.
//  Copyright © 2017年 Sandwind. All rights reserved.
//

#import "GXUserLocationViewController.h"
#import "GXMineViewController.h"
#import "GXSerChooseView.h"
#import "GXChooseServiceVC.h"
#import "ErrorInfoUtility.h"

@interface GXUserLocationViewController ()<MAMapViewDelegate,AMapLocationManagerDelegate,SerBtnClickDelegate,AMapSearchDelegate>

@property (nonatomic,strong) MAMapView *mapView;
@property (nonatomic,strong) NSMutableArray *annotations;
@property (nonatomic,strong) UIButton *refCurrLocBtn;
@property (nonatomic,strong) AMapLocationManager *locationManager;
@property (nonatomic,assign) BOOL locatingWithReGeocode;
@property (nonatomic,strong) GXMineViewController *mineVc;
@property (nonatomic,strong) NSString *currLoc;
@property (nonatomic,strong) AMapSearchAPI *searchApi;

@property (nonatomic,strong) UIButton *portraitBtn;
@property (nonatomic,strong) UIButton *menuBtn;

@property (nonatomic,strong) GXSerChooseView *serChooseView;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate2D;

@end

@implementation GXUserLocationViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.searchApi = [[AMapSearchAPI alloc]init];
    self.searchApi.delegate = self;
    
    [AMapServices sharedServices].enableHTTPS = YES;
    [self setMapViewConfig];
    [self setLocationManager];
    [self setUI];
}
#pragma mark - 配置mapview
- (void)setMapViewConfig
{
    self.mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    self.mapView.showsCompass = NO;
    self.mapView.showsScale = NO;
}
#pragma mark - 设置定位管理
- (void)setLocationManager
{
    self.locationManager = [[AMapLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 200;
    
    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9) {
        self.locationManager.allowsBackgroundLocationUpdates = YES;
    }
    
//开始持续定位并返回以地理编码信息
    [self.locationManager setLocatingWithReGeocode:YES];
    [self.locationManager startUpdatingLocation];
    
}
#pragma mark - 设置界面
- (void)setUI
{
    //头像
    self.portraitBtn = [[UIButton alloc]initWithFrame:CGRectMake(KW(10), 20, KW(40), KW(40))];
    self.portraitBtn.backgroundColor = [UIColor greenColor];
    self.portraitBtn.layer.cornerRadius = KW(20);
    self.portraitBtn.layer.masksToBounds = YES;

    [self.view addSubview:self.navView];
    [self.navView addSubview:self.portraitBtn];
    [self.portraitBtn addTarget:self action:@selector(portrairClick) forControlEvents:UIControlEventTouchUpInside];
    
    //菜单
    self.menuBtn = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth - KW(72), 20, KW(56), KW(40))];
    [self.menuBtn setTitle:@"menu" forState:UIControlStateNormal];
    [self.menuBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.menuBtn addTarget:self action:@selector(menuBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.menuBtn];

    
    //刷新当位置
    self.refCurrLocBtn = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth - KW(50), KScreenHeight*0.5, KW(40), KH(40))];
    [self.refCurrLocBtn setImage:[UIImage imageNamed:@"refreshLocation"] forState:UIControlStateNormal];
    [self.refCurrLocBtn addTarget:self action:@selector(refreshLocationBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [[UIApplication sharedApplication].keyWindow addSubview:self.refCurrLocBtn];
    
    
    self.serChooseView = [[GXSerChooseView alloc]initWithFrame:CGRectMake(KW(10), CGRectGetMaxY(self.refCurrLocBtn.frame) + KH(24), KScreenWidth - KW(20), KScreenHeight * 0.5 - KH(80))];
    self.serChooseView.backgroundColor = [GXGeneralHelp colorWithHexString:@"#f6f6f6" andAlpha:1.0];
    self.serChooseView.layer.cornerRadius = 5.0;
//    self.serChooseView.layer.masksToBounds = YES;
    [self.view addSubview:self.serChooseView];
    self.serChooseView.delegate = self;
    //设置投影
    self.serChooseView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.serChooseView.layer.shadowOpacity = 0.8f;
    self.serChooseView.layer.shadowRadius = 5.0f;
    self.serChooseView.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    
    
}
#pragma mark - SerBtnClickDelegate
- (void)serBtnClick
{
    GXChooseServiceVC *chooseSerVc = [[GXChooseServiceVC alloc]init];
    [self.navigationController pushViewController:chooseSerVc animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.mineVc.view.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    self.navigationController.navigationBar.hidden = NO;
    self.refCurrLocBtn.hidden = YES;
}

#pragma mark - 打开个人中心
- (void)portrairClick
{
    self.mineVc = [[GXMineViewController alloc]init];
    
    [UIView animateWithDuration:2 animations:^{
       
        [self.view addSubview:self.mineVc.view];
        
    }];
    
}

#pragma mark - 菜单按钮被点击
- (void)menuBtnClick
{
    NSLog(@"菜单按钮被点击啦");
}

/**
 获取window
 */
- (UIWindow*)mainWindow{
    
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)])
    {
        return [app.delegate window];
    }
    else
    {
        return [app keyWindow];
    }
}



#pragma mark - 刷新当前位置
- (void)refreshLocationBtnClick
{
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
    [self.locationManager setLocatingWithReGeocode:YES];
    [self.locationManager startUpdatingLocation];
    
}
#pragma mark - MAMapViewDelegate
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        static NSString *pointReuseIndetifer = @"pointReuseIndetifier";
        MAPinAnnotationView *annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifer];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndetifer];
        }
        
        annotationView.canShowCallout               = YES;
        annotationView.animatesDrop                 = YES;
        annotationView.draggable                    = YES;
        annotationView.rightCalloutAccessoryView    = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        annotationView.pinColor                     = MAPinAnnotationColorRed;
        
        return annotationView;
    }
    return nil;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.refCurrLocBtn.hidden = NO;
//    self.navigationController.navigationBar.hidden = YES;
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
    [self addAnnotationWithCooordinate:self.mapView.centerCoordinate];
    
}
-(void)addAnnotationWithCooordinate:(CLLocationCoordinate2D)coordinate
{
    MAPointAnnotation *annotation = [[MAPointAnnotation alloc] init];
    annotation.coordinate = coordinate;
    [annotation setLockedToScreen:YES];
    [annotation setLockedScreenPoint:self.mapView.center];
    [self.mapView addAnnotation:annotation];
    
}

#pragma mark - AMapLocationManagerDelegate
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode
{
    NSLog(@"location:{lat:%f; lon:%f; accuracy:%f;  %@}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy,reGeocode.formattedAddress);

    
}

#pragma mark - MAMapViewDelegate
- (void)mapView:(MAMapView *)mapView mapDidMoveByUser:(BOOL)wasUserAction
{
    [self.locationManager startUpdatingLocation];
    
    
    
    
}

- (void)mapView:(MAMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"%@",error);
}

- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    MACoordinateRegion region;
    CLLocationCoordinate2D cenCoor = mapView.region.center;
    region.center = cenCoor;
    self.coordinate2D = cenCoor;
    NSLog(@"change %.2f  %.2f",cenCoor.latitude,cenCoor.longitude);
    
    
    AMapReGeocodeSearchRequest *regeo = [[AMapReGeocodeSearchRequest alloc]init];
    regeo.location = [AMapGeoPoint locationWithLatitude:cenCoor.latitude longitude:cenCoor.longitude];
    regeo.requireExtension = YES;
    [self.searchApi AMapReGoecodeSearch:regeo];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    if (response.regeocode != nil) {
        NSLog(@"%@",response.regeocode.formattedAddress);
        
        self.serChooseView.locLabel.text = response.regeocode.formattedAddress;
        
    }
}
- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@ - %@", error, [ErrorInfoUtility errorDescriptionWithCode:error.code]);
}
@end
