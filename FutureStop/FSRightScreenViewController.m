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

@interface FSRightScreenViewController ()
@property(nonatomic, strong) FSCountDownViewController *countdownVC;
@property(nonatomic, strong) FSVenueMapViewController *venueMapVC;
@property(nonatomic, strong) FSAlbumViewController *albumVC;
@property(nonatomic, strong) FSRadioHeadPhotoViewController *radioheadVC;
@property(nonatomic, strong) FSTopBarViewController *topBarViewController;
@end

static const CGFloat kHeightOfTopBar = 80;

@implementation FSRightScreenViewController

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadCountdownView];
    [self loadVenueMapView];
    [self loadAlbumView];
    [self loadRadioheadView];
    [self setupTopBar];
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

- (void)loadCountdownView {
    self.countdownVC = [[FSCountDownViewController alloc] init];
    self.countdownVC.view.frame = CGRectMake(1000.0f, 100.0f, 900.0f, 200.0f);
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
