//
//  UIColor+CO.m
//  COCategory
//
//  Created by carlos on 13-9-10.
//  Copyright (c) 2013年 carlosk. All rights reserved.
//

#import "UIColor+CO.h"

@implementation UIColor (CO)
//颜色转换成Image
- (UIImage *)coTransformImage
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


@end
