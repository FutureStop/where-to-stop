//
//  FSDateTimeViewController.m
//  FutureStop
//
//  Created by Sam Stigler on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSDateTimeViewController.h"

@interface FSDateTimeViewController ()

@property(nonatomic, strong) UILabel *label;

@property(nonatomic, strong) NSTimer *updater;

@end

@implementation FSDateTimeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectZero];
        self.label.font = [UIFont boldSystemFontOfSize:50];
        self.label.adjustsFontSizeToFitWidth = YES;
        self.label.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.view setOpaque:NO];
    [self.view addSubview:self.label];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.label.frame = self.view.bounds;
    [self updateTimeLabel];
    self.updater = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:30]
                                            interval:30
                                              target:self
                                            selector:@selector(updateTimeLabel)
                                            userInfo:nil
                                             repeats:YES];
}

+ (CGFloat)optimalWidth {
    CGSize textSize = [[self localizedFormattedTime] sizeWithFont:[UIFont boldSystemFontOfSize:50]
                                                constrainedToSize:CGSizeMake(CGFLOAT_MAX, 80)];
    return textSize.width;
}

+ (NSString *)localizedFormattedTime {
    return [NSDateFormatter localizedStringFromDate:[NSDate date]
                                          dateStyle:NSDateFormatterNoStyle
                                          timeStyle:NSDateFormatterShortStyle];
}

- (void)updateTimeLabel {
    self.label.text = [FSDateTimeViewController localizedFormattedTime];
}

@end
