//
//  FSAlbumViewController.m
//  FutureStop
//
//  Created by Rene Cacheaux on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSAlbumViewController.h"

static NSString * const kImageName = @"album.jpg";

@interface FSAlbumViewController ()
@property(nonatomic, strong) UIImageView *albumImageView;
@end

@implementation FSAlbumViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor redColor];
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
	[self loadAlbumView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.albumImageView.frame = self.view.bounds;
}

- (void)loadAlbumView {
  UIImage *albumImage = [UIImage imageNamed:kImageName];
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
