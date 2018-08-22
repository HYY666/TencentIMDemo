//
//  NetworkManager.m
//  yeliao
//
//  Created by 趣融 on 2017/12/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif
#import "NetworkManager.h"
#import "AFNetworking.h"

#import "DES3.h"
static NSMutableArray *tasks;



@implementation NetworkManager


+ (NetworkManager *)sharedManager
{
    static NetworkManager *handler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handler = [[NetworkManager alloc] init];
    });
    return handler;
}

+(NSMutableArray *)tasks{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DLog(@"创建数组");
        tasks = [[NSMutableArray alloc] init];
    });
    return tasks;
}

+(LXURLSessionTask *)getWithUrl:(NSString *)url
                         params:(NSMutableDictionary *)params
                        success:(LXResponseSuccess)success
                           fail:(LXResponseFail)fail
                        showHUD:(BOOL)showHUD{
    
    return [self baseRequestType:1 url:url params:params success:success fail:fail showHUD:showHUD];
    
}

+(LXURLSessionTask *)postWithUrl:(NSString *)url
                          params:(NSMutableDictionary *)params
                         success:(LXResponseSuccess)success
                            fail:(LXResponseFail)fail
                         showHUD:(BOOL)showHUD{
    return [self baseRequestType:2 url:url params:params success:success fail:fail showHUD:showHUD];
}

+(LXURLSessionTask *)baseRequestType:(NSUInteger)type
                                 url:(NSString *)url
                              params:(NSMutableDictionary *)params
                             success:(LXResponseSuccess)success
                                fail:(LXResponseFail)fail
                             showHUD:(BOOL)showHUD{
    if (url==nil) {
        return nil;
    }
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    if (showHUD==YES) {
//        [MBProgressHUD showHUDAddedTo:window animated:YES];
         [[HUDHelper sharedInstance] syncLoading:@"请稍候"];
    }
    
    //检查地址中是否有中文
    NSString *urlStr=[NSURL URLWithString:url]?url:[self strUTF8Encoding:url];
    AFHTTPSessionManager *manager=[self getAFManager];
    
    LXURLSessionTask *sessionTask=nil;
    //配置请求参数
    //配置请求参数
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic addEntriesFromDictionary:params];

    
    
    if (type==1) {
        sessionTask = [manager GET:urlStr parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        DLog(@"请求结果=%@",responseObject);
            if (success) {
                NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                NSString *desStr = [DES3 decryptWithText:str key:DES_KEY];
                NSDictionary *result = [NSDictionary stringToNSDictionary:desStr];
                success(result);
            }
            
            [[self tasks] removeObject:sessionTask];
            
            if (showHUD==YES) {
                [[HUDHelper sharedInstance] syncStopLoading];
//                [MBProgressHUD hideHUDForView:window animated:YES];
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                       DLog(@"error=%@",error);
            if (fail) {
                 NSLog(@"error ==%@", [error userInfo][@"com.alamofire.serialization.response.error.string"]);
                [HYYHudView showMsg:@"请求失败，请检查网络！" inView:nil];
                fail(error);
            }
            
            [[self tasks] removeObject:sessionTask];
            
            if (showHUD==YES) {
                [MBProgressHUD hideHUDForView:window animated:YES];
            }
            
        }];
        
    }else{
        sessionTask = [manager POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                NSString *desStr = [DES3 decryptWithText:str key:DES_KEY];
                NSDictionary *result = [NSDictionary stringToNSDictionary:desStr];
                success(result);
            }
            [[self tasks] removeObject:sessionTask];
            if (showHUD==YES) {
                [MBProgressHUD hideHUDForView:window animated:YES];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (fail) {
                 DLog(@"error=%@",error);
                 NSLog(@"error ==%@", [error userInfo][@"com.alamofire.serialization.response.error.string"]);
                fail(error);
            }
            [[self tasks] removeObject:sessionTask];
            if (showHUD==YES) {
                [MBProgressHUD hideHUDForView:window animated:YES];
            }
        }];
        
        
    }
    
    if (sessionTask) {
        [[self tasks] addObject:sessionTask];
    }
    
    return sessionTask;
    
}


+(AFHTTPSessionManager *)getAFManager{
    //    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    AFHTTPSessionManager *manager = manager = [AFHTTPSessionManager manager];
    //超时缓存设置
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
    //SSL
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    [securityPolicy setValidatesDomainName:NO];
    securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy = securityPolicy;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    manager.requestSerializer.timeoutInterval = 10;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*"]];
  
    return manager;
    
}

#pragma makr - 开始监听网络连接

+ (void)startMonitoring
{
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    // 2.设置网络状态改变后的处理
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        switch (status)
        {
                case AFNetworkReachabilityStatusUnknown: // 未知网络
                DLog(@"未知网络");
                [NetworkManager sharedManager].networkStats=StatusUnknown;
                
                break;
                case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                DLog(@"没有网络");
                [NetworkManager sharedManager].networkStats=StatusNotReachable;
                break;
                case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                DLog(@"手机自带网络");
               [NetworkManager sharedManager].networkStats=StatusReachableViaWWAN;
                break;
                case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                
                [NetworkManager sharedManager].networkStats=StatusReachableViaWiFi;
                DLog(@"WIFI--%d",[NetworkManager sharedManager].networkStats);
                break;
        }
    }];
    [mgr startMonitoring];
}


+(NSString *)strUTF8Encoding:(NSString *)str{
    return [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    //    return [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}




@end
