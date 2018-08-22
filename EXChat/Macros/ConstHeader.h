//
//  ConstHeader.h
//  TIMChat
//
//  Created by wilderliao on 16/2/17.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//


//Chat

// 是否支持富文本显示。 如果为1 因为elem.count 总是等于 2 所有消息类型都是富文本
#define kTestChatAttachment 1


//聊天信息背景色圆角
#define COLOR_CHAT_BACK_ME    RGB(248, 175, 42)
#define COLOR_CHAT_BACK    RGB(251, 251, 251)
#define CHAT_BACK_RADIUS   5


#ifndef ConstHeader_h
#define ConstHeader_h

#define kDefaultMargin  8

#define kAppStoreVersion 0

#define kDefaultSubGroupIcon        [UIImage imageWithColor:kOrangeColor size:CGSizeMake(32, 32)]


#define kAppLargeTextFont       [UIFont systemFontOfSize:16]
#define kAppMiddleTextFont      [UIFont systemFontOfSize:14]
#define kAppSmallTextFont       [UIFont systemFontOfSize:12]

#define kDefaultSilentUntil     100

#define kSaftyWordsCode 80001


#endif /* ConstHeader_h */
