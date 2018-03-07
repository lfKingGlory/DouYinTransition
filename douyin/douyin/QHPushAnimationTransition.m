//
//  QHPushAnimationTransition.m
//  douyin
//
//  Created by msj on 2018/3/6.
//  Copyright © 2018年 mjsfax. All rights reserved.
//

#import "QHPushAnimationTransition.h"

@interface QHPushAnimationTransition ()

@end

@implementation QHPushAnimationTransition
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext  {
    return 0.25;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    toVC.view.frame = CGRectMake(fromVC.view.frame.size.width, 0, fromVC.view.frame.size.width, fromVC.view.frame.size.height);
    [containerView addSubview:toVC.view];
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect fromR = fromVC.view.frame;
        fromR.origin.x = - 0.3*[UIScreen mainScreen].bounds.size.width;
        fromVC.view.frame = fromR;
        
        CGRect tR = toVC.view.frame;
        tR.origin.x = 0;
        toVC.view.frame = tR;
    } completion:^(BOOL finished) {
        toVC.view.frame = [UIScreen mainScreen].bounds;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
