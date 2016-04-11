//
//  UIBarButtonItem+BarButtonItem.m
//  RuntimeLearn
//
//  Created by luo.h on 16/2/19.
//  Copyright © 2016年 appledev. All rights reserved.
//

#import "UIBarButtonItem+BarButtonItem.h"

@implementation UIBarButtonItem (BarButtonItem)

+ (instancetype)itemWithimage:(NSString *)imageName addTarget:(id)target action:(SEL)action{
    
    UIButton *button = [[UIButton alloc]init];
    
    
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]] forState:UIControlStateHighlighted];
    
    button.size = button.currentBackgroundImage.size;
    
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

+ (instancetype)itemWithimage:(NSString *)imageName addTarget:(id)target action:(SEL)action title:(NSString *)title{
    
    UIButton *button = [[UIButton alloc]init];
    
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]] forState:UIControlStateHighlighted];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:RGB(68, 68, 68) forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}



+ (instancetype)itemWithTitle:(NSString *)title addTarget:(id)target action:(SEL)action{
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

@end
