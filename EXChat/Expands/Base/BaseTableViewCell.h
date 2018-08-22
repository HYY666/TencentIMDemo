//
//  BaseTableViewCell.h
//  reader
//
//  Created by huang on 17/3/2.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CellLineStyle) {
    CellLineStyleNone,
    CellLineStyleDefault,
    CellLineStyleFill,
};




@interface BaseTableViewCell : UITableViewCell

/**
 *  左边距
 */
@property (nonatomic, assign) CGFloat leftSeparatorSpace;

/**
 *  右边距，默认0，要修改只能直接指定
 */
@property (nonatomic, assign) CGFloat rightSeparatorSpace;

@property (nonatomic, assign) CellLineStyle topLineStyle;
@property (nonatomic, assign) CellLineStyle bottomLineStyle;

@end
