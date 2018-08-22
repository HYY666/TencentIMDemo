//
//  BaseWebviewVC.m
//  jschat
//
//  Created by liuyanqing on 2017/12/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseWebviewViewController.h"

@interface BaseWebviewViewController ()<UIWebViewDelegate,UIScrollViewDelegate>
@property(strong, nonatomic) UIWebView *webview;

@end

@implementation BaseWebviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}


- (void)createUI {
    self.title = self.titleName;
    self.view.backgroundColor = generalBGColour;
    self.webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.webview.backgroundColor = generalBGColour;
    self.webview.delegate = self;
    [self.view addSubview:self.webview];
    NSURL *url = [NSURL URLWithString:self.urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
