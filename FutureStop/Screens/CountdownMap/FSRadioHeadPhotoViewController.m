//
//  FSRadioHeadPhotoViewController.m
//  FutureStop
//
//  Created by Rene Cacheaux on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSRadioHeadPhotoViewController.h"

static NSString * const kImageName = @"radiohead";

@interface FSRadioHeadPhotoViewController ()
@property(nonatomic, strong) UIImageView *radioheadImageView;
@end

@implementation FSRadioHeadPhotoViewController


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
  [self loadRadioheadView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.radioheadImageView.frame = self.view.bounds;
}

- (void)loadRadioheadView {
  UIImage *radioheadImage = [UIImage imageNamed:kImageName];
  self.radioheadImageView = [[UIImageView alloc] initWithImage:radioheadImage];
  self.radioheadImageView.contentMode = UIViewContentModeScaleAspectFit;
  [self.view addSubview:self.radioheadImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
