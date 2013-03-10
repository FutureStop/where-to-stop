//
//  FSTopBarViewController.m
//  FutureStop
//
//  Created by Sam Stigler on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSTopBarViewController.h"

@interface FSTopBarViewController ()

@property(nonatomic, strong) NSUInteger currentTemperatureDegreesFahrentheit;

@end

@implementation FSTopBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.busLine = @"9";
        self.currentTemperatureDegreesFahrentheit = 70;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (NSString *)localizedFormattedTime {
    return [NSDateFormatter localizedStringFromDate:[NSDate date]
                                          dateStyle:NSDateFormatterNoStyle
                                          timeStyle:NSDateFormatterShortStyle];
}

@end
