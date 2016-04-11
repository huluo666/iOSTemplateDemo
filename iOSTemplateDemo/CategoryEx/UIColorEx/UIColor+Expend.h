//
//  UIColor+Expend.h
//  Qsend
//
//  Created by l.h on 14-6-19.
//  Copyright (c) 2014年 WeiXingApp. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIColor (Expend)
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

//参考 http://quding0308.iteye.com/blog/1743221
#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
+ (UIColor*) colorWithHexString:(NSString*)color;

+ (UIColor *)colorWithIntegralRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;

+(UIColor*)colorWithColor:(UIColor *)color;

+ (UIColor *)getRandomColor;

@end
