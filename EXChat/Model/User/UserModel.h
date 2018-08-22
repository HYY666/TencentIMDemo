//
//  UserModel.h
//  reader
//
//  Created by huang on 17/3/22.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 用户信息model
 */
@interface UserModel : NSObject

@property (nonatomic,strong) NSString *userId;

@property (nonatomic,strong) NSString *userAccount;

@property (nonatomic,strong) NSString *userPassword;

@property (nonatomic,strong) NSString *userPhone;

@property (nonatomic,strong) NSString *userName;

@property (nonatomic,strong) NSString *userNickname;

@property (nonatomic,strong) NSString *userLevel;

@property (nonatomic,strong) NSString *userScore;

@property (nonatomic,strong) NSString *userGold;
//用户送礼物金币，视频、私聊金币、邀请用户、下线用户充值提成（魅力值）
@property (nonatomic,strong) NSString *userGiveGold;
//用户状态：0默认，-1冻结用户，1正常用户
@property (nonatomic,strong) NSString *userStatus;
//用户类型：0默认，1官方手机号注册，2微信用户，3QQ用户，4微博用户
@property (nonatomic,strong) NSString *userType;
//用户平台：0默认，1android，2ios
@property (nonatomic,strong) NSString *userPlatform;
//用户注册时间（单位秒）
@property (nonatomic,strong) NSString *userDate;
//用户性别：0未设置，1男，2女
@property (nonatomic,strong) NSString *userGender;
//用户头像
@property (nonatomic,strong) NSString *userImage;
//用户客户号
@property (nonatomic,strong) NSString *userNo;
//第三方登录accessToken
@property (nonatomic,strong) NSString *userAccessToken;
//第三方登录openid
@property (nonatomic,strong) NSString *userOpenId;
//第三方登录unionId
@property (nonatomic,strong) NSString *userUnionId;
//腾讯IM登录TLS签名
@property (nonatomic,strong) NSString *userTLSSign;

@property (nonatomic,strong) NSString *userAge;

@property (nonatomic,strong) NSString *code;
//用户是否认真：0未认证，1已认证
@property (nonatomic,strong) NSString *userAuth;
//userChargeSet 用户付费设置（单位金币/分钟）
@property (nonatomic,strong) NSString *userChargeSet;
//用户地址id
@property (nonatomic,strong) NSString *userAddressId;
//用户地址城市
@property (nonatomic,strong) NSString *userAddressCity;
//用户地址省份
@property (nonatomic,strong) NSString *userAddressProvince;
//用户粉丝数
@property (nonatomic,strong) NSString *userFans;
//用户关注数
@property (nonatomic,strong) NSString *userFocus;
//用户推广提成金币（邀请用户，下线用户充值提成）显示总额
@property (nonatomic,strong) NSString *userPromGold;
//用户身高
@property (nonatomic,strong) NSString *userHeight;
//用户签名
@property (nonatomic,strong) NSString *userSign;
//用户自我介绍
@property (nonatomic,strong) NSString *userIntro;
//用户已邀请的人数
@property (nonatomic,strong) NSString *userInvNumber;
//用户是否已被邀请（0未邀请，1已被邀请）
@property (nonatomic,strong) NSString *userIsInv;
@property (nonatomic,strong) NSString *userClick;//用户人气值（被点击数）
@property (nonatomic,strong) NSString *userInvCode;//用户邀请码
@property (nonatomic,copy)NSString *userIsOnline;





@end
