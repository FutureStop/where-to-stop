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

@end

@implementation FSMusicVideoPlayerViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)playMusicVideo {
  NSString *filepath = [[NSBundle mainBundle] pathForResource:@"Radiohead - Lotus Flower" ofType:@"mp4"];
  NSURL *fileURL = [NSURL fileURLWithPath:filepath];
  MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
  moviePlayerController.repeatMode = MPMovieRepeatModeOne;
  [self.view addSubview:moviePlayerController.view];
  moviePlayerController.view.frame = self.view.bounds;
  [moviePlayerController play];
}

@end
