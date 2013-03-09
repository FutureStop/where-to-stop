//
//  FSViewController.m
//  FutureStop
//
//  Created by Chris Gibbs on 3/8/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSViewController.h"
#import "FSTopBarViewController.h"

@interface FSViewController ()

@property(nonatomic, strong) FSTopBarViewController *topBarViewController;

@end

@implementation FSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setupTopBar];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.view addSubview:self.topBarViewController.view];
}

- (void)setupTopBar {
    self.topBarViewController = [[FSTopBarViewController alloc] initWithNibName:nil bundle:nil];
    CGSize applicationFrameSize = [[UIScreen mainScreen] applicationFrame].size;
    self.topBarViewController.view.frame = CGRectMake(0, 0, applicationFrameSize.width, 80);
    self.topBarViewController.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:self.topBarViewController];
}

@end
