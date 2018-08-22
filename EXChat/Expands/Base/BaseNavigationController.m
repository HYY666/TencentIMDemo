//
//  BaseNavigationController.m
//  reader
//
//  Created by huang on 17/2/27.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import "BaseNavigationController.h"

@implementation BaseNavigationController





- (void)viewDidLoad {
    [super viewDidLoad];


     
     }




-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"icon_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(goToBack:)];
        
        viewController.navigationItem.leftBarButtonItem = leftBarButtonItem;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark  Response Event

- (void)goToBack:(UIBarButtonItem *)sender{
    NSLog(@"返回");
   
    [self popViewControllerAnimated:YES];
    
}






@end
