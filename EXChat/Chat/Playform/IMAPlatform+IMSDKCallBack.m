//
//  IMAPlatform+IMSDKCallBack.m
//  TIMChat
//
//  Created by AlexiChen on 16/2/26.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import "IMAPlatform+IMSDKCallBack.h"
#import "AppDelegate.h"

// 所有回调中的核心逻辑最终都放入到主线程中执行

@implementation IMAPlatform (IMSDKCallBack)

#pragma mark - TIMConnListener

/**
 *  网络连接成功
 */
- (void)onConnSucc
{
    self.isConnected = YES;
    
    TCQALNetwork net = [[QalSDKProxy sharedInstance] getNetType];
    [self changeToNetwork:net];
    
    [self.conversationMgr onConnect];
}

/**
 *  网络连接失败
 *
 *  @param code 错误码
 *  @param err  错误描述
 */
- (void)onConnFailed:(int)code err:(NSString*)err
{
    
    self.isConnected = NO;
    [self.conversationMgr onDisConnect];

    DebugLog(@"网络连接失败");
}

/**
 *  网络连接断开
 *
 *  @param code 错误码
 *  @param err  错误描述
 */
- (void)onDisconnect:(int)code err:(NSString*)err
{
    
    self.isConnected = NO;
    [self.conversationMgr onDisConnect];

    DebugLog(@"网络连接断开 code = %d, err = %@", code, err);
}


/**
 *  连接中
 */
- (void)onConnecting
{
    DebugLog(@"连接中");
}

#pragma mark - TIMUserStatusListener

/**
 *  踢下线通知
 */

static BOOL kIsAlertingForceOffline = NO;
- (void)onForceOffline
{
    
    if (!kIsAlertingForceOffline)
    {
        [[AppDelegate sharedAppDelegate] popToRootViewController];
        
        kIsAlertingForceOffline = YES;
        DebugLog(@"踢下线通知");
        
        UIAlertView *alert = [UIAlertView bk_showAlertViewWithTitle:@"下线通知" message:@"您的帐号于另一台手机上登录。" cancelButtonTitle:@"确定" otherButtonTitles:nil handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 0)
            {
                [self offlineLogin];
                [[NSNotificationCenter defaultCenter]postNotificationName:goToLoginVCKey object:nil];
            }
            kIsAlertingForceOffline = NO;
        }];
        [alert show];
        
    }
}

/**
 *  断线重连失败
 */
- (void)onReConnFailed:(int)code err:(NSString*)err
{
    DebugLog(@"断线重连失败");
    UIAlertView *alert = [UIAlertView bk_showAlertViewWithTitle:@"下线通知" message:@"断线重连失败。" cancelButtonTitle:@"确定" otherButtonTitles:nil handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
        if (buttonIndex == 0)
        {
            [self offlineLogin];
            [[NSNotificationCenter defaultCenter]postNotificationName:goToLoginVCKey object:nil];
        }

    }];
    [alert show];
    
    
}

/**
 *  用户登录的userSig过期，需要重新登录
 */
- (void)onUserSigExpired
{
    [[HUDHelper sharedInstance] syncLoading];
    //刷新票据
    [[TLSHelper getInstance] TLSRefreshTicket:[IMAPlatform sharedInstance].host.profile.identifier andTLSRefreshTicketListener:self];
}

- (void)OnRefreshTicketSuccess:(TLSUserInfo *)userInfo
{
    [[HUDHelper sharedInstance] syncStopLoading];
    
    //更新本地票据
    IMALoginParam *param = [IMALoginParam loadFromLocal];
    param.userSig = [[TLSHelper getInstance] getTLSUserSig:userInfo.identifier];
    param.tokenTime = [[NSDate date] timeIntervalSince1970];
    
    [param saveToLocal];
    
    [IMAPlatform sharedInstance].host.loginParm.userSig = param.userSig;
    [[IMAPlatform sharedInstance].host.loginParm saveToLocal];
    
    // 重新登录
    [[TIMManager sharedInstance] login:param succ:^{
//        [IMAPlatform setAutoLogin:YES];
    } fail:^(int code, NSString *msg) {
        DebugLog(@"TIMLogin Failed: code=%d err=%@", code, msg);
        [[HUDHelper sharedInstance] tipMessage:@"刷新票据，登录失败"];
    }];
}

- (void)OnRefreshTicketFail:(TLSErrInfo *)errInfo
{
    [[HUDHelper sharedInstance] syncStopLoading];
    
    NSString *err = [[NSString alloc] initWithFormat:@"刷新票据失败\ncode:%d, error:%@", errInfo.dwErrorCode, errInfo.sErrorTitle];
    
    DebugLog(@"%@",err);
    
    [[HUDHelper sharedInstance] syncLoading:@"刷新票据失败,正在退出"];
    
    IMALoginParam *param = [IMALoginParam loadFromLocal];
    param.tokenTime = 0;
    [param saveToLocal];
    
    [[IMAPlatform sharedInstance] logout:^{
        
        [[HUDHelper sharedInstance] syncStopLoading];
        
//        [[UIApplication sharedApplication].delegate enterLoginUI];
        
    } fail:^(int code, NSString *err) {
        
        [[HUDHelper sharedInstance] syncStopLoading];
        
//        [[AppDelegate sharedAppDelegate] enterLoginUI];
        
    }];
}

- (void)OnRefreshTicketTimeout:(TLSErrInfo *)errInfo
{
    [self OnRefreshTicketFail:errInfo];
}

#pragma mark -TIMRefreshListener

- (void)onRefresh
{
    // TODO:重新刷新会话列列
    DebugLog(@"=========>>>>> 刷新会话列表");
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.conversationMgr asyncConversationList];
        [[TIMManager sharedInstance] addMessageListener:self.conversationMgr];
    });
    
}

- (void)onRefreshConversations:(NSArray*)conversations
{
    [self.conversationMgr asyncConversationList];
}

@end


