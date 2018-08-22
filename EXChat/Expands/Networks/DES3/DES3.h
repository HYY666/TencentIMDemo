//
//  DES3.h
//  aduimage
//
//  Created by huangboning on 15-6-24.
//  Copyright (c) 2015年 huangboning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTMBase64.h"
#import <CommonCrypto/CommonCryptor.h>

@interface DES3 : NSObject

+ (NSString *)encryptWithText:(NSString *)plantText key:(NSString *)key;//加密
+ (NSString *)decryptWithText:(NSString *)encryText key:(NSString *)key;//解密

@end
