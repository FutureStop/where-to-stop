//
//  FSRightArtViewController.m
//  FutureStop
//
//  Created by Rene Cacheaux on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSRightArtViewController.h"

@interface FSRightArtViewController ()
@end

@implementation FSRightArtViewController

- (void)loadView {
  UIImage *artImage = [UIImage imageNamed:@"art1.jpg"];
  self.view = [[UIImageView alloc] initWithImage:artImage];
  self.view.contentMode = UIViewContentModeScaleToFill;
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
