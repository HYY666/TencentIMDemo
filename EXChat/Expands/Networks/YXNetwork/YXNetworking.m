//
//  YXNetworking.m
//  YIXiuOne
//
//  Created by 赵群涛 on 16/8/28.
//  Copyright © 2016年 ZQT. All rights reserved.
//
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif
#import "YXNetworking.h"
#import "AFNetworking.h"
static NSMutableArray *tasks;



@implementation YXNetworking


+ (YXNetworking *)sharedLXNetworking
{
    static YXNetworking *handler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handler = [[YXNetworking alloc] init];
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
//    DLog(@"请求地址----%@\n    请求参数----%@",url,params);
    if (url==nil) {
        return nil;
    }
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    if (showHUD==YES) {
        [MBProgressHUD showHUDAddedTo:window animated:YES];
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
            //            DLog(@"请求结果=%@",responseObject);
            if (success) {
                success(responseObject);
            }
            
            [[self tasks] removeObject:sessionTask];
            
            if (showHUD==YES) {
                [MBProgressHUD hideHUDForView:window animated:YES];
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            DLog(@"error=%@",error);
            if (fail) {
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
                success(responseObject);
            }
            [[self tasks] removeObject:sessionTask];
            if (showHUD==YES) {
                [MBProgressHUD hideHUDForView:window animated:YES];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (fail) {
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

#pragma mark 处理退出
- (void)dealOutlogin {
//    [[NSNotificationCenter defaultCenter] postNotificationName:ShowLoginViewNotification object:nil];
    return;
}

+(AFHTTPSessionManager *)getAFManager{
    //    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    AFHTTPSessionManager *manager = manager = [AFHTTPSessionManager manager];
    //manager.requestSerializer = [AFJSONRequestSerializer serializer];//设置请求数据为json
    
    //超时缓存设置
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
    //SSL
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
//    AFHTTPRequestSerializer *request = [AFHTTPRequestSerializer serializer];
//    request.timeoutInterval = 120;
    [securityPolicy setValidatesDomainName:NO];
    securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy = securityPolicy;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//设置返回数据为json
    manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    manager.requestSerializer.timeoutInterval=10;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*"]];
    
    //共同设置请求Header[[
    //1.AppSource-渠道号
    //2.vr-内部的app版本号
    //3.pf-移动端平台(iOS/Android)
    //4.dt-毫秒时间戳
    [manager.requestSerializer setValue:@"AppStore" forHTTPHeaderField:@"AppSource"]; //-----渠道号
//    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%d",VERSION_CODE] forHTTPHeaderField:@"vr"];//-----版本号
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"pf"];//------平台
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970] *1000] forHTTPHeaderField:@"dt"];//------时间戳
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
                [YXNetworking sharedLXNetworking].networkStats=StatusUnknown;
                
                break;
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                DLog(@"没有网络");
                [YXNetworking sharedLXNetworking].networkStats=StatusNotReachable;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                DLog(@"手机自带网络");
                [YXNetworking sharedLXNetworking].networkStats=StatusReachableViaWWAN;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                
                [YXNetworking sharedLXNetworking].networkStats=StatusReachableViaWiFi;
                DLog(@"WIFI--%d",[YXNetworking sharedLXNetworking].networkStats);
                break;
        }
    }];
    [mgr startMonitoring];
}


+(NSString *)strUTF8Encoding:(NSString *)str{
    return [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
   
}


@end
