//
//  TIMUserProfile+ShowAble.m
//  TIMChat
//
//  Created by AlexiChen on 16/3/1.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import "IMSDK+ShowAble.h"

@implementation TIMUserProfile (ShowAble)

// 显示的标题
- (NSString *)showTitle
{
    return ![NSString isEmpty:self.remark] ? self.remark : ![NSString isEmpty:self.nickname] ? self.nickname : self.identifier;
}

// 显示图像的地址
- (NSString *)showIconUrl
{
    return self.faceURL;
}

//- (NSString *)getAllowType
//{
//    switch (self.allowType)
//    {
//        case TIM_FRIEND_ALLOW_ANY:
//        {
//            return @"同意任何用户加好友";
//        }
//
//            break;
//        case TIM_FRIEND_NEED_CONFIRM:
//        {
//            return @"需要验证";
//        }
//            break;
//        case TIM_FRIEND_DENY_ANY:
//        {
//            return @"拒绝任何人加好友";
//        }
//            break;
//        default:
//            break;
//    }
//}

+ (NSDictionary *)allowTypeTips
{
    return @{@"同意任何用户加好友" : @(TIM_FRIEND_ALLOW_ANY), @"需要验证" : @(TIM_FRIEND_NEED_CONFIRM), @"拒绝任何人加好友" : @(TIM_FRIEND_DENY_ANY)};
}


@end


