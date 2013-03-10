//
//  FSLeftScreenViewController.m
//  FutureStop
//
//  Created by Rene Cacheaux on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSLeftScreenViewController.h"
#import "FSMusicVideoPlayerViewController.h"

static const CGFloat kButterBarHeight = 80.0f;

@interface FSLeftScreenViewController ()

@end

@implementation FSLeftScreenViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self addMusicVideoPlayerController];
}

- (void)addMusicVideoPlayerController {
  FSMusicVideoPlayerViewController *videoPlayerController = [[FSMusicVideoPlayerViewController alloc] init];
  videoPlayerController.view.frame = CGRectMake(0,
                                                kButterBarHeight,
                                                1920.0f,
                                                1080.0f - kButterBarHeight);
  [self addChildViewController:videoPlayerController];
  [videoPlayerController didMoveToParentViewController:videoPlayerController];
  [self.view addSubview:videoPlayerController.view];
  [videoPlayerController playMusicVideo];
}

@end
