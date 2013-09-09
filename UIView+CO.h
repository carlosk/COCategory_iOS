//
//  UIView+CO.h
//  MyFamework
//
//  Created by carlos on 13-9-7.
//  Copyright (c) 2013年 carlos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CO)
//根据Xib文件创建View
+(id)coCreateWithXib:(NSString *)xibName;


//用于添加多个子View加到本View里
-(void)coAddSubVs:(UIView *)object, ...;

//给view添加按键事件
-(void)coAddTagEven:(SEL) mSel withTarget:(id)target;

#pragma mark Frame
//设置y
-(void)coSetY:(float) y ;
//设置x
-(void)coSetX:(float) x ;
//设置x和y
-(void)coSetX:(float) x withY:(float)y;
//设置高度
-(void)coSetH:(float) h;
//设置宽度
-(void)coSetW:(float) w;
//设置高度和宽度
-(void)coSetW:(float) w withH:(float)h;
//设置Y坐标，距离aboveView的interval距离
-(void)coSetYAbove:(float)interval withView:(UIView *)aboveView;
//在父控件中左右居中
-(void)coAutoWCenter;
//在父控件中上下居中
- (void)coAutoHCenter;

@end
