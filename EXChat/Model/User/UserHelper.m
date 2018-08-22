//
//  UserHelper.m
//  reader
//
//  Created by huang on 17/3/22.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import "UserHelper.h"
#import "PhoneUtil.h"


static UserHelper *userHelper;

@implementation UserHelper

+ (UserHelper *)sharedHelper{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userHelper = [[UserHelper alloc]init];
      //  userHelper.user = [[UserModel alloc]init];
    });
    return userHelper;
}

//是否登录
- (BOOL)isLogin{
    BOOL loginStatus=false;
    if (userHelper.user==nil||[userHelper.user.userId isEqualToString:@"0"]) {
        loginStatus=false;
    }else{
        loginStatus=true;
    }
    return loginStatus;
}
//登录成功
- (void)userLoginSuccess:(UserModel *)userModel{
    userHelper.user = userModel;
}
//用户注销
- (void)userLogout{
    userHelper.user=nil;
}
+(void)saveLastUser:(UserModel *)userModel{
   
  
}
//获取用户最后一次登录信息
+(UserModel *)getLastUser{
    UserModel *userModel=[[UserModel alloc] init];
   
    return userModel;
}
//清空用户最后一次登录信息
+(void)clearLastUser{

    
}
//将字典转userModel
+(UserModel *)conveDicToUserModel:(NSDictionary *)dic{
    
    return [UserModel mj_objectWithKeyValues:dic];
}




@end
