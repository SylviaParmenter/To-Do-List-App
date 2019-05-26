//
//  WeatherMyCityViewController.m
//  OrgaNicer
//
//  Created by  on 2019/5/25.
//  Copyright © 2019 Alexander Schulz. All rights reserved.
//

#import "WeatherMyCityViewController.h"

@interface WeatherMyCityViewController ()
{
    UIButton *_btn;
}
@property (nonatomic,strong) SmileWeatherDownLoader *loader;
@property (nonatomic,strong) UIView * BackView;
@property (nonatomic,strong) UIImageView *BackgroundImage;
@end

@implementation WeatherMyCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.BackgroundImage = [[UIImageView alloc]initWithFrame:self.view.bounds];
    self.BackgroundImage.backgroundColor = [UIColor whiteColor];
    [self.BackgroundImage setContentScaleFactor:[[UIScreen mainScreen] scale]];
    self.BackgroundImage.contentMode =  UIViewContentModeScaleAspectFill;
    self.BackgroundImage.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.BackgroundImage.clipsToBounds  = YES;
    [self.view addSubview:self.BackgroundImage];
    self.BackgroundImage.image = [UIImage imageNamed:@"HomeBack"];
    //    [self searchFlickrPhotos];
    self.BackView = [[UIView alloc]initWithFrame:CGRectMake(0, 44, self.view.bounds.size.width, self.view.bounds.size.height/4*3)];
    self.BackView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.BackView];
    self.BackView.userInteractionEnabled = NO;
    SmileWeatherDemoVC *WeatherVc = [SmileWeatherDemoVC DemoVCToView:self.BackView];
    [[SmileWeatherDownLoader sharedDownloader]getWeatherDataFromLocation:self.loaction completion:^(SmileWeatherData * _Nullable data, NSError * _Nullable error) {
        [WeatherVc setData:data];
        
        
    }];
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btn setFrame:CGRectMake(0, self.view.bounds.size.height-50, 120, 50)];
    [_btn setTitle:@"To-Do List" forState:UIControlStateNormal];
    _btn.titleLabel.font = [UIFont systemFontOfSize:21];
    [_btn addTarget:self action:@selector(BackAddView) forControlEvents:UIControlEventTouchUpInside];
    [_btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:_btn];
    // Do any additional setup after loading the view.
}
-(void)BackAddView
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
