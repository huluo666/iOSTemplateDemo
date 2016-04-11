//
//  UILabel+ColorText.h
//  UILabelColor
//
//  Created by luo.h on 15/11/5.
//  Copyright © 2015年 l.h. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ColorText)


/**
 *  设置字体
 */
- (void)setFont:(UIFont *)font range:(NSRange)range;
- (void)setFont:(UIFont *)font beforeOccurenceOfString:(NSString*)separator;
- (void)setFont:(UIFont *)font afterOccurenceOfString:(NSString*)separator;
- (void)setFont:(UIFont *)font substring:(NSString*)substring;
- (void)setFont:(UIFont *)font WithtColor:(UIColor *)textColor  substring:(NSString*)substring;


/**
 *  设置文本颜色
 */
- (void)setTextColor:(UIColor *)textColor range:(NSRange)range;
- (void)setTextColor:(UIColor *)textColor beforeOccurenceOfString:(NSString*)separator;
- (void)setTextColor:(UIColor *)textColor afterOccurenceOfString:(NSString*)separator;
- (void)setTextColor:(UIColor *)textColor String:(NSString*)searchString;
- (void)setTextColor:(UIColor *)textColor String:(NSString*)searchString underLineColor:(UIColor*)underlineColor;
- (void)setTextColor:(UIColor *)textColor fromOccurenceOfString:(NSString*)separator1 toOccurenceOfString:(NSString*)separator2;


/** 添加下划线*/
- (void)setTextUnderLine:(UIColor *)lineColor range:(NSRange)range;
- (void)setTextWithoutUnderLineInRange:(NSRange)range;
/**添加删除线 */
-(void)setTextDeleteLine:(UIColor *)lineColor range:(NSRange)range;
/**斜体*/
-(void)setObliqueness:(id)obliqueness range:(NSRange)range;
/** 字间距 */
-(void)setWordSpace:(id)space range:(NSRange)range;


/** 添加多个属性*/
-(void)setTextAttributes:(NSDictionary *)attributes range:(NSRange)range;

/*添加图片*/
-(void)addImgAttachment:(UIImage *)image size:(CGSize)size range:(NSRange)range;


@end
