//
//  ViewController.m
//  douyin
//
//  Created by msj on 2018/3/6.
//  Copyright © 2018年 mjsfax. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"ViewController";
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
//    [self.view addGestureRecognizer:tap];
}

//- (void)tap:(UITapGestureRecognizer *)tap {
//    ViewController1 *v1 = [ViewController1 new];
//    [self.navigationController pushViewController:v1 animated:YES];
//}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//}

@end
