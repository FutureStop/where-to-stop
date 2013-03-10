//
//  FSVenueMapViewController.m
//  FutureStop
//
//  Created by Rene Cacheaux on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSVenueMapViewController.h"

static NSString * const kVenueMapImageName = @"venue";
static NSString * const kShirt1ImageName = @"shirt1";
static NSString * const kShirt2ImageName = @"shirt2";
static NSString * const kPosterImageName = @"poster.jpg";

@interface FSVenueMapViewController ()
@property(nonatomic, strong) UIImageView *venueMapImageView;
@property(nonatomic, strong) UIImageView *shirt1ImageView;
@property(nonatomic, strong) UIImageView *shirt2ImageView;
@property(nonatomic, strong) UIImageView *posterImageView;
@property(nonatomic, strong) NSArray *images;
@property(nonatomic, assign) NSUInteger currentImageIndex;
@end

@implementation FSVenueMapViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.clipsToBounds = NO;
  self.currentImageIndex = 0;
	[self loadVenueMap];
  [self loadShirt1];
  [self loadShirt2];
  [self loadPoster];
  self.images = @[self.venueMapImageView,
                  self.shirt1ImageView,
                  self.posterImageView,
                  self.shirt2ImageView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  UIView *currentView = self.images[self.currentImageIndex];
  currentView.frame = CGRectOffset(self.view.bounds, 1200.0f, 0.0f);
  
  FSVenueMapViewController __weak *weakSelf = self;
  [UIView animateWithDuration:2
                        delay:0
                      options:UIViewAnimationOptionCurveEaseInOut
                   animations:^{
                     [weakSelf.view addSubview:currentView];
                     currentView.frame = weakSelf.view.bounds;
                   } completion:^(BOOL completed){
                     [weakSelf animateNextThing];
                   }];
  
}

- (void)animateNextThing {
  UIView *previousView = self.images[self.currentImageIndex];
  
  self.currentImageIndex++;
  if (self.currentImageIndex >= [self.images count]) {
    self.currentImageIndex = 0;
  }
  UIView *currentView = self.images[self.currentImageIndex];
  currentView.frame = CGRectOffset(self.view.bounds, 1200.0f, 0.0f);
  
  FSVenueMapViewController __weak *weakSelf = self;
  [UIView animateWithDuration:2
                        delay:5
                      options:UIViewAnimationOptionCurveEaseInOut
                   animations:^{
                     [weakSelf.view addSubview:currentView];
                     currentView.frame = weakSelf.view.bounds;
                     previousView.frame = CGRectOffset(previousView.frame, 0.0f, 1000.0f);
                   } completion:^(BOOL completed){
                     [previousView removeFromSuperview];
                     [weakSelf animateNextThing];
                   }];
}

- (void)loadVenueMap {
  UIImage *venueImage = [UIImage imageNamed:kVenueMapImageName];
  self.venueMapImageView = [[UIImageView alloc] initWithImage:venueImage];
  self.venueMapImageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)loadShirt1 {
  UIImage *shirtImage = [UIImage imageNamed:kShirt1ImageName];
  self.shirt1ImageView = [[UIImageView alloc] initWithImage:shirtImage];
  self.shirt1ImageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)loadShirt2 {
  UIImage *shirtImage = [UIImage imageNamed:kShirt2ImageName];
  self.shirt2ImageView = [[UIImageView alloc] initWithImage:shirtImage];
  self.shirt2ImageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)loadPoster {
  UIImage *posterImage = [UIImage imageNamed:kPosterImageName];
  self.posterImageView = [[UIImageView alloc] initWithImage:posterImage];
  self.shirt2ImageView.contentMode = UIViewContentModeScaleToFill;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
