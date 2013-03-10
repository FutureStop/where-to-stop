//
//  FSRightBackgroundViewController.m
//  FutureStop
//
//  Created by Rene Cacheaux on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSRightBackgroundViewController.h"

static NSString * const kVenueMapImageName = @"background";

@interface FSRightBackgroundViewController ()
@property(nonatomic, strong) UIImageView *backgroundImageView;
@end

@implementation FSRightBackgroundViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor blackColor];
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
	[self loadBackgroundImageView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.backgroundImageView.frame = self.view.bounds;
}

- (void)loadBackgroundImageView {
  UIImage *backgroundImage = [UIImage imageNamed:kVenueMapImageName];
  self.backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
  self.backgroundImageView.contentMode = UIViewContentModeRight;
  [self.view addSubview:self.backgroundImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
