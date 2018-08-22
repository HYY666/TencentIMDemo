//
//  MenuItem.m
//  reader
//
//  Created by huang on 17/3/2.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import "HYYMenuItem.h"

@implementation HYYMenuItem

+ (HYYMenuItem *)createMenuWithIconPath:(NSString *)iconPath title:(NSString *)title subTitle:(NSString *)subTitle{
    HYYMenuItem *item = [[HYYMenuItem alloc]init];
    item.iconPath = iconPath;
    item.title = title;
    item.subTitle = subTitle;
    return item;

}
+ (HYYMenuItem *)createMenuWithIconPath:(NSString *)iconPath title:(NSString *)title  Image:(NSString *)rightIconURL {
    HYYMenuItem *item = [[HYYMenuItem alloc]init];
    item.iconPath = iconPath;
    item.title = title;
    item.rightIconURL = rightIconURL;
    return item;
    
}


@end
