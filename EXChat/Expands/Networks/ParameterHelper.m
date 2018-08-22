//
//  ParameterHelper.m
//  reader
//
//  Created by huang on 17/3/9.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import "ParameterHelper.h"
#import "DES3.h"


@implementation ParameterHelper



//system_info_type  是扩展字段.   默认是0即可.  后面视频消息有用到1 , 礼物消息可能会用到2什么的.
+ (NSMutableDictionary *)getCustomDataWithToNick:(NSString *)toNick toHeadUrl:(NSString *)toHeadUrl type:(NSString *)type param:(NSString *)param{
    if (![[UserHelper sharedHelper]isLogin]) {
        return nil;
    }
    NSMutableDictionary *dic = @{}.mutableCopy;
    if (param) {
        [dic setObject:param forKey:CUSTOM_MSG_PARAM];
    }
   
    [dic setObject:toNick?toNick:@"" forKey:CUSTOM_MSG_NICK_TO];
    [dic setObject:toHeadUrl?toHeadUrl:@"" forKey:CUSTOM_MSG_HEADURL_TO];
    [dic setObject: [NSString stringWithFormat:@"%@",type] forKey:CUSTOM_SYSTEM_MESSAGE];
    [dic setObject:[UserHelper sharedHelper].user.userNickname?[UserHelper sharedHelper].user.userNickname:@"" forKey:CUSTOM_MSG_NICK_FROM];
    [dic setObject:[UserHelper sharedHelper].user.userImage?[UserHelper sharedHelper].user.userImage:@"" forKey:CUSTOM_MSG_HEADURL_FROM];
      [dic setObject:[UserHelper sharedHelper].user.userGender?[UserHelper sharedHelper].user.userGender:@"" forKey:CUSTOM_MSG_GENDER_FROM];
      [dic setObject:[UserHelper sharedHelper].user.userLevel?[UserHelper sharedHelper].user.userLevel:@"" forKey:CUSTOM_MSG_LEVEL_FROM];
    
    return dic;
    
}








@end
