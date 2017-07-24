//
//  FormModel.m
//  复杂表单
//
//  Created by admin on 17/7/20.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "FormModel.h"
#import "ListModel.h"
#import "MJExtension.h"

@implementation FormModel

+(FormModel*)formModelFromDict:(NSDictionary *)dict{
    return [FormModel mj_objectWithKeyValues:dict];
}

-(BOOL)submitCheck:(NSArray*)dataArr{
    BOOL isSubmit = YES;

    if (self.name.length == 0) {
        if (dataArr.count > 0) {
            ListModel *model = dataArr[0];
            model.errText = @"姓名不能为空";
        }
        isSubmit = NO;
    }
    
    return isSubmit;
}

@end
