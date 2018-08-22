//
//  MenuItem.h
//  reader
//
//  Created by huang on 17/3/2.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYYMenuItem : NSObject

#define   CreateMenuItem(IconPath, Title,SubTitle) [HYYMenuItem createMenuWithIconPath:IconPath title:Title subTitle:SubTitle]

#define     CreateMenuItemWithImage(IconPath, Title,rightIconURL) [HYYMenuItem createMenuWithIconPath:IconPath title:Title Image:rightIconURL]
/**
 *  左侧图标路径
 */
@property (nonatomic, strong) NSString *iconPath;

/**
 *  标题
 */
@property (nonatomic, strong) NSString *title;

/**
 *  副标题
 */
@property (nonatomic, strong) NSString *subTitle;

/**
 *  副图片URL
 */
@property (nonatomic, strong) NSString *rightIconURL;

/**
 *  是否显示红点
 */
@property (nonatomic, assign) BOOL showRightRedPoint;

+ (HYYMenuItem *) createMenuWithIconPath:(NSString *)iconPath title:(NSString *)title subTitle:(NSString *)subTitle;

+ (HYYMenuItem *) createMenuWithIconPath:(NSString *)iconPath title:(NSString *)title Image:(NSString *)rightIconURL;


@end
