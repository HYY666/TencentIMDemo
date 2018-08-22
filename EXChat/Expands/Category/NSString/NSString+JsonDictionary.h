//
//  NSString+JsonDictionary.h
//  Yu+
//
//  Created by 贝尔希斯曼 on 2016/12/19.
//  Copyright © 2016年 beierxisiman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JsonDictionary)

//字典转为Json字符串
+(NSString *)dictionaryToJson:(NSDictionary *)dic;


@end
