//
//  PhoneUtil.m
//  reader
//
//  Created by huangboning on 17/4/21.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import "PhoneUtil.h"
#import <sys/utsname.h>
#import <CommonCrypto/CommonDigest.h>


@implementation PhoneUtil



+(NSString *)getPhoneIdentifer{
    UIDevice *device=[[UIDevice alloc] init];
    NSString *identifierString=device.identifierForVendor.UUIDString;
    return  identifierString?identifierString:@"";
}
//+(NSString *)getPhoneIDFA{
//NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
//    return adId;
//}
+(NSString *)getPhoneModel{
    UIDevice *device=[[UIDevice alloc] init];
    NSString *identifierString=device.model;
    return  identifierString?identifierString:@"";
}
+(NSString *)getPhoneVersion{
    UIDevice *device=[[UIDevice alloc] init];
    NSString *identifierString=device.systemVersion;
    return  identifierString?identifierString:@"";
}

//小写
+ (NSString *)md5_32:(NSString *)str {
    
    const char *cStr = [str UTF8String];
    unsigned char result[32];
    CC_MD5( cStr, strlen(cStr), result );
    return [[NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0],result[1],result[2],result[3],
            
            result[4],result[5],result[6],result[7],
            
            result[8],result[9],result[10],result[11],
            
            result[12],result[13],result[14],result[15],
            
            result[16], result[17],result[18], result[19],
            
            result[20], result[21],result[22], result[23],
            
            result[24], result[25],result[26], result[27],
            
            result[28], result[29],result[30], result[31]] lowercaseString];
    
}
//md5 16位加密 （小写）

+(NSString *)md5_16:(NSString *)str {
    
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    
    return [[NSString stringWithFormat:
            
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ] lowercaseString];
}


//获得设备型号
+ (NSString *)getCurrentDeviceModel
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //iPhone 系列
    if ([deviceModel isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceModel isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceModel isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceModel isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceModel isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceModel isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceModel isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceModel isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceModel isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceModel isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceModel isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceModel isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([deviceModel isEqualToString:@"iPhone9,1"])    return @"iPhone 7 (CDMA)";
    if ([deviceModel isEqualToString:@"iPhone9,3"])    return @"iPhone 7 (GSM)";
    if ([deviceModel isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus (CDMA)";
    if ([deviceModel isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus (GSM)";
    if([deviceModel isEqualToString:@"iPhone10,1"])     return@"iPhone 8";
    if([deviceModel isEqualToString:@"iPhone10,4"])     return@"iPhone 8";
    if([deviceModel isEqualToString:@"iPhone10,2"])     return@"iPhone 8 Plus";
    if([deviceModel isEqualToString:@"iPhone10,5"])     return@"iPhone 8 Plus";
    if([deviceModel isEqualToString:@"iPhone10,3"])     return@"iPhone X";
    if([deviceModel isEqualToString:@"iPhone10,6"])     return@"iPhone X";
    
    //iPod 系列
    if ([deviceModel isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceModel isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceModel isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceModel isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceModel isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    
    //iPad 系列
    if ([deviceModel isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceModel isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceModel isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceModel isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([deviceModel isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([deviceModel isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    
    if ([deviceModel isEqualToString:@"iPad3,1"])      return @"iPad 3(WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,2"])      return @"iPad 3(CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,3"])      return @"iPad 3(4G)";
    if ([deviceModel isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,5"])      return @"iPad 4 (4G)";
    if ([deviceModel isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    if ([deviceModel isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([deviceModel isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([deviceModel isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([deviceModel isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceModel isEqualToString:@"x86_64"])       return @"Simulator";
    if ([deviceModel isEqualToString:@"iPad4,4"]||[deviceModel isEqualToString:@"iPad4,5"]||[deviceModel isEqualToString:@"iPad4,6"])
        return @"iPad mini 2";
    if ([deviceModel isEqualToString:@"iPad4,7"]||[deviceModel isEqualToString:@"iPad4,8"]||[deviceModel isEqualToString:@"iPad4,9"])
        return @"iPad mini 3";
    return deviceModel;
    
}


+(NSString *)dateSortFormat:(NSString *)dateString{
    
    NSDateFormatter *parseFormat = [[NSDateFormatter alloc] init];
    [parseFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * date = [parseFormat dateFromString:dateString];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    NSString *formatStr = [dateFormatter stringFromDate:date];
    
    return formatStr;
}

+(NSString *)currentDateFormat{
    NSDate * date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *formatStr = [dateFormatter stringFromDate:date];
    return formatStr;
}


+(BOOL) isMobileNo:(NSString *)mobile{
    
    NSString *pattern =@"^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:mobile];
    return isMatch;
}


+(BOOL) isEmail:(NSString *)mobile{
    NSString *pattern =@"\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:mobile];
    return isMatch;
}

+ (NSString *)uuidString
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
    return [uuid lowercaseString];
}

@end
