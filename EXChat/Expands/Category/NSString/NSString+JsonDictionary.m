//
//  NSString+JsonDictionary.m
//  Yu+
//
//  Created by 贝尔希斯曼 on 2016/12/19.
//  Copyright © 2016年 beierxisiman. All rights reserved.
//

#import "NSString+JsonDictionary.h"

@implementation NSString (JsonDictionary)


//字典转为Json字符串
+(NSString *)dictionaryToJson:(NSDictionary *)dic
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}



@end
