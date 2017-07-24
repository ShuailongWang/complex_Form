//
//  RGAppointSectionView.m
//  RGPsyCloud
//
//  Created by admin on 17/4/21.
//  Copyright © 2017年 北京奥泰瑞格科技有限公司. All rights reserved.
//

#import "RGAppointSectionView.h"
#import "UIView+Extension.h"

#define RGBA(r, g, b, a)        [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)            RGBA(r, g, b, 1.0f)

@interface RGAppointSectionView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation RGAppointSectionView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        if (nil == _titleLabel) {
            _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, self.width - 30, self.height)];
            _titleLabel.font = [UIFont systemFontOfSize:14];
            _titleLabel.textColor = RGB(63, 189, 181);
            _titleLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:_titleLabel];
        }
        if (nil == _lineView) {
            _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height - 1, self.width, 1)];
            _lineView.backgroundColor = [UIColor grayColor];
            [self addSubview:_lineView];
        }
    }
    return self;
}

-(void)creatTextStr:(NSString*)textStr textAlignment:(NSTextAlignment)textAlignment  textColor:(UIColor*)textColor FontOfSize:(CGFloat)fontSize isShowLine:(BOOL)isShowLine{
    self.titleLabel.text = textStr;
    self.titleLabel.textAlignment = textAlignment;
    self.titleLabel.textColor = textColor;
    self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    self.lineView.hidden = !isShowLine;
}



@end
