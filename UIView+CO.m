//
//  UIView+CO.m
//  MyFamework
//
//  Created by carlos on 13-9-7.
//  Copyright (c) 2013年 carlos. All rights reserved.
//

#import "UIView+CO.h"

@implementation UIView (CO)
//根据Xib文件创建View
+(id)coCreateWithXib:(NSString *)xibName;
{
    if (!xibName) {
        id temp = [[[self class] alloc]init];
        return temp;
    }else{
        NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil];
        return [nibView objectAtIndex:0];
    }
}

//把所有的子View加在父View里
-(void)coAddSubVs:(UIView *)object, ...
{
    va_list argp = NULL;
    va_start(argp, object);
    UIView *tempObject = nil;
    tempObject = object;
    while(tempObject != nil){
        [self addSubview:tempObject];
        tempObject = va_arg(argp, UIView *);
    }
    va_end(argp);
}

//给view添加按键事件
-(void)coAddTagEven:(SEL) mSel withTarget:(id)target{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:mSel];
    [self addGestureRecognizer:singleTap];
}

#pragma mark Frame
-(void)coSetY:(float) y {
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

-(void)coSetX:(float) x {
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

-(void)coSetX:(float) x withY:(float)y{
    self.frame = CGRectMake(x, y, self.frame.size.width, self.frame.size.height);
}

-(void)coSetH:(float) h {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, h);
}

-(void)coSetW:(float) w {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, w, self.frame.size.height);
}

-(void)coSetW:(float) w withH:(float)h{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, w, h);
}
//设置Y坐标，距离aboveView的interval距离
-(void)coSetYAbove:(float)interval withView:(UIView *)aboveView{
    self.frame = CGRectMake(self.frame.origin.x, aboveView.frame.origin.y + aboveView.frame.size.height+interval, self.frame.size.width, self.frame.size.height);
}
//在父控件中左右居中
-(void)coAutoWCenter{
    CGRect superF = self.superview.frame;
    CGRect selfF = self.frame;
    self.frame  = CGRectMake(superF.size.width/2 - selfF.size.width/2, selfF.origin.y, superF.size.width, selfF.size.height);
}
//在父控件中上下居中
- (void)coAutoHCenter{
    CGRect superF = self.superview.frame;
    CGRect selfF = self.frame;
    self.frame  = CGRectMake(selfF.origin.x, superF.size.height/2 - selfF.size.height/2, superF.size.width, selfF.size.height);
}

//清理背景色
- (void) clearBackground{
    self.backgroundColor = [UIColor clearColor];
}

@end
