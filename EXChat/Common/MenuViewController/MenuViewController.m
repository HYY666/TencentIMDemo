//
//  MenuViewController.m
//  reader
//
//  Created by huang on 17/3/2.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[MenuTableViewCell class] forCellReuseIdentifier:@"MenuTableViewCell"];
    
}


#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data[section] count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuTableViewCell" forIndexPath:indexPath];
    HYYMenuItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.topLineStyle = CellLineStyleFill;
        }else{
            cell.topLineStyle = CellLineStyleNone;
        }
    }
    
    
    
    [cell setMenuItem:item];
    return cell;
}

#pragma mark UITableViewDelegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
