//
//  BaseTableViewController.h
//  reader
//
//  Created by huang on 17/2/27.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
//适配ios11系统
@property (nonatomic,strong) UITableView *tableView;

@end
