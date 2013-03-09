#import "MMExternalDisplay.h"

@interface MMExternalDisplay ()

@property(nonatomic, strong) UIWindow *externalScreenWindow;
@property(nonatomic, copy) UIViewControllerFactory viewControllerFactory;

- (UIWindow *)newWindowWithFrame:(CGRect)frame;

@end


@implementation MMExternalDisplay

static MMExternalDisplay *sharedInstance;

+ (void)setUpWithViewControllerFactory:(UIViewControllerFactory)viewControllerFactory; {
  NSAssert(viewControllerFactory != nil,
           @"View Controller Factory must not be nil.");
  [MMExternalDisplay sharedInstance].viewControllerFactory =
  viewControllerFactory;
  [[MMExternalDisplay sharedInstance] checkForExistingScreenAndInitializeIfPresent];
  [[MMExternalDisplay sharedInstance] setUpScreenConnectionNotificationHandlers];
}

+ (MMExternalDisplay *)sharedInstance {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[self alloc] init];
  });
  return sharedInstance;
}

- (void)setUpScreenConnectionNotificationHandlers {
  NSNotificationCenter *notificationCenter =
  [NSNotificationCenter defaultCenter];
  [notificationCenter addObserver:self
                         selector:@selector(handleScreenDidConnectNotification:)
                             name:UIScreenDidConnectNotification
                           object:nil];
  [notificationCenter addObserver:self
                         selector:@selector(handleScreenDidDisconnectNotification:)
                             name:UIScreenDidDisconnectNotification
                           object:nil];
}

- (void)handleScreenDidConnectNotification:(NSNotification *)notification {
  UIScreen *externalScreen = [notification object];
  CGRect externalScreenBounds = externalScreen.bounds;
  if (!self.externalScreenWindow) {
    self.externalScreenWindow =
    [self newWindowWithFrame:externalScreenBounds];
    self.externalScreenWindow.screen = externalScreen;
    // TODO: Check if this is necessary.
    self.externalScreenWindow.hidden = NO;
  }
}

- (void)handleScreenDidDisconnectNotification:(NSNotification *)notification {
  if (self.externalScreenWindow) {
    self.externalScreenWindow.hidden = YES;
    self.externalScreenWindow = nil;
  }
}

- (void)checkForExistingScreenAndInitializeIfPresent {
  if ([[UIScreen screens] count] > 1) {
    UIScreen *externalScreen = [[UIScreen screens] objectAtIndex:1];
    CGRect externalScreenBounds = externalScreen.bounds;
    self.externalScreenWindow =
    [self newWindowWithFrame:externalScreenBounds];
    self.externalScreenWindow.screen = externalScreen;
    self.externalScreenWindow.hidden = NO;
  }
}

- (UIWindow *)newWindowWithFrame:(CGRect)frame {
  UIWindow *window =
  [[UIWindow alloc] initWithFrame:frame];
  window.backgroundColor = [UIColor redColor];
  window.rootViewController = self.viewControllerFactory();
  return window;
}

- (void)dealloc
{
  //  NSLog(@"MMExternalDisplay is dead.");
}

@end

