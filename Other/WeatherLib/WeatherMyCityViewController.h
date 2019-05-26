//
//  WeatherMyCityViewController.h
//  OrgaNicer
//
//  Created by  on 2019/5/25.
//  Copyright © 2019 Alexander Schulz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <SmileWeather/SmileWeatherDemoVC.h>
#import <SmileWeather/SmileWeatherDownLoader.h>
NS_ASSUME_NONNULL_BEGIN

@interface WeatherMyCityViewController : UIViewController
@property (nonatomic,strong) CLLocation *loaction;
@property (nonatomic,assign) double lat;
@property (nonatomic,assign) double lng;
@end

NS_ASSUME_NONNULL_END
