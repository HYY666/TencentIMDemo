//
//  MenuTableViewCell.h
//  reader
//
//  Created by huang on 17/3/2.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HYYMenuItem.h"
#import "BaseTableViewCell.h"


@interface MenuTableViewCell : BaseTableViewCell

@property (nonatomic,strong) HYYMenuItem *menuItem;

+ (CGFloat)calculateHeightWith:(HYYMenuItem *)mission;
@end
