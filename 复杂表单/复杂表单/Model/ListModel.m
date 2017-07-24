//
//  ListModel.m
//  复杂表单
//
//  Created by admin on 17/7/20.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "ListModel.h"
#import "MJExtension.h"

@implementation ListModel

+ (NSArray*)ListModelWithData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"form" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    NSArray *myData = [ListModel mj_objectArrayWithKeyValuesArray:array];
    
    return myData;
}

@end
