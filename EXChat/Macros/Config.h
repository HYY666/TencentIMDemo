//
//  Config.h
//  EXChat
//
//  Created by Apple on 2018/8/3.
//  Copyright © 2018年 jiusheng. All rights reserved.
//

#ifndef Config_h
#define Config_h

#define MOBILE_SYSTEM  [[UIDevice currentDevice] systemName]?[[UIDevice currentDevice] systemName]:@""
#define MOBILE_MODEL  [[UIDevice currentDevice] model]?[[UIDevice currentDevice] model]:@""
#define MOBILE_SYSTEM_VERSION [[UIDevice currentDevice] systemVersion]?[[UIDevice currentDevice] systemVersion]:@""


#define SYSID  @"yeliaoapi"
#define SYSFILEID  @"yeliaoapifile"
#define APP_CHANNEL_NO  @"IOS"

//密钥（系统会分配接口调用者唯一密钥id）
#define SECRET_ID  @"Zjhk3eOiNmE12s"
#define SECRET_KEY  @"ND320MrE2MjkwMTg3NXA1FRZjNmY4M12"
//设备平台号  ios 2
#define PLATFORM  @"2"
//des 加密钥匙
#define DES_KEY  @"f7a4701af986c5fc57b5e52e391cdd56"

#define SDKAppID     1400042510
#define AccountType  17669

//测试手机密码
#define TestPhone  18519684205
#define TestPsd   123456


#define  KeFuNickName  @"客服MM"
//极光推送SDK 信息
#define JP_APP_KEY  @"938a2a7719d347d0092cf683"
#define JP_Channel  @"App Store"
#define JP_isProduction  1


//友盟SDK 信息
#define UM_APP_KEY  @"5a24af2df43e48192d00000d"
#define UM_Channel_Id  @"IOS"


//QQSDK  第三方登录配置信息
#define kQQAppId @"1106359088"
#define kQQLoginSuccessed @"qqLoginSuccessed"
#define kQQLoginFailed    @"qqLoginFailed"
#define kQQLoginNotNetWork @"qqLoginNotNetWork"
#define kQQLoginUserInfoResponse @"qqLoginUserInfoResponse"
#define kQQResponse @"qqResponse"

//WXSDK  第三方登录配置信息
#define kWXAppId @"wx8ea61bb65fdff9a7"
#define kWXAppSecret @"6e127202cfa2dc106cf3250637f99dac"
#define kWXLoginSuccessed @"wxLoginSuccessed"
#define kWXLoginFailed    @"wxLoginFailed"
#define kWXLoginNotNetWork @"wxLoginNotNetWork"


#define RechargeSuccessfulHandle @"RechargeSuccessfulHandle"

#define DEFAULT_AVATAR   @"blur_img"
#define goToMainVCKey   @"goToMainVCKey"
#define goToSexVCKey   @"goToSexVCKey"
#define goToLoginVCKey   @"goToLoginVCKey"
#define enterChatRoomKey   @"enterChatRoomKey"
#define inviteShowKey   @"inviteShowKey"

#define onClickAvatarKey @"onClickAvatarKey"
#define userChatFreeNumberKey @"userChatFreeNumberKey"



//DEBUG和RELEASE要分开，RELEASE时log打印要取消
#ifdef DEBUG
#define NSLog(...) printf("[%s] %s [第%d行]: %s\n", __TIME__ ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])
#else
#define NSLog(...)
#endif



#define generalBGColour [UIColor colorWithRed:(float)241/255 green:(float)241/255 blue:(float)241/255 alpha:1]//通用背景颜色



#endif /* Config_h */
