//
//  UIBarButtonItem+BarButtonItem.h
//  RuntimeLearn
//
//  Created by luo.h on 16/2/19.
//  Copyright © 2016年 appledev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BarButtonItem)



+ (instancetype)itemWithimage:(NSString *)imageName addTarget:(id)target action:(SEL)action;


+ (instancetype)itemWithimage:(NSString *)imageName addTarget:(id)target action:(SEL)action title:(NSString *)title;


/**
 *  传入一个标题文字,普通状态为橘色,不可用状态为灰色
 *
 *  @param title
 *  @param target
 *  @param action
 *
 *  @return
 */
+ (instancetype)itemWithTitle:(NSString *)title addTarget:(id)target action:(SEL)action;

@end
