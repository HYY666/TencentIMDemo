//
//  NSDictionary+JsonNSString.m
//  reader
//
//  Created by huang on 17/3/16.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import "NSDictionary+JsonNSString.h"

@implementation NSDictionary (JsonNSString)

+ (NSDictionary *)stringToNSDictionary:(NSString *)jsonStr{
    NSData *JSONData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseJSON];
    return dic;

}









@end
