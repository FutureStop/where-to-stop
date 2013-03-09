typedef UIViewController *(^UIViewControllerFactory)(void);

@interface MMExternalDisplay : NSObject

+ (void)setUpWithViewControllerFactory:(UIViewControllerFactory)viewControllerFactory;

@end
