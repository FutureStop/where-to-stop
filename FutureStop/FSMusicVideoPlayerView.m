//
//  FSMusicVideoPlayerView.m
//  FutureStop
//
//  Created by Josh Berlin on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSMusicVideoPlayerView.h"

@interface FSMusicVideoPlayerView ()
@property(nonatomic, strong) UIImageView *radioheadBackgroundImageView;
@property(nonatomic, strong) UIImageView *radioheadLogoImageView;
@property(nonatomic, strong) UIImageView *lotusFlowerImageView;
@property(nonatomic, strong) UIImageView *retroTVImageView;
@property(nonatomic, strong) UIImageView *noiseImageView;
@property(nonatomic, strong) UIView *moviePlayerView;
@end

@implementation FSMusicVideoPlayerView

- (id)initWithMovieView:(UIView *)movieView {
  self = [super initWithFrame:CGRectZero];
  if (self) {
    _radioheadBackgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radiohead_background.jpg"]];
    [self addSubview:_radioheadBackgroundImageView];
    
    _lotusFlowerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lotus_flower.jpg"]];
    [self addSubview:_lotusFlowerImageView];
    
    _radioheadLogoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radiohead_logo_black"]];
    [self addSubview:_radioheadLogoImageView];
    
    _moviePlayerView = movieView;
    [self addSubview:movieView];
    
    _noiseImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"noise"]];
    [self addSubview:_noiseImageView];
    
    _retroTVImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"retrotv"]];
    [self addSubview:_retroTVImageView];    
  }
  return self;
}

- (void)layoutSubviews {
  self.radioheadBackgroundImageView.frame = self.bounds;
  
  const CGFloat xTVMargin = 120.0f;
  const CGFloat yTVTopMargin = 120.0f;
  const CGFloat yTVBottomMargin = 20.0f;
  
  const CGFloat xVideoLeftMargin = 150.0f;
  const CGFloat xVideoRightMargin = 500.0f;
  const CGFloat yVideoTopMargin = 50.0f;
  const CGFloat yVideoBottomMargin = 100.0f;
  
  self.radioheadLogoImageView.frame = CGRectMake(xTVMargin,
                                                 0.0f,
                                                 self.radioheadLogoImageView.frame.size.width,
                                                 self.radioheadLogoImageView.frame.size.height);
  
  self.retroTVImageView.frame = CGRectMake(xTVMargin,
                                           yTVTopMargin,
                                           self.frame.size.width - xTVMargin * 2.0f,
                                           self.frame.size.height - yTVTopMargin - yTVBottomMargin);
  self.moviePlayerView.frame =
      CGRectMake(xTVMargin + xVideoLeftMargin,
                 yTVTopMargin + yVideoTopMargin,
                 CGRectGetWidth(self.retroTVImageView.frame) - xVideoLeftMargin - xVideoRightMargin,
                 CGRectGetHeight(self.retroTVImageView.frame) - yVideoTopMargin - yVideoBottomMargin);
  self.noiseImageView.frame = CGRectInset(self.moviePlayerView.frame, -50.0f, -50.0f);
  
  const CGSize kLotusFlowerImageSize = {160.0f, 127.5f};
  self.lotusFlowerImageView.frame =
      CGRectMake(CGRectGetMaxX(self.retroTVImageView.frame) - kLotusFlowerImageSize.width - 20.0f,
                 20.0f,
                 kLotusFlowerImageSize.width,
                 kLotusFlowerImageSize.height);
}

@end
