//
//  UIView+Event.h
//  RuntimeLearn
//
//  Created by luo.h on 16/2/17.
//  Copyright © 2016年 PCGROUP. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ViewTapActionBlock)();

@interface UIView (Event)
//方式一
- (void)addViewControlEvents:(UIControlEvents)controlEvents withBlock:(ViewTapActionBlock)block;


//方式二
-(void)addTapAction:(id)target action:(SEL)action;

@end

/*为View 添加点击事件*/