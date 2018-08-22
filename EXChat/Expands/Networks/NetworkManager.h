//
//  NetworkManager.h
//  yeliao
//
//  Created by 趣融 on 2017/12/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum{
    
    StatusUnknown           = -1, //未知网络
    StatusNotReachable      = 0,    //没有网络
    StatusReachableViaWWAN  = 1,    //手机自带网络
    StatusReachableViaWiFi  = 2     //wifi
    
}NetWorkStatus;


typedef void( ^ LXResponseSuccess)(id response);
typedef void( ^ LXResponseFail)(NSError *error);

typedef void( ^ LXUploadProgress)(int64_t bytesProgress,
                                  int64_t totalBytesProgress);

typedef void( ^ LXDownloadProgress)(int64_t bytesProgress,
                                    int64_t totalBytesProgress);

/**
 *  方便管理请求任务。执行取消，暂停，继续等任务.
 *  - (void)cancel，取消任务
 *  - (void)suspend，暂停任务
 *  - (void)resume，继续任务
 */
typedef NSURLSessionTask LXURLSessionTask;



@interface NetworkManager : NSObject


/**
 *  上传图片大小(kb)
 */
@property (nonatomic, assign) NSUInteger picSize;


/**
 *  单例
 *
 *
 */
+ (NetworkManager *)sharedManager;

/**
 *  获取网络
 */
@property (nonatomic,assign)NetWorkStatus networkStats;

/**
 *  开启网络监测
 */
+ (void)startMonitoring;

/**
 *  get请求方法,block回调
 *
 *  @param url     请求连接，根路径
 *  @param params  参数
 *  @param success 请求成功返回数据
 *  @param fail    请求失败
 *  @param showHUD 是否显示HUD
 */
+(LXURLSessionTask *)getWithUrl:(NSString *)url
                         params:(NSMutableDictionary *)params
                        success:(LXResponseSuccess)success
                           fail:(LXResponseFail)fail
                        showHUD:(BOOL)showHUD;

/**
 *  post请求方法,block回调
 *
 *  @param url     请求连接，根路径
 *  @param params  参数
 *  @param success 请求成功返回数据
 *  @param fail    请求失败
 *  @param showHUD 是否显示HUD
 */
+(LXURLSessionTask *)postWithUrl:(NSString *)url
                          params:(NSMutableDictionary *)params
                         success:(LXResponseSuccess)success
                            fail:(LXResponseFail)fail
                         showHUD:(BOOL)showHUD;




@end
