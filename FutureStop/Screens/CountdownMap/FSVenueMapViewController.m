//
//  FSVenueMapViewController.m
//  FutureStop
//
//  Created by Rene Cacheaux on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSVenueMapViewController.h"

static NSString * const kImageName = @"venue";

@interface FSVenueMapViewController ()
@property(nonatomic, strong) UIImageView *venueMapImageView;
@end

@implementation FSVenueMapViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor redColor];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.clipsToBounds = YES;
	[self loadVenueMap];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.venueMapImageView.frame = self.view.bounds;
}

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
//  [self.venueMapImageView sizeToFit];
}

- (void)loadVenueMap {
  UIImage *venueImage = [UIImage imageNamed:kImageName];
  self.venueMapImageView = [[UIImageView alloc] initWithImage:venueImage];
  self.venueMapImageView.contentMode = UIViewContentModeScaleAspectFit;
  [self.view addSubview:self.venueMapImageView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
