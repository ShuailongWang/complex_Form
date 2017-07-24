//
//  ListCheckCell.m
//  复杂表单
//
//  Created by admin on 17/7/20.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "ListCheckCell.h"
#import "Masonry.h"

@interface ListCheckCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (nonatomic, strong) FormModel *formModel;

@end

@implementation ListCheckCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"ListCheckCell";
    ListCheckCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


+(CGFloat)cellForHeight{
    return 50;
}

//清空
- (void)clearCellData{
    _titleLabel.text = @"";
}

- (void)refreshContent:(ListModel*)model formModel:(FormModel*)formModel{
    if (nil == model) {
        return;
    }
    self.formModel = formModel;
    
    self.titleLabel.text = model.title;
    if (model.list.count > 0) {
        [self.leftBtn setTitle:model.list[0] forState:UIControlStateNormal];
        [self.rightBtn setTitle:model.list[1] forState:UIControlStateNormal];
    }
}

@end
