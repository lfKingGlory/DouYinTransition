//
//  QHNavigationControllerTransition.m
//  douyin
//
//  Created by msj on 2018/3/6.
//  Copyright © 2018年 mjsfax. All rights reserved.
//

#import "QHNavigationControllerTransition.h"
#import "QHPushAnimationTransition.h"

@interface QHNavigationControllerTransition()
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition *interactivePopTransition;
@end

@implementation QHNavigationControllerTransition
- (instancetype)init {
    self = [super init];
    if (self) {
        self.interactivePopTransition = [UIPercentDrivenInteractiveTransition new];
        self.interactivePopTransition.completionCurve = UIViewAnimationCurveEaseInOut;
    }
    return self;
}

/*
 typedef NS_ENUM(NSInteger, UIViewAnimationCurve) {
 UIViewAnimationCurveEaseInOut,         // slow at beginning and end
 UIViewAnimationCurveEaseIn,            // slow at beginning
 UIViewAnimationCurveEaseOut,           // slow at end
 UIViewAnimationCurveLinear,
 };
 */

- (void)pan:(UIPanGestureRecognizer *)panGes {
    CGFloat progress = [panGes translationInView:panGes.view].x / panGes.view.frame.size.width;
    NSLog(@"progress======%lf",progress);
    switch (panGes.state) {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:
        {
            if (progress <= 0) {
                progress = MIN(1.0, fabs(progress));
            } else {
                progress = 0;
            }
            [self.interactivePopTransition updateInteractiveTransition:progress];
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        default:
        {
            if (progress < 0 && fabs(progress) > 0.3) {
                [self.interactivePopTransition finishInteractiveTransition];
            } else {
                [self.interactivePopTransition cancelInteractiveTransition];
            }
            break;
        }
    }
}

- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    return self.interactivePopTransition;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return [[QHPushAnimationTransition alloc] init];
    }
    return nil;
}
@end
