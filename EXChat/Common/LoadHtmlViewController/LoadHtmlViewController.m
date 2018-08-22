//
//  LoadHtmlViewController.m
//  reader
//
//  Created by huang on 17/5/8.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import "LoadHtmlViewController.h"

@interface LoadHtmlViewController ()

@property (nonatomic,strong) UIWebView *webView;

@end

@implementation LoadHtmlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.webView];
    NSURL *url = [NSURL URLWithString:self.htmlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT- HEIGHT_NAVBAR)];
        _webView.dataDetectorTypes = UIDataDetectorTypeAll;
//        _webView.delegate = self;
        
    }
    return _webView;
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
