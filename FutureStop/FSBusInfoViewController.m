//
//  FSBusInfoViewController.m
//  FutureStop
//
//  Created by Sam Stigler on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSBusInfoViewController.h"
#import "TTTTimeIntervalFormatter.h"
#import <QuartzCore/QuartzCore.h>

@interface FSBusInfoViewController ()

@property(nonatomic, strong) UILabel *busLineLabel;

@property(nonatomic, strong) UILabel *arrivalTimeLabel;

@property(nonatomic, strong) NSTimer *waitTimeUpdater;

@end

@implementation FSBusInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.timeOfNextBus = [NSDate dateWithTimeIntervalSinceNow:240];
        
        self.busLineLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.busLineLabel.text = @" 9 ";
        self.busLineLabel.font = [UIFont boldSystemFontOfSize:50];
        self.busLineLabel.adjustsFontSizeToFitWidth = YES;
        self.busLineLabel.textColor = [UIColor whiteColor];
        self.busLineLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.arrivalTimeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.arrivalTimeLabel.text = [self formattedWaitTimeUntilNextBus];
        self.arrivalTimeLabel.font = [UIFont boldSystemFontOfSize:50];
        self.arrivalTimeLabel.adjustsFontSizeToFitWidth = YES;
        self.arrivalTimeLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.arrivalTimeLabel.textColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    self.busLineLabel.frame = [self frameForBusLineLabel];
    self.busLineLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.busLineLabel.layer.borderWidth = 3;
    self.busLineLabel.backgroundColor = [UIColor clearColor];
    self.arrivalTimeLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.busLineLabel];
    self.arrivalTimeLabel.frame = [self frameForArrivalTimeLabel];
    [self.view addSubview:self.arrivalTimeLabel];
    
    self.waitTimeUpdater = [NSTimer scheduledTimerWithTimeInterval:1
                                                            target:self
                                                          selector:@selector(updateWaitTime)
                                                          userInfo:nil
                                                           repeats:YES];
}

- (void)updateWaitTime {
    self.arrivalTimeLabel.text = [self formattedWaitTimeUntilNextBus];
}

- (NSString *)formattedWaitTimeUntilNextBus {
    TTTTimeIntervalFormatter *formatter = [[TTTTimeIntervalFormatter alloc] init];
    formatter.usesAbbreviatedCalendarUnits = NO;
    formatter.usesIdiomaticDeicticExpressions = NO;
    formatter.futureDeicticExpression = @"";
    
    NSString *stringForTimeInterval = [formatter stringForTimeIntervalFromDate:[NSDate date]
                                                                        toDate:self.timeOfNextBus];
    return [NSString stringWithFormat:@"arrives in %@", stringForTimeInterval];
}

- (CGRect)frameForBusLineLabel {
    CGRect frame;
    frame.origin = CGPointMake(8, [self yOriginOfLabels]);
    frame.size = [@" 9 " sizeWithFont:[UIFont boldSystemFontOfSize:50]
                  constrainedToSize:CGSizeMake(CGFLOAT_MAX, 80)];
    return frame;
}

- (CGFloat)xOriginOfArrivalTimeLabel {
    CGRect frameOfBusLineLabel = [self frameForBusLineLabel];
    return frameOfBusLineLabel.size.width + 16;
}

- (CGFloat)yOriginOfLabels {
    CGSize labelSize = [@"arrives in 10 minutes" sizeWithFont:[UIFont boldSystemFontOfSize:50]
                                            constrainedToSize:CGSizeMake(CGFLOAT_MAX, 80)];
    CGFloat labelHeight = labelSize.height;
    return 40 - (labelHeight / 2);
}

- (CGRect)frameForArrivalTimeLabel {
    CGRect frame;
    frame.origin = CGPointMake([self xOriginOfArrivalTimeLabel], [self yOriginOfLabels]);
    frame.size = [@"arrives in 10 minutes" sizeWithFont:[UIFont boldSystemFontOfSize:50]
                                      constrainedToSize:CGSizeMake(CGFLOAT_MAX, 80)];
    return frame;
}

@end
