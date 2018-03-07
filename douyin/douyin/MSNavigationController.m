//
//  MSNavigationController.m
//  douyin
//
//  Created by msj on 2018/3/6.
//  Copyright © 2018年 mjsfax. All rights reserved.
//

#import "MSNavigationController.h"
#import "QHNavigationControllerTransition.h"
#import "ViewController1.h"
#import "ViewController.h"

@interface MSNavigationController ()<UIGestureRecognizerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) QHNavigationControllerTransition *transition;
@end

@implementation MSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.transition = [QHNavigationControllerTransition new];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [pan addTarget:self.transition action:@selector(pan:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
//    [self.interactivePopGestureRecognizer.view addGestureRecognizer:pan];
    [self setNavigationBarHidden:YES animated:NO];
    self.interactivePopGestureRecognizer.delegate = self;

//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
//    [self.view addGestureRecognizer:tap];
    
//    UISwipeGestureRecognizer *sges = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tap1:)];
//    sges.direction = UISwipeGestureRecognizerDirectionLeft;
//    sges.delegate = self;
//    [self.view addGestureRecognizer:sges];
    
//    [sges requireGestureRecognizerToFail:pan];
//    [sges requireGestureRecognizerToFail:tap];
}

- (void)tap:(UITapGestureRecognizer *)tap {
    NSLog(@"%s",__func__);
    ViewController1 *v1 = [ViewController1 new];
    [self pushViewController:v1 animated:YES];
}

- (void)tap1:(UITapGestureRecognizer *)tap {
    NSLog(@"%s",__func__);
    ViewController1 *v1 = [ViewController1 new];
    [self pushViewController:v1 animated:YES];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        return self.viewControllers.count > 1;
    }
    
    UIViewController *vc = self.topViewController;
    if (![vc isKindOfClass:[ViewController class]]) {
        return NO;
    }
    
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint translationP = [pan translationInView:self.view];
        CGPoint velocityP = [pan velocityInView:self.view];
        if (translationP.x >= 0 && velocityP.x > 0) {
            return NO;
        }
        return YES;
    } else if ([gestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]]) {
        UISwipeGestureRecognizer *sges = (UISwipeGestureRecognizer *)gestureRecognizer;
        if (sges.direction == UISwipeGestureRecognizerDirectionLeft) {
            return YES;
        }
        return NO;
    }
    
    return YES;
}

- (void)pan:(UIPanGestureRecognizer *)panGes {
    NSLog(@"%s",__func__);
    switch (panGes.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.delegate = self.transition;
            ViewController1 *v1 = [ViewController1 new];
            [self pushViewController:v1 animated:YES];
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            self.delegate = self;
            break;
        }
        default:
            break;
    }
}


@end
