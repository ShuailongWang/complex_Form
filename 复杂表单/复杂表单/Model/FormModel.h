//
//  FormModel.h
//  复杂表单
//
//  Created by admin on 17/7/20.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormModel : NSObject

@property (nonatomic, copy)   NSString *name;
@property (nonatomic, strong) NSNumber *sex;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, copy)   NSString *tellPhone;
@property (nonatomic, copy)   NSString *phone;
@property (nonatomic, copy)   NSString *email;
@property (nonatomic, strong) NSNumber *roles;
@property (nonatomic, strong) NSNumber *courtyard;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, strong) NSNumber *consulObject;
@property (nonatomic, strong) NSArray *questionType;
@property (nonatomic, copy)   NSString *keyword;
@property (nonatomic, strong) NSNumber *tape;

+(FormModel*)formModelFromDict:(NSDictionary *)dict;
-(BOOL)submitCheck:(NSArray*)dataArr;

@end
