//
//  TIMAdapter.h
//  TIMAdapter
//
//  Created by AlexiChen on 16/1/29.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QALSDK/QalSDKProxy.h>

#import <ImSDK/ImSDK.h>

#import <TLSSDK/TLSHelper.h>


#define kSupportCustomConversation 1



//==============================



#define GIFT_CELL_WIDTH  200
#define GIFT_CELL_HEIGHT  60

// 最大昵称UTF8字符串长度
#define kNicknameMaxLength  64

#define kDefaultUserIcon            [UIImage imageNamed:@"default_user"]
#define kDefaultGroupIcon           [UIImage imageNamed:@"default_group"]
#define kDefaultSystemIcon          [UIImage imageNamed:@"default_system"]

//IMCustomElem
#define CUSTOM_SYSTEM_MESSAGE            @"system_info_type"
#define CUSTOM_MSG_NICK_FROM          @"nick_from"
#define CUSTOM_MSG_HEADURL_FROM        @"headurl_from"
#define CUSTOM_MSG_GENDER_FROM            @"gender_from"
#define CUSTOM_MSG_LEVEL_FROM           @"level_from"
#define CUSTOM_MSG_NICK_TO          @"nick_to"
#define CUSTOM_MSG_HEADURL_TO           @"headurl_to"
#define CUSTOM_MSG_PARAM     @"param"




#define REQUEST_REPLY           @"[亲，刚和你发起了视频聊天 怎么不在呢？赶紧回复一下吧。]"
#define REQUEST_REPLY_REFUSE           @"[在忙喔，稍后回复你]"
#define REQUEST_VIDEO_CANCEL          @"[发起聊天取消]"



//==============================
// 聊天图片缩约图最大高度  190.f
#define kChatPicThumbMaxHeight 300.f
// 聊天图片缩约图最大宽度  66.f
#define kChatPicThumbMaxWidth 100.f

//==============================

// IMAMsg扩展参数的键
#define kIMAMSG_Image_ThumbWidth    @"kIMA_ThumbWidth"
#define kIMAMSG_Image_ThumbHeight   @"kIMA_ThumbHeight"
#define kIMAMSG_Image_OrignalPath   @"kIMA_OrignalPath"
#define kIMAMSG_Image_ThumbPath     @"kIMA_ThumbPath"

//==============================

// IMA中用到的消息相关通知
#define kIMAMSG_DeleteNotification @"kIMAMSG_DeleteNotification"
#define kIMAMSG_ResendNotification @"kIMAMSG_ResendNotification"
#define kIMAMSG_ChangedNotification @"kIMAMSG_ChangedNotification"

//==============================

#define IMALocalizedError(intCode, enStr) NSLocalizedString(([NSString stringWithFormat:@"%d", (int)intCode]), enStr)

//==============================
// IMA内部使用的字休
#define kIMALargeTextFont       [UIFont systemFontOfSize:16]
#define kIMAMiddleTextFont      [UIFont systemFontOfSize:14]
#define kIMASmallTextFont       [UIFont systemFontOfSize:12]



#import "IMAShow.h"

#import "IMAModel.h"

#import "IMAPlatformHeaders.h"


