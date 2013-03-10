//
//  FSCountDownViewController.m
//  FutureStop
//
//  Created by Rene Cacheaux on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSCountDownViewController.h"

@interface FSCountDownViewController ()
@property(nonatomic, strong) UILabel *countdownLabel;
@property(nonatomic, strong) NSTimer *countdownTimer;
@property(nonatomic, assign) NSInteger minuteHand;
@property(nonatomic, assign) NSInteger secondHand;
@end

@implementation FSCountDownViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor clearColor];
  self.view.autoresizesSubviews = YES;
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
  
  [self loadCountdownTimer];
  [self loadCountdownLabel];
}

- (void)loadCountdownTimer {
  self.minuteHand = 25;
  self.secondHand = 02;
  self.countdownTimer =
      [NSTimer scheduledTimerWithTimeInterval:1
                                       target:self
                                     selector:@selector(tick:)
                                     userInfo:nil
                                      repeats:YES];
}

- (void)loadCountdownLabel {
  self.countdownLabel = [[UILabel alloc] initWithFrame:CGRectZero];
  self.countdownLabel.backgroundColor = [UIColor clearColor];
  self.countdownLabel.textColor = [UIColor whiteColor];
  self.countdownLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
  self.countdownLabel.textAlignment = NSTextAlignmentCenter;
  self.countdownLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack"
                                             size:100.0f];
  self.countdownLabel.text = @"Show In 1:25:02";
  [self.view addSubview:self.countdownLabel];
}

- (void)tick:(NSTimer *)sender {
  self.secondHand--;
  if (self.secondHand < 0) {
    self.secondHand = 59;
    self.minuteHand--;
  }
  NSString *countdownString = [NSString stringWithFormat:@"Show In 1:%02d:%02d",
                               self.minuteHand,
                               self.secondHand];
  self.countdownLabel.text = countdownString;
}

- (void)dealloc {
  [self.countdownTimer invalidate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
