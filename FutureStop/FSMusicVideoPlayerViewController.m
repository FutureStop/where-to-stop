//
//  FSMusicVideoViewController.m
//  FutureStop
//
//  Created by Josh Berlin on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSMusicVideoPlayerViewController.h"

#import <MediaPlayer/MediaPlayer.h>

#import "FSMusicVideoPlayerView.h"

@interface FSMusicVideoPlayerViewController ()
@property(nonatomic, strong) MPMoviePlayerController *moviePlayerController;
@property(nonatomic, strong) UIImageView *retroTVImageView;
@end

@implementation FSMusicVideoPlayerViewController

- (id)init {
  self = [super init];
  if (self) {    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"Radiohead - Lotus Flower" ofType:@"mp4"];
    NSURL *fileURL = [NSURL fileURLWithPath:filepath];
    _moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    _moviePlayerController.repeatMode = MPMovieRepeatModeOne;
    _moviePlayerController.controlStyle = MPMovieControlStyleNone;
    _moviePlayerController.scalingMode = MPMovieScalingModeAspectFill;
    [self.view addSubview:_moviePlayerController.view];
    
    _retroTVImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"retrotv"]];
    [self.view addSubview:_retroTVImageView];
  }
  return self;
}

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
  
  const CGFloat xTVMargin = 100.0f;
  const CGFloat yTVMargin = 100.0f;
  
  const CGFloat xVideoMargin = 150.0f;
  const CGFloat yVideoMargin = 50.0f;
  
  self.retroTVImageView.frame = CGRectMake(xTVMargin,
                                           yTVMargin,
                                           CGRectGetWidth(self.view.frame) - xTVMargin * 2.0f,
                                           CGRectGetHeight(self.view.frame) - yTVMargin * 2.0f);
  self.moviePlayerController.view.frame = CGRectMake(CGRectGetMinX(self.retroTVImageView.frame) + xVideoMargin,
                                                     CGRectGetMinY(self.retroTVImageView.frame) + yVideoMargin,
                                                     CGRectGetWidth(self.retroTVImageView.frame) - xVideoMargin - 500.0f,
                                                     CGRectGetHeight(self.retroTVImageView.frame) - yVideoMargin - 100.0f);
}

- (void)playMusicVideo {
  [self.moviePlayerController play];
}

@end
