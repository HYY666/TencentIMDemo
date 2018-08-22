//
//  NetworkErrorStatus.h
//  YIXiuOne
//
//  Created by 赵群涛 on 16/12/9.
//  Copyright © 2016年 ZQT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkErrorStatus : NSObject

+ (NSString *)networkErrorStatusNSError:(NSError *)error withStatusL:(NSString *)titleL;


@end
