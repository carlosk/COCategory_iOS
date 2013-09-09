//
//  UILabel+CO.m
//  MyFamework
//
//  Created by carlos on 13-9-7.
//  Copyright (c) 2013年 carlos. All rights reserved.
//

#import "UILabel+CO.h"
#import "UIView+CO.h"
@implementation UILabel (CO)
//根据文字内容设置高度
- (void)coSetAutoHeightWithContent{
    float height = [self coSizeWithContent];
    [self coSetH:height];
}

//根据内容和宽度获取高度
-(float )coSizeWithContent{
    
    return [self.text sizeWithFont:self.font  constrainedToSize:CGSizeMake(self.frame.size.width,100000)  lineBreakMode:UILineBreakModeWordWrap].height;
}

@end