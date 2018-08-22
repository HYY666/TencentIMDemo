//
//  DataSource.h
//  yeliao
//
//  Created by Apple on 2017/12/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject

@property (nonatomic,copy) NSString *verify;
@property (nonatomic,copy) NSString *version;
@property (nonatomic,copy) NSString *build;
@property (nonatomic,copy) NSString *orgQQ;
@property (nonatomic,copy) NSString *goldRechargePer; //官方QQ群号
@property (nonatomic,copy) NSString *imKefuId; //IM客服ID
@property (nonatomic,copy) NSString *imGroupRoom; //IM大厅聊天室ID
@property (nonatomic,copy) NSString *socketVideoPort;
@property (nonatomic,copy) NSString *socketChatPort;
@property (nonatomic,copy) NSString *socketIp;
@property (nonatomic,copy) NSString *userChatFreeNumber;

+ (DataSource *)shareInstance;

//用户自动登录
- (void)userAutoLogin:(void(^)(BOOL successful))complete;
//获取用户信息
- (void)getUserInfo:(void(^)(BOOL successful))complete;

@end
