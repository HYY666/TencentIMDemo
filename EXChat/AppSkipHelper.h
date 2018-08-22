//
//  AppSkipHelper.h
//  EXChat
//
//  Created by Apple on 2018/8/3.
//  Copyright © 2018年 jiusheng. All rights reserved.
//

#import <Foundation/Foundation.h>

//帮忙处理appdelegate通知跳转的工具类
@interface AppSkipHelper : NSObject

+ (AppSkipHelper *)shareHelper;

@end
