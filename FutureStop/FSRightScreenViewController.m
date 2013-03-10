//
//  FSRightScreenViewController.m
//  FutureStop
//
//  Created by Rene Cacheaux on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSRightScreenViewController.h"
#import "FSCountDownViewController.h"

@interface FSRightScreenViewController ()
@property(nonatomic, strong) FSCountDownViewController *countdownVC;
@end

@implementation FSRightScreenViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)loadCountdownView {
  self.countdownVC = [[FSCountDownViewController alloc] init];
  self.countdownVC.view.frame = CGRectMake(100.0f, 100.0f, 500.0f, 200.0f);
  [self addChildViewController:self.countdownVC];
  [self.view addSubview:self.countdownVC.view];
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
  [self loadCountdownView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
