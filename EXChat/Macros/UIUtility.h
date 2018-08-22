//
//  UIUtility.h
//  EXChat
//
//  Created by Apple on 2018/8/3.
//  Copyright © 2018年 jiusheng. All rights reserved.
//

#ifndef UIUtility_h
#define UIUtility_h

//尺寸
#define SCREEN_BOUNDS  [UIScreen mainScreen].bounds
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height


#define iPhoneX ([UIScreen mainScreen].bounds.size.height == 812)

#define HEIGHT_X              ([UIScreen mainScreen].bounds.size.height)- ([[UIApplication sharedApplication] statusBarFrame].size.height) - (self.navigationController.navigationBar.frame.size.height)

#define Kinmo_iPhoneX (SCREEN_WIDTH == 375.f && SCREEN_HEIGHT == 812.f ? YES : NO)
#define kWRNavBarBottom (Kinmo_iPhoneX ? 88.f : 64.f)
#define kWTabbarHeight (Kinmo_iPhoneX ? (49.f+34.f) : 49.f)
#define kWBottomHeight (Kinmo_iPhoneX ? (34.f) : 0)
#define     BORDER_WIDTH_1PX            ([[UIScreen mainScreen] scale] > 0.0 ? 1.0 / [[UIScreen mainScreen] scale] : 1.0)
#define     HEIGHT_TABBAR               (Kinmo_iPhoneX ? (49.f+34.f) : 49.f)
#define     HEIGHT_NAVBAR               (Kinmo_iPhoneX ? 88.f : 64.f)
#define     NAVBAR_ITEM_FIXED_SPACE     5.0f

#define  HOT_ICON_WIDTH  (SCREEN_WIDTH-30)/2


#define SCALE_WIDTH  [UIScreen mainScreen].bounds.size.width/375.0
#define SCALE_HEIGHT  [UIScreen mainScreen].bounds.size.height/667.0


#define SCREEN_SCALE    ([UIDevice currentDevice].screenScale)
#define __SCREEN_BOUNDS             [[UIScreen mainScreen] bounds]
#define __SCREEN_SIZE               [UIScreen mainScreen].bounds.size
#define __SCALE_W                 (__SCREEN_SIZE.width/375.0f)
#define __SCALE_H                 (__SCREEN_SIZE.width/375.0f)
#define h375(__h__)                  ceil(((__h__)*__SCALE_W))
#define w375(__w__)                  ceil(((__w__)*__SCALE_H))


// 定义通用颜色
#define kBlackColor         [UIColor blackColor]
#define kDarkGrayColor      [UIColor darkGrayColor]
#define kLightGrayColor     [UIColor lightGrayColor]
#define kWhiteColor         [UIColor whiteColor]
#define kGrayColor          [UIColor grayColor]
#define kRedColor           [UIColor redColor]
#define kGreenColor         [UIColor greenColor]
#define kBlueColor          [UIColor blueColor]
#define kCyanColor          [UIColor cyanColor]
#define kYellowColor        [UIColor yellowColor]
#define kMagentaColor       [UIColor magentaColor]
#define kOrangeColor        [UIColor orangeColor]
#define kPurpleColor        [UIColor purpleColor]
#define kClearColor         [UIColor clearColor]

#define kRandomFlatColor    [UIColor randomFlatColor]



//颜色
#define RGBA(r,g,b,a)         [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RGB(r,g,b)            [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define Color_666 [UIColor colorWithHexString:@"#666666"]
#define Color_999 [UIColor colorWithHexString:@"#999999"]
#define Color_333 [UIColor colorWithHexString:@"#333333"]
#define COLOR_WHITE [UIColor colorWithString:@"#ffffff"]
#define COLOR_GRAY [UIColor colorWithString:@"#646464"]
#define COLOR_RED  RGB(225, 84, 96)
#define COLOR_BLACK [UIColor colorWithString:@"#323232"]
#define COLOR_LIGHTGREEN RGB(255,107,74)

#define COLOR_MAIN  RGB(248, 175, 42)

#define COLOR_LIGHTGRAY [UIColor colorWithString:@"#909090"]
#define COLOR_LINE_CELL [UIColor colorWithString:@"#d7d7d7"]
#define COLOR_RGB_WHITETWO  RGB(250,250,250)
#define COLOR_RGB_WHITETHREE  RGB(229,229,229)
#define COLOR_RGB_GREYISHBROWN  RGB(67,67,67)
#define COLOR_LINE_SEGMENT [UIColor colorWithString:@"#e1e1e1"]
#define COLOR_LOGIN_YELLOW  [UIColor colorWithString:@"#fcfade"]

#define RGBACOLOR(r,g,b,a) \
[UIColor colorWithRed:r/256.f green:g/256.f blue:b/256.f alpha:a]

#define RGBOF(rgbValue)     [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define RGBA_OF(rgbValue)   [UIColor colorWithRed:((float)(((rgbValue) & 0xFF000000) >> 24))/255.0 \
green:((float)(((rgbValue) & 0x00FF0000) >> 16))/255.0 \
blue:((float)(rgbValue & 0x0000FF00) >> 8)/255.0 \
alpha:((float)(rgbValue & 0x000000FF))/255.0]

#define RGBAOF(v, a)        [UIColor colorWithRed:((float)(((v) & 0xFF0000) >> 16))/255.0 \
green:((float)(((v) & 0x00FF00) >> 8))/255.0 \
blue:((float)(v & 0x0000FF))/255.0 \
alpha:a]


// 定义通用颜色
#define kBlackColor         [UIColor blackColor]
#define kDarkGrayColor      [UIColor darkGrayColor]
#define kLightGrayColor     [UIColor lightGrayColor]
#define kWhiteColor         [UIColor whiteColor]
#define kGrayColor          [UIColor grayColor]
#define kRedColor           [UIColor redColor]
#define kGreenColor         [UIColor greenColor]
#define kBlueColor          [UIColor blueColor]
#define kCyanColor          [UIColor cyanColor]
#define kYellowColor        [UIColor yellowColor]
#define kMagentaColor       [UIColor magentaColor]
#define kOrangeColor        [UIColor orangeColor]
#define kPurpleColor        [UIColor purpleColor]
#define kClearColor         [UIColor clearColor]

#define kRandomFlatColor    [UIColor randomFlatColor]


//字体宏
//7
#define FONT_7 [UIFont systemFontOfSize:7]
//9
#define FONT_9 [UIFont systemFontOfSize:9]
//10
#define FONT_10 [UIFont systemFontOfSize:10]
//11
#define FONT_11 [UIFont systemFontOfSize:11]
//12
#define FONT_12 [UIFont systemFontOfSize:12]
//13
#define FONT_13 [UIFont systemFontOfSize:13]
//14
#define FONT_14 [UIFont systemFontOfSize:14]
//15
#define FONT_15 [UIFont systemFontOfSize:15]
//16
#define FONT_16 [UIFont systemFontOfSize:16]
//17
#define FONT_17 [UIFont systemFontOfSize:17]
//18 （注释18与字号对应）
#define FONT_18 [UIFont systemFontOfSize:18]
//19
#define FONT_19 [UIFont systemFontOfSize:19]
//20 （注释20与字号对应）
#define FONT_20 [UIFont systemFontOfSize:20]
//25 （注释25与字号对应）
#define FONT_25 [UIFont systemFontOfSize:25]
//36
#define FONT_36 [UIFont systemFontOfSize:36]

//38
#define FONT_38 [UIFont systemFontOfSize:38]




#endif /* UIUtility_h */
