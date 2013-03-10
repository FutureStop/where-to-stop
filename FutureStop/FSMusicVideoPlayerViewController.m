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
  }
  return self;
}

- (void)loadView {
  self.view = [[FSMusicVideoPlayerView alloc] initWithMovieView:self.moviePlayerController.view];
  self.view.backgroundColor = [UIColor whiteColor];
}

- (void)playMusicVideo {
  [self.moviePlayerController play];
}

@end
