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
  self.retroTVImageView.frame = self.view.bounds;
  self.moviePlayerController.view.frame = CGRectMake(50, 0, 950, 680);
}

- (void)playMusicVideo {
  [self.moviePlayerController play];
}

@end
