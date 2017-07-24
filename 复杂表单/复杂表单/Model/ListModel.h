//
//  ListModel.h
//  复杂表单
//
//  Created by admin on 17/7/20.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject

@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSString *placeholder;
@property (nonatomic, copy)   NSString *key;
@property (nonatomic, copy)   NSString *errText;
@property (nonatomic, copy)   NSString *cellType;
@property (nonatomic, strong) NSNumber *maxInputLength;
@property (nonatomic, strong) NSArray *list;

+ (NSArray*)ListModelWithData;

@end
