//
//  FSTopBarViewController.m
//  FutureStop
//
//  Created by Sam Stigler on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSTopBarViewController.h"
#import "FSBusInfoViewController.h"
#import "FSDateTimeViewController.h"
#import "FSWeatherViewController.h"

@interface FSTopBarViewController ()

@property(nonatomic, strong) UIImageView *backgroundImageView;
@property(nonatomic, strong) FSDateTimeViewController *dateTimeViewController;
@property(nonatomic, strong) FSWeatherViewController *weatherViewController;
@property(nonatomic, strong) FSBusInfoViewController *busInfoViewController;

@end

@implementation FSTopBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.busLine = @"9";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupBusInfoViewController];
    [self setupDateTimeViewController];
    [self setupWeatherViewController];
  
  self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"trafficbackground"]];
  [self.view addSubview:self.backgroundImageView];
  [self.view sendSubviewToBack:self.backgroundImageView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self positionDateTimeView];
    [self positionWeatherViewController];
    [self positionBusInfoView];
}

- (void)setupBusInfoViewController {
    self.busInfoViewController = [[FSBusInfoViewController alloc] initWithNibName:nil bundle:nil];
    [self addChildViewController:self.busInfoViewController];
    [self.view addSubview:self.busInfoViewController.view];
}

- (void)setupDateTimeViewController {
    self.dateTimeViewController = [[FSDateTimeViewController alloc] initWithNibName:nil bundle:nil];
    [self addChildViewController:self.dateTimeViewController];
    [self.view addSubview:self.dateTimeViewController.view];
}

- (void)setupWeatherViewController {
    self.weatherViewController = [[FSWeatherViewController alloc] initWithNibName:nil bundle:nil];
    [self addChildViewController:self.weatherViewController];
    [self.view addSubview:self.weatherViewController.view];
}

- (CGFloat)xOriginOfDateTimeView {
    return ((self.view.bounds.size.width / 2) - ([FSDateTimeViewController optimalWidth] / 2));
}

- (void)positionBusInfoView {
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = CGSizeMake(600, 80);
    self.busInfoViewController.view.frame = frame;
}

- (void)positionDateTimeView {
    CGRect frame;
    frame.origin = CGPointMake([self xOriginOfDateTimeView], 0);
    frame.size = CGSizeMake([FSDateTimeViewController optimalWidth], 80);
    self.dateTimeViewController.view.frame = frame;
}

- (void)positionWeatherViewController {
    CGRect frame;
    frame.origin = CGPointMake(self.view.bounds.size.width-400, 0);
    frame.size = CGSizeMake(400, 80);
    self.weatherViewController.view.frame = frame;
}

@end
