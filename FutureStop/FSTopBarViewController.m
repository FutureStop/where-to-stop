//
//  FSTopBarViewController.m
//  FutureStop
//
//  Created by Sam Stigler on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSTopBarViewController.h"
#import "FSDateTimeViewController.h"
#import "FSWeatherViewController.h"
#import "TTTTimeIntervalFormatter.h"

@interface FSTopBarViewController ()

@property(nonatomic, strong) FSDateTimeViewController *dateTimeViewController;
@property(nonatomic, strong) FSWeatherViewController *weatherViewController;

@end

@implementation FSTopBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.busLine = @"9";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupDateTimeViewController];
    [self setupWeatherViewController];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self positionDateTimeView];
    [self positionWeatherViewController];
}

- (void)setupDateTimeViewController {
    self.dateTimeViewController = [[FSDateTimeViewController alloc] initWithNibName:nil bundle:nil];
    [self addChildViewController:self.dateTimeViewController];
    [self.view addSubview:self.dateTimeViewController.view];
}

- (void)setupWeatherViewController {
    self.weatherViewController = [[FSWeatherViewController alloc] initWithNibName:nil bundle:nil];
    [self addChildViewController:self.weatherViewController];
    [self.view addSubview:self.weatherViewController.view];
}

- (CGFloat)xOriginOfDateTimeView {
    return ((self.view.bounds.size.width / 2) - ([FSDateTimeViewController optimalWidth] / 2));
}

- (void)positionDateTimeView {
    CGRect frame;
    frame.origin = CGPointMake([self xOriginOfDateTimeView], 0);
    frame.size = CGSizeMake([FSDateTimeViewController optimalWidth], 80);
    self.dateTimeViewController.view.frame = frame;
}

- (void)positionWeatherViewController {
    CGRect frame;
    frame.origin = CGPointMake(self.view.bounds.size.width-400, 0);
    frame.size = CGSizeMake(400, 80);
    self.weatherViewController.view.frame = frame;
}

- (NSTimeInterval)secondsUntilNextBus {
    // TODO: Make this count down!
    return 524;
}

- (NSString *)formattedWaitTimeUntilNextBus {
    NSTimeInterval seconds = [self secondsUntilNextBus];
    TTTTimeIntervalFormatter *formatter = [[TTTTimeIntervalFormatter alloc] init];
    formatter.usesAbbreviatedCalendarUnits = YES;
    return [formatter stringForTimeInterval:seconds];
}

@end
