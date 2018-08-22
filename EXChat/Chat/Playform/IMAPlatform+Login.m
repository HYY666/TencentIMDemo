//
//  IMAPlatform+Login.m
//  TIMChat
//
//  Created by AlexiChen on 16/2/26.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import "IMAPlatform+Login.h"

@implementation IMAPlatform (Login)

//互踢下线错误码

#define kEachKickErrorCode 6208


//离线被踢
//用户离线时，在其它终端登录过，再次在本设备登录时，会提示被踢下线，需要重新登录
- (void)offlineKicked:(TIMLoginParam *)param succ:(TIMLoginSucc)succ fail:(TIMFail)fail
{
    
    UIAlertView *alert = [UIAlertView bk_showAlertViewWithTitle:@"下线通知" message:@"您的帐号于另一台手机上登录。" cancelButtonTitle:@"退出" otherButtonTitles:nil handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
        if (buttonIndex == 0)
        {
            [self offlineLogin];
      [[NSNotificationCenter defaultCenter]postNotificationName:goToLoginVCKey object:nil];
        }
    }];
    [alert show];
}



- (void)configHost:(TIMLoginParam *)param
{
    if (!_host)
    {
        _host = [[IMAHost alloc] init];
    }
    _host.loginParm = param;
    [_host asyncProfile];
}

- (void)configConversation
{
    [self.conversationMgr asyncConversationList];
}



- (void)configOnLoginSucc:(TIMLoginParam *)param
{
    // 配置, 获取个人名片
    [self configHost:param];
    // 获取会话列表
    [self configConversation];
}


@end
