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

// 1920x1020 is not really the right size for the content. Shift all content by these values.
static const CGFloat kHorizontalOffset = 110.0f;
static const CGFloat kVerticalOffset = 50.0f;

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
  videoPlayerController.view.frame = CGRectMake(-kHorizontalOffset,
                                                kButterBarHeight - kVerticalOffset,
                                                1920.0f + kHorizontalOffset * 2.0f,
                                                1080.0f - kButterBarHeight + kVerticalOffset * 2.0f);
  [self addChildViewController:videoPlayerController];
  [videoPlayerController didMoveToParentViewController:videoPlayerController];
  [self.view addSubview:videoPlayerController.view];
  [videoPlayerController playMusicVideo];
}

@end
