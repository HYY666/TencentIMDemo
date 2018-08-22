//
//  Header.h
//  EXChat
//
//  Created by Apple on 2018/8/3.
//  Copyright © 2018年 jiusheng. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import "PhoneUtil.h"
#import "NSString+Valid.h"
#import "NSString+Additions.h"
#import "NSDate+Extension.h"
#import "NSDate+Utilities.h"
#import "UIColor+Additions.h"
#import "UIImage+Color.h"
#import "NSString+JsonDictionary.h"
#import "NSDictionary+JsonNSString.h"


#import "UserHelper.h"
#import "DataSource.h"
//友盟sdk
#import <UMMobClick/MobClick.h>
//下拉刷新
#import <MJRefresh/MJRefresh.h>
#import "HYYHudView.h"
#import "EMAlertView.h"


//使用简单的
#import <SVProgressHUD/SVProgressHUD.h>


//数据请求
#import "AFNetworking.h"

#import "ParameterHelper.h"

#import "NetworkManager.h"
#import "DataSource.h"
#import <MJExtension/MJExtension.h>

//!!!!!!!   添加这两个宏后坐标传递cgfloat  出问题
// 定义这个常量，就可以不用在开发过程中使用"mas_"前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"



#endif /* Header_h */
