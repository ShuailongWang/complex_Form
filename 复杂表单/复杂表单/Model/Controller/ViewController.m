//
//  ViewController.m
//  复杂表单
//
//  Created by admin on 17/7/20.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "ViewController.h"
#import "TPKeyboardAvoidingTableView.h"
#import "RGAppointSectionView.h"
#import "ListModel.h"
#import "ListTFCell.h"
#import "ListTVCell.h"
#import "ListPickCell.h"
#import "ListCheckCell.h"
#import "ListTwoPickCell.h"
#import "FormModel.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) TPKeyboardAvoidingTableView *myTableView;
@property (nonatomic, strong) NSArray *myData;
@property (nonatomic, strong) FormModel *formModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupUI];
}
-(NSArray *)myData{
    if (nil == _myData) {
        _myData = [ListModel ListModelWithData];
    }
    return _myData;
}
-(FormModel *)formModel{
    if (nil == _formModel) {
        _formModel = [[FormModel alloc]init];
    }
    return _formModel;
}

-(void)setupUI{
    if (nil == _myTableView) {
        _myTableView = [[TPKeyboardAvoidingTableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        
        UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, 80)];
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, 10, KScreen_Width - 40, 40)];
        [button setTitle:@"提交" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        [footerView addSubview:button];
        
        _myTableView.tableFooterView = footerView;
        [self.view addSubview:_myTableView];
    }
}
- (void)clickButton{
    NSLog(@"%@", self.formModel);
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.myData.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.myData[section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListModel *model = self.myData[indexPath.section][indexPath.row];
    
    if ([model.cellType isEqualToString:@"Cell_TF"]) {
        
        ListTFCell *cell = [ListTFCell cellWithTableView:tableView];
        [cell refreshContent:model formModel:self.formModel];
        return cell;
        
    }else if ([model.cellType isEqualToString:@"Cell_PICK"]) {
        
        ListPickCell *cell = [ListPickCell cellWithTableView:tableView];
        [cell refreshContent:model formModel:self.formModel];
        return cell;
        
    }else if ([model.cellType isEqualToString:@"Cell_TWOPICK"]) {
        
        ListTwoPickCell *cell = [ListTwoPickCell cellWithTableView:tableView];
        [cell refreshContent:model formModel:self.formModel];
        return cell;
        
    }else if ([model.cellType isEqualToString:@"Cell_CHECK"]) {
        
        ListCheckCell *cell = [ListCheckCell cellWithTableView:tableView];
        [cell refreshContent:model formModel:self.formModel];
        return cell;
        
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    RGAppointSectionView *sectionView = [[RGAppointSectionView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, 50)];
    if (section == 0) {
        [sectionView creatTextStr:@"填写预约单" textAlignment:NSTextAlignmentLeft textColor:[UIColor blackColor] FontOfSize:16 isShowLine:YES];
        sectionView.backgroundColor = [UIColor whiteColor];
    }else if(section == 1){
        [sectionView creatTextStr:@"咨询内容" textAlignment:NSTextAlignmentLeft textColor:[UIColor blackColor] FontOfSize:16 isShowLine:YES];
        sectionView.backgroundColor = [UIColor whiteColor];
    }
    return sectionView;
}


@end
