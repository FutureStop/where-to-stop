//
//  FSWeatherViewController.m
//  FutureStop
//
//  Created by Sam Stigler on 3/9/13.
//  Copyright (c) 2013 Mutual Mobile SXSW Creatathon. All rights reserved.
//

#import "FSWeatherViewController.h"

@interface FSWeatherViewController ()

@property(nonatomic) NSUInteger currentTemperatureDegreesFahrenheit;
@property(nonatomic, strong) UILabel *currentTemperatureLabel;

@property(nonatomic) FSWeatherCondition currentWeatherCondition;
@property(nonatomic, strong) UIImageView *currentWeatherImageView;

@end

const CGFloat kSpacingBetweenTemperatureLabelAndImageView = 8;
const CGFloat kSpacingBetweenImageViewAndRightSideOfScreen = 8;
const CGFloat kWidthOfImageView = 64;

@implementation FSWeatherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.currentTemperatureDegreesFahrenheit = 70;
        self.currentWeatherCondition = FSWeatherConditionSunny;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.currentWeatherImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.currentTemperatureLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.currentTemperatureLabel.opaque = NO;
    self.currentTemperatureLabel.font = [UIFont boldSystemFontOfSize:50];
    self.currentTemperatureLabel.adjustsFontSizeToFitWidth = YES;
    self.currentTemperatureLabel.lineBreakMode = NSLineBreakByTruncatingTail;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.currentWeatherCondition = FSWeatherConditionSunny;
    self.currentWeatherImageView.frame = [self frameForImageView];
    [self.view addSubview:self.currentWeatherImageView];
    self.currentTemperatureLabel.frame = [self frameForTemperatureLabel];
    self.currentTemperatureLabel.text = [self formattedTemperatureString];
    self.currentTemperatureLabel.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:self.currentTemperatureLabel];
}

- (NSString *)formattedTemperatureString {
    return [FSWeatherViewController formattedTemperatureStringForDegreesF:self.currentTemperatureDegreesFahrenheit];
}

+ (NSString *)formattedTemperatureStringForDegreesF:(NSUInteger)degrees {
    return [NSString stringWithFormat:@"%d° F", degrees];
}

- (void)setCurrentWeatherCondition:(FSWeatherCondition)currentWeatherCondition {
    _currentWeatherCondition = currentWeatherCondition;
    
    // TODO: Change this to be dynamic based on the weather condition!
    [self.currentWeatherImageView setImage:[UIImage imageNamed:@"sunny"]];
}

- (void)setCurrentTemperatureDegreesFahrenheit:(NSUInteger)currentTemperatureDegreesFahrenheit {
    _currentTemperatureDegreesFahrenheit = currentTemperatureDegreesFahrenheit;
    
    self.currentTemperatureLabel.text = [self formattedTemperatureString];
    self.currentTemperatureLabel.textAlignment = NSTextAlignmentRight;
}

+ (CGFloat)maximumWidthOfTemperatureString {
    CGSize size = [[self formattedTemperatureStringForDegreesF:150]
                   sizeWithFont:[UIFont systemFontOfSize:50]
                   constrainedToSize:CGSizeMake(CGFLOAT_MAX, 80)];
    return size.width;
}

- (CGFloat)xOriginOfTemperatureString {
    return 400 - kWidthOfImageView - kSpacingBetweenTemperatureLabelAndImageView - [FSWeatherViewController maximumWidthOfTemperatureString];
}

- (CGFloat)xOriginOfImageView {
    return 400 - kWidthOfImageView - kSpacingBetweenImageViewAndRightSideOfScreen;
}

- (CGFloat)yOriginOfTemperatureString {
    CGSize stringSize = [self sizeOfTemperatureString];
    return 40 - (stringSize.height / 2);
}

- (CGRect)frameForImageView {
    CGRect frame;
    frame.origin = CGPointMake([self xOriginOfImageView], 8);
    frame.size = CGSizeMake(64, 64);
    return frame;
}

- (CGRect)frameForTemperatureLabel {
    CGRect frame;
    frame.origin = CGPointMake([self xOriginOfTemperatureString], [self yOriginOfTemperatureString]);
    frame.size = [self sizeOfTemperatureString];
    return frame;
}

- (CGSize)sizeOfTemperatureString {
    return [[self formattedTemperatureString] sizeWithFont:[UIFont systemFontOfSize:50]
                                         constrainedToSize:CGSizeMake(CGFLOAT_MAX, 80)];
}

@end
