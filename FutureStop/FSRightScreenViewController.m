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
#import "FSTopBarViewController.h"
#import "FSRightBackgroundViewController.h"
#import "FSRightArtViewController.h"

@interface FSRightScreenViewController ()
@property(nonatomic, strong) FSCountDownViewController *countdownVC;
@property(nonatomic, strong) FSVenueMapViewController *venueMapVC;
@property(nonatomic, strong) FSAlbumViewController *albumVC;
@property(nonatomic, strong) FSRadioHeadPhotoViewController *radioheadVC;
@property(nonatomic, strong) FSTopBarViewController *topBarViewController;
@property(nonatomic, strong) FSRightBackgroundViewController *backgroundVC;
@property(nonatomic, strong) FSRightArtViewController *artVC;
@end

static const CGFloat kHeightOfTopBar = 80;

@implementation FSRightScreenViewController

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self loadArt];

  [self setupTopBar];
  self.topBarViewController.view.alpha = 0.0f;
  
//  FSRightScreenViewController __weak *weakSelf = self;
//	double delayInSeconds = 4.0;
//  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//    [weakSelf loadRadiohead];
//      });
}

- (void)loadRadiohead {
  [self loadBackgroundView];
  [self loadCountdownView];
  [self loadVenueMapView];
  [self loadAlbumView];
  [self loadRadioheadView];
  
  [self.topBarViewController.view removeFromSuperview];
  [self.view addSubview:self.topBarViewController.view];
  
  self.topBarViewController.view.alpha = 0.0f;
  self.backgroundVC.view.alpha = 0.0f;
  self.countdownVC.view.alpha = 0.0f;
  self.venueMapVC.view.alpha = 0.0f;
  self.albumVC.view.alpha = 0.0f;
  self.radioheadVC.view.alpha = 0.0f;
  [UIView animateWithDuration:0.6 animations:^{
    self.topBarViewController.view.alpha = 1.0f;
    self.backgroundVC.view.alpha = 1.0f;
    self.countdownVC.view.alpha = 1.0f;
    self.venueMapVC.view.alpha = 1.0f;
    self.albumVC.view.alpha = 1.0f;
    self.radioheadVC.view.alpha = 1.0f;
  }];

  
//  FSRightScreenViewController __weak *weakSelf = self;
//  double delayInSeconds = 4.0;
//  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//    [weakSelf unloadRadiohead];
//  });
}


- (void)unloadRadiohead {
  self.topBarViewController.view.alpha = 0.0f;
  
  [UIView animateWithDuration:0.6 animations:^{
    self.topBarViewController.view.alpha = 0.0f;
    self.backgroundVC.view.alpha = 0.0f;
    self.countdownVC.view.alpha = 0.0f;
    self.venueMapVC.view.alpha = 0.0f;
    self.albumVC.view.alpha = 0.0f;
    self.radioheadVC.view.alpha = 0.0f;
  
  } completion:^(BOOL completion){
    [self.backgroundVC.view removeFromSuperview];
    [self.backgroundVC removeFromParentViewController];
    self.backgroundVC = nil;
    
    [self.countdownVC.view removeFromSuperview];
    [self.countdownVC removeFromParentViewController];
    self.countdownVC = nil;
    
    [self.venueMapVC.view removeFromSuperview];
    [self.venueMapVC removeFromParentViewController];
    self.venueMapVC = nil;
    
    [self.albumVC.view removeFromSuperview];
    [self.albumVC removeFromParentViewController];
    self.albumVC = nil;
    
    [self.radioheadVC.view removeFromSuperview];
    [self.radioheadVC removeFromParentViewController];
    self.radioheadVC = nil;
  
  }];
}

- (void)loadArt {
  self.artVC = [[FSRightArtViewController alloc] init];
  self.artVC.view.frame = CGRectMake(0.0f, 0.0f, 1920.0f, 1080.0f);
  [self addChildViewController:self.artVC];
  [self.view addSubview:self.artVC.view];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.topBarViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, kHeightOfTopBar);
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
  self.backgroundVC.view.frame = CGRectMake(0.0f, 0.0f, 1920.0f, 1080.0f);
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
    self.radioheadVC.view.frame = CGRectMake(0.0, 700.0f, 1920.0f, 320.0f);
    [self addChildViewController:self.radioheadVC];
    [self.view addSubview:self.radioheadVC.view];
}

- (void)setupTopBar {
    self.topBarViewController = [[FSTopBarViewController alloc] initWithNibName:nil bundle:nil];
    [self addChildViewController:self.topBarViewController];
    [self.view addSubview:self.topBarViewController.view];
}

@end
