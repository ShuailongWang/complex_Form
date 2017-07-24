//
//  ListPickCell.m
//  复杂表单
//
//  Created by admin on 17/7/20.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "ListPickCell.h"

@interface ListPickCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (nonatomic, strong) ListModel *model;
@property (nonatomic, strong) FormModel *formModel;

@end

@implementation ListPickCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"ListPickCell";
    ListPickCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

+(CGFloat)cellForHeight{
    return 50;
}

- (void)refreshContent:(ListModel*)model formModel:(FormModel*)formModel{
    self.model = model;
    self.formModel = formModel;
    
    self.titleLabel.text = model.title;
    [self.rightButton setTitle:[formModel valueForKey:model.key] forState:UIControlStateNormal];
}


- (IBAction)clickButton {
    if (self.model.list.count > 0) {
        
        [ActionSheetStringPicker showPickerWithTitle:@"title" rows:self.model.list initialSelection:2 doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
            
            [self.formModel setValue:selectedValue forKey:self.model.key];
            [self.rightButton setTitle:selectedValue forState:UIControlStateNormal];
            
        } cancelBlock:nil origin:self.contentView];
    }
}

@end
