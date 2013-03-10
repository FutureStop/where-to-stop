//
//  FSLeftScreenViewController.m
//  FutureStop
//
//  Created by Rene Cacheaux on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSLeftScreenViewController.h"
#import "FSTopBarViewController.h"
#import "FSMusicVideoPlayerViewController.h"

static const CGFloat kButterBarHeight = 80.0f;

@interface FSLeftScreenViewController ()

@property(nonatomic, strong) FSTopBarViewController *topBarViewController;

@end

static const CGFloat kHeightOfTopBar = 80;

@implementation FSLeftScreenViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor lightGrayColor];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setupTopBar];
    [self addMusicVideoPlayerController];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.topBarViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, kHeightOfTopBar);
}

- (void)setupTopBar {
    self.topBarViewController = [[FSTopBarViewController alloc] initWithNibName:nil bundle:nil];
    [self addChildViewController:self.topBarViewController];
    [self.view addSubview:self.topBarViewController.view];
}

- (void)addMusicVideoPlayerController {
  FSMusicVideoPlayerViewController *videoPlayerController = [[FSMusicVideoPlayerViewController alloc] init];
  videoPlayerController.view.frame = CGRectMake(0,
                                                kButterBarHeight,
                                                1920.0f,
                                                1080.0f - kButterBarHeight);
  [self addChildViewController:videoPlayerController];
  [videoPlayerController didMoveToParentViewController:videoPlayerController];
  [self.view addSubview:videoPlayerController.view];
  [videoPlayerController playMusicVideo];
}

@end
