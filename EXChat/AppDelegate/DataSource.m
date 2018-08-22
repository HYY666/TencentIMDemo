//
//  DataSource.m
//  yeliao
//
//  Created by Apple on 2017/12/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "DataSource.h"
#import <ILiveSDK/ILiveLoginManager.h>

static DataSource *dataSource;

@implementation DataSource

//单例类创建
+ (DataSource *)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataSource= [[DataSource alloc]init];
    });
    return dataSource;
}

//用户自动登录
- (void)userAutoLogin:(void(^)(BOOL successful))complete{

    
}



//获取用户信息
- (void)getUserInfo:(void(^)(BOOL successful))complete{
   
}


@end
