//
//  PhoneUtil.h
//  reader
//
//  Created by huangboning on 17/4/21.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhoneUtil : NSObject

+(NSString *)getPhoneIdentifer;
//+(NSString *)getPhoneIDFA;
+(NSString *)getPhoneModel;
+(NSString *)getPhoneVersion;

+(NSString *)md5_32:(NSString *)str;
+(NSString *)md5_16:(NSString *)str;

+ (NSString *)getCurrentDeviceModel;


+ (NSString *)dateSortFormat:(NSString *)dateString;

+(NSString *)currentDateFormat;

+(BOOL) isMobileNo:(NSString *)mobile;
+(BOOL) isEmail:(NSString *)mobile;


+ (NSString *)uuidString;

@end
