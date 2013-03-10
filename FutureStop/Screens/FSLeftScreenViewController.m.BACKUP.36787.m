//
//  FSLeftScreenViewController.m
//  FutureStop
//
//  Created by Rene Cacheaux on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSLeftScreenViewController.h"
#import "FSCountDownViewController.h"

#import "FSMusicVideoPlayerViewController.h"

@interface FSLeftScreenViewController ()
@property(nonatomic, strong) FSCountDownViewController *countdownVC;
@end

@implementation FSLeftScreenViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor lightGrayColor];
}

<<<<<<< HEAD
- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  [self addMusicVideoPlayerController];
}

- (void)addMusicVideoPlayerController {
  FSMusicVideoPlayerViewController *videoPlayerController = [[FSMusicVideoPlayerViewController alloc] init];
  [self addChildViewController:videoPlayerController];
  [self.view addSubview:videoPlayerController.view];
  [videoPlayerController didMoveToParentViewController:videoPlayerController];
  videoPlayerController.view.frame = self.view.frame;
  [videoPlayerController playMusicVideo];
=======
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
  [self loadCountdownView];
	// Do any additional setup after loading the view.
}

- (void)loadCountdownView {
  self.countdownVC = [[FSCountDownViewController alloc] init];
  self.countdownVC.view.frame = CGRectMake(100.0f, 100.0f, 500.0f, 200.0f);
  [self addChildViewController:self.countdownVC];
  [self.view addSubview:self.countdownVC.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
>>>>>>> rene-countdownMapAlbumArt
}

@end
