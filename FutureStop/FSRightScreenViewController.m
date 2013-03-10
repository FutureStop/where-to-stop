//
//  FSRightScreenViewController.m
//  FutureStop
//
//  Created by Rene Cacheaux on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSRightScreenViewController.h"
#import "FSCountDownViewController.h"
#import "FSVenueMapViewController.h"
#import "FSAlbumViewController.h"
#import "FSRadioHeadPhotoViewController.h"
#import "FSRightBackgroundViewController.h"

@interface FSRightScreenViewController ()
@property(nonatomic, strong) FSCountDownViewController *countdownVC;
@property(nonatomic, strong) FSVenueMapViewController *venueMapVC;
@property(nonatomic, strong) FSAlbumViewController *albumVC;
@property(nonatomic, strong) FSRadioHeadPhotoViewController *radioheadVC;
@property(nonatomic, strong) FSRightBackgroundViewController *backgroundVC;
@end

@implementation FSRightScreenViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadBackgroundView];
  [self loadCountdownView];
  [self loadVenueMapView];
  [self loadAlbumView];
  [self loadRadioheadView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
}

- (void)loadBackgroundView {
  self.backgroundVC = [[FSRightBackgroundViewController alloc] init];
  self.backgroundVC.view.frame =
    CGRectOffset(CGRectMake(0.0f, 0.0f, 1920.0f, 1080.0f), 40.0f, 80.0f);
  [self addChildViewController:self.backgroundVC];
  [self.view addSubview:self.backgroundVC.view];
}

- (void)loadCountdownView {
  self.countdownVC = [[FSCountDownViewController alloc] init];
  self.countdownVC.view.frame = CGRectMake(1000.0f, 90.0f, 900.0f, 200.0f);
  [self addChildViewController:self.countdownVC];
  [self.view addSubview:self.countdownVC.view];
}

- (void)loadVenueMapView {
  self.venueMapVC = [[FSVenueMapViewController alloc] init];
  self.venueMapVC.view.frame = CGRectMake(1100.0f, 250.0f, 700.0f, 600.0);
  [self addChildViewController:self.venueMapVC];
  [self.view addSubview:self.venueMapVC.view];
}

- (void)loadAlbumView {
  self.albumVC = [[FSAlbumViewController alloc] init];
  self.albumVC.view.frame = CGRectMake(100.0f, 100.0f, 900.0f, 900.0);
  [self addChildViewController:self.albumVC];
  [self.view addSubview:self.albumVC.view];
}

- (void)loadRadioheadView {
  self.radioheadVC = [[FSRadioHeadPhotoViewController alloc] init];
  self.radioheadVC.view.frame = CGRectMake(0.0, 900.0f, 1920.0f, 320.0f);
  [self addChildViewController:self.radioheadVC];
  [self.view addSubview:self.radioheadVC.view];
}

@end
