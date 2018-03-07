//
//  QHNavigationControllerTransition.h
//  douyin
//
//  Created by msj on 2018/3/6.
//  Copyright © 2018年 mjsfax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QHNavigationControllerTransition : NSObject<UINavigationControllerDelegate>
- (void)pan:(UIPanGestureRecognizer *)panGes;
@end
