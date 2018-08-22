//
//  BaseViewController.m
//  reader
//
//  Created by huang on 17/2/27.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import "BaseViewController.h"
#import <UMMobClick/MobClick.h>

@interface BaseViewController ()

@property (nonatomic,strong) NSString *analyzeTitle;

@end

@implementation BaseViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    [self setStatusBarBackgroundColor:[UIColor clearColor]];
    self.view.backgroundColor = COLOR_WHITE;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:self.analyzeTitle];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:self.analyzeTitle];
}


- (void)dealloc
{
#ifdef DEBUG_MEMERY
    NSLog(@"dealloc %@", self.navigationItem.title);
#endif
}

#pragma mark - Getter -
- (NSString *)analyzeTitle
{
    if (_analyzeTitle == nil) {
        return self.navigationItem.title;
    }
    return _analyzeTitle;
}


- (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}





@end
