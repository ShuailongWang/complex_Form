//
//  ListTwoPickCell.h
//  复杂表单
//
//  Created by admin on 17/7/20.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTwoPickCell : UITableViewCell

- (void)refreshContent:(ListModel*)model formModel:(FormModel*)formModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
+ (CGFloat)cellForHeight;

@end
