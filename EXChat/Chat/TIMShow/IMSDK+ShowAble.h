//
//  IMSDK+ShowAble.h
//  TIMChat
//
//  Created by AlexiChen on 16/3/1.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import <ImSDK/ImSDK.h>

// 为方便界面使用IMSDK里面的对象
// 将需要的转换成界面显示的接口

@interface TIMUserProfile (ShowAble)

- (NSString *)getAllowType;
+ (NSDictionary *)allowTypeTips;

@end


