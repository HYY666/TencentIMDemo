//
//  UserHelper.h
//  reader
//
//  Created by huang on 17/3/22.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserModel.h"

@interface UserHelper : NSObject

@property (nonatomic,strong) UserModel *user;
@property (nonatomic,assign) BOOL userInfoIsNeedRef;//用户信息需要刷新

+ (UserHelper *)sharedHelper;
//是否登录
- (BOOL)isLogin;
//登录成功
- (void)userLoginSuccess:(UserModel *)userModel;
//用户注销
- (void)userLogout;
//保存用户最后一次登录信息
+(void)saveLastUser:(UserModel *)userModel;
//获取用户最后一次登录信息
+(UserModel *)getLastUser;
//清空用户最后一次登录信息
+(void)clearLastUser;
//将字典转userModel
+(UserModel *)conveDicToUserModel:(NSDictionary *)dic;
//拼接第三方登录所需要的参数
+(NSMutableDictionary *)getLoginConfig;


@end
