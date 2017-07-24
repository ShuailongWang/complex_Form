//
//  ListTFCell.m
//  复杂表单
//
//  Created by admin on 17/7/20.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "ListTFCell.h"
#import "ListModel.h"
#import "FormModel.h"

@interface ListTFCell()

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;      //标题
@property (nonatomic, strong) IBOutlet UITextField *textField;   //内容
@property (nonatomic, strong) IBOutlet UILabel *checkTipLabel;   //提示
@property (nonatomic, strong) IBOutlet UIView *bgView;           //背景
@property (nonatomic, strong) ListModel *model;         //
@property (nonatomic, strong) FormModel *formModel;     //

@end

@implementation ListTFCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"ListTFCell";
    
    ListTFCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
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
    _textField.text = @"";
    _textField.placeholder = @"";
    _checkTipLabel.text = @"";
}

- (void)refreshContent:(ListModel*)model formModel:(FormModel*)formModel{
    [self clearCellData];
    if (!model) {
        return;
    }
    _model = model;
    _formModel = formModel;
    
    self.titleLabel.text = model.title;
    self.textField.placeholder = model.placeholder;
    self.textField.text = [_formModel valueForKey:model.key];
    
}

//
- (void)textFiledEditChanged:(UITextField*)sender{
    
    [self.formModel setValue:sender.text forKey:self.model.key];

}


@end
