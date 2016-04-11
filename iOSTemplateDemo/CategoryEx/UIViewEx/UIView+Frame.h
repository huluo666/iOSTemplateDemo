//
//  UIView+Frame.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>


//设备屏幕尺寸 屏幕Size
#define SCREEN_SIZE      [[UIScreen mainScreen] bounds].size
#define SCREEN_HEIGHT   ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)

@interface UIView (Frame)
// shortcuts for frame properties
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

// shortcuts for positions
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;


@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;


//Next Add By PConline 2015-12-29 09:53:42
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;

@property (nonatomic) BOOL hiddenWithAnimation;

//得到此view 所在的viewController
- (UIViewController *)viewController;
//移除所有子视图
- (void)removeAllSubviews;



- (void)centerInRect:(CGRect)rect;
- (void)centerVerticallyInRect:(CGRect)rect;
- (void)centerHorizontallyInRect:(CGRect)rect;

- (void)centerInSuperView;
- (void)centerVerticallyInSuperView;
- (void)centerHorizontallyInSuperView;

- (void)centerHorizontallyBelow:(UIView *)view padding:(CGFloat)padding;
- (void)centerHorizontallyBelow:(UIView *)view;



#pragma mark -
#pragma mark----Add By PConline luo.h 2015-12-29 09:41:55---------

// Move via offset
- (void) moveBy: (CGPoint) delta;

// Scaling
- (void) scaleBy: (CGFloat) scaleFactor;

//View 添加点击事件
- (void)addTarget:(id)target tapAction:(SEL)action;

#pragma mark ---- Add by PCAutoBuy 2016-1-11 ------
/**
 *  应用贝塞尔曲线实现圆角
 *
 *  @param cornerRadii 圆角位置
 *  @param corner      圆角大小
 */
- (void)setCornerWithCornerRadii:(CGSize)cornerRadii byRoundingCorners:(UIRectCorner)corner;
@end