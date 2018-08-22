//
//  ParameterHelper.h
//  reader
//
//  Created by huang on 17/3/9.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ParameterHelper : NSObject

//system_info_type  是扩展字段.   默认是0即可.  后面视频消息有用到1 , 礼物消息可能会用到2什么的.
+ (NSMutableDictionary *)getCustomDataWithToNick:(NSString *)toNick toHeadUrl:(NSString *)toHeadUrl type:(NSString *)type param:(NSString *)param;


+ (NSMutableDictionary *)getParametersWithDataDictionry:(NSDictionary *)dataDic;




@end
