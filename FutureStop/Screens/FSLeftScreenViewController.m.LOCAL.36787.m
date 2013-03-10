//
//  FSLeftScreenViewController.m
//  FutureStop
//
//  Created by Rene Cacheaux on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSLeftScreenViewController.h"

#import "FSMusicVideoPlayerViewController.h"

@interface FSLeftScreenViewController ()

@end

@implementation FSLeftScreenViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  [self addMusicVideoPlayerController];
}

- (void)addMusicVideoPlayerController {
  FSMusicVideoPlayerViewController *videoPlayerController = [[FSMusicVideoPlayerViewController alloc] init];
  [self addChildViewController:videoPlayerController];
  [self.view addSubview:videoPlayerController.view];
  [videoPlayerController didMoveToParentViewController:videoPlayerController];
  videoPlayerController.view.frame = self.view.frame;
  [videoPlayerController playMusicVideo];
}

@end
