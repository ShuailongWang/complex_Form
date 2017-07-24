//
//  ListTwoPickCell.m
//  复杂表单
//
//  Created by admin on 17/7/20.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "ListTwoPickCell.h"

@interface ListTwoPickCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (nonatomic, strong) ListModel *model;
@property (nonatomic, strong) FormModel *formModel;

@end

@implementation ListTwoPickCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"ListTwoPickCell";
    ListTwoPickCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
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
    
    NSArray *arr = [formModel valueForKey:model.key];
    
    if (arr.count > 0) {
        [self.leftButton setTitle:arr[0] forState:UIControlStateNormal];
        [self.rightButton setTitle:arr[1] forState:UIControlStateNormal];
    }
}

//点击事件
- (IBAction)clickButton {
    
    if (self.model.list.count > 0) {
        
        [ActionSheetMultipleStringPicker showPickerWithTitle:@"title" rows:self.model.list initialSelection:@[@0, @0] doneBlock:^(ActionSheetMultipleStringPicker *picker, NSArray *selectedIndexes, id selectedValues) {
            
            [self.formModel setValue:selectedValues forKey:self.model.key];
            
            //赋值
            [self.leftButton setTitle:selectedValues[0] forState:UIControlStateNormal];
            [self.rightButton setTitle:selectedValues[1] forState:UIControlStateNormal];
            
        } cancelBlock:nil origin:self.contentView];
    }
}

@end
