//
//  FSAlbumViewController.m
//  FutureStop
//
//  Created by Rene Cacheaux on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//
// Degrees to radians
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

#import "FSAlbumViewController.h"

#import <QuartzCore/QuartzCore.h>

static NSString * const kVenueMapImageName = @"album.jpg";

@interface FSAlbumViewController ()
@property(nonatomic, strong) UIImageView *albumImageView;
@end

@implementation FSAlbumViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor clearColor];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  CATransform3D perspective = CATransform3DIdentity;
  perspective.m34 = -1/800.0f;
  self.view.layer.sublayerTransform = perspective;
  
	[self loadAlbumView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.albumImageView.frame = self.view.bounds;
  
  FSAlbumViewController __weak *weakSelf = self;
  [CATransaction setCompletionBlock:^{
    CATransform3D rotationTransform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(20), 0.0, 1.0f, 0.0);
    CATransform3D toRotationTransform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(-20), 0.0, 1.0f, 0.0);
    CABasicAnimation *albumAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    albumAnimation.fromValue = [NSValue valueWithCATransform3D:rotationTransform];
    albumAnimation.toValue = [NSValue valueWithCATransform3D:toRotationTransform];
    albumAnimation.duration = 10;
    albumAnimation.repeatCount = 10000000;
    albumAnimation.autoreverses = YES;
    
    [weakSelf.albumImageView.layer addAnimation:albumAnimation forKey:@""];
    
  }];
  
  
  CATransform3D rotationTransform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(20), 0.0, 1.0f, 0.0);
  CABasicAnimation *albumAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
  albumAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
  albumAnimation.toValue = [NSValue valueWithCATransform3D:rotationTransform];
  albumAnimation.duration = 10;
  
  [self.albumImageView.layer addAnimation:albumAnimation forKey:@""];
  self.albumImageView.layer.transform = rotationTransform;
  
  
}

- (void)loadAlbumView {
  UIImage *albumImage = [UIImage imageNamed:kVenueMapImageName];
  self.albumImageView = [[UIImageView alloc] initWithImage:albumImage];
  self.albumImageView.contentMode = UIViewContentModeScaleAspectFit;
  [self.view addSubview:self.albumImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
