//
//  FSLeftScreenViewController.m
//  FutureStop
//
//  Created by Rene Cacheaux on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSLeftScreenViewController.h"
#import "FSTopBarViewController.h"
#import "FSMusicVideoPlayerViewController.h"
#import "FSLeftArtViewController.h"

static const CGFloat kButterBarHeight = 80.0f;

// 1920x1020 is not really the right size for the content. Shift all content by these values.
static const CGFloat kHorizontalOffset = 110.0f;
static const CGFloat kVerticalOffset = 50.0f;

@interface FSLeftScreenViewController ()

@property(nonatomic, strong) FSTopBarViewController *topBarViewController;
@property(nonatomic, strong) FSLeftArtViewController *artVC;
@property(nonatomic, strong) FSMusicVideoPlayerViewController *videoPlayerController;
@end

@implementation FSLeftScreenViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor lightGrayColor];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self loadArt];
  FSLeftScreenViewController __weak *weakSelf = self;
	double delayInSeconds = 4.0;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    [weakSelf loadRadiohead];
    self.topBarViewController.view.alpha = 0.0f;
    self.videoPlayerController.view.alpha = 0.0f;
    [UIView animateWithDuration:0.3 animations:^{
      self.topBarViewController.view.alpha = 1.0f;
      self.videoPlayerController.view.alpha = 1.0f;
    }];
  });
}

- (void)loadRadiohead {
  [self setupTopBar];
  [self addMusicVideoPlayerController];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.topBarViewController.view.frame = CGRectMake(-kHorizontalOffset,
                                                      -kVerticalOffset,
                                                      1920.0f + kHorizontalOffset * 2.0f,
                                                      kButterBarHeight);
}

- (void)setupTopBar {
    self.topBarViewController = [[FSTopBarViewController alloc] initWithNibName:nil bundle:nil];
    [self addChildViewController:self.topBarViewController];
    [self.view addSubview:self.topBarViewController.view];
}

- (void)addMusicVideoPlayerController {
  self.videoPlayerController = [[FSMusicVideoPlayerViewController alloc] init];
  self.videoPlayerController.view.frame = CGRectMake(-kHorizontalOffset,
                                                kButterBarHeight - kVerticalOffset,
                                                1920.0f + kHorizontalOffset * 2.0f,
                                                1080.0f - kButterBarHeight + kVerticalOffset * 2.0f);
  [self addChildViewController:self.videoPlayerController];
  [self.videoPlayerController didMoveToParentViewController:self.videoPlayerController];
  [self.view addSubview:self.videoPlayerController.view];
  [self.videoPlayerController playMusicVideo];
}

- (void)loadArt {
  self.artVC = [[FSLeftArtViewController alloc] init];
  self.artVC.view.frame = CGRectMake(0.0f, 0.0f, 1920.0f, 1080.0f);
  [self addChildViewController:self.artVC];
  [self.view addSubview:self.artVC.view];
}

@end
