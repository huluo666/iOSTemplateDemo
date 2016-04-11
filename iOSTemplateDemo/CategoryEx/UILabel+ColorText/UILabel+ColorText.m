//
//  UILabel+ColorText.m
//  UILabelColor
//
//  Created by luo.h on 15/11/5.
//  Copyright © 2015年 l.h. All rights reserved.
//

#import "UILabel+ColorText.h"

@implementation UILabel (ColorText)


- (void)setFont:(UIFont *)font range:(NSRange)range
{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString: self.attributedText];
    [text addAttribute: NSFontAttributeName
                 value: font
                 range: range];
    
    [self setAttributedText: text];
}

- (void)setFont:(UIFont *)font beforeOccurenceOfString:(NSString*)separator{
    NSRange range = [self.text rangeOfString:separator];
    if (range.location != NSNotFound)
    {
        range.length = range.location;
        range.location = 0;
        [self setFont:font range:range];
    }
}

- (void)setFont:(UIFont *)font afterOccurenceOfString:(NSString*)separator{
    NSRange range = [self.text rangeOfString:separator];
    if (range.location != NSNotFound)
    {
        range.location ++;
        range.length = self.text.length - range.location;
        [self setFont:font range:range];
    }
}

- (void) setFont:(UIFont*)font substring:(NSString*)substring {
    NSRange range = [self.text rangeOfString:substring];
    if (range.location != NSNotFound)
    {
        [self setFont:font range:range];
    }
}


- (void) setFont:(UIFont *)font WithtColor:(UIColor *)textColor  substring:(NSString*)substring
{
    NSRange range = [self.text rangeOfString:substring];
    if (range.location != NSNotFound)
    {
        [self setFont:font range:range];
        [self setTextColor:textColor range:range];
    }
}




- (void)setTextColor:(UIColor *)textColor range:(NSRange)range
{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString: self.attributedText];
    [text addAttribute: NSForegroundColorAttributeName
                 value: textColor
                 range: range];
    
    [self setAttributedText: text];
}



- (void)setTextColor:(UIColor *)textColor beforeOccurenceOfString:(NSString*)separator{
    
    NSRange range = [self.text rangeOfString:separator];
    
    if (range.location != NSNotFound)
    {
        range.length = range.location;
        range.location = 0;
        [self setTextColor:textColor range:range];
    }
}

- (void)setTextColor:(UIColor *)textColor afterOccurenceOfString:(NSString*)separator{
    
    NSRange range = [self.text rangeOfString:separator];
    
    if (range.location != NSNotFound)
    {
        range.location ++;
        range.length = self.text.length - range.location;
        [self setTextColor:textColor range:range];
    }
}



- (void)setTextColor:(UIColor *)textColor String:(NSString*)searchString
{
    NSRange range = [self.text rangeOfString:searchString];
    if (range.location != NSNotFound)
    {
        [self setTextColor:textColor range:range];
    }
}


- (void)setTextColor:(UIColor *)textColor String:(NSString*)searchString underLineColor:(UIColor*)underlineColor
{
    NSRange range = [self.text rangeOfString:searchString];
    if (range.location != NSNotFound)
    {
        [self setTextColor:textColor range:range];
        [self setTextUnderLine:underlineColor range:range];
    }
}


- (void)setTextUnderLine:(UIColor *)lineColor range:(NSRange)range
{
    NSMutableAttributedString *text = [self.attributedText mutableCopy];
    
    [text addAttribute:NSUnderlineStyleAttributeName
                 value:@(NSUnderlineStyleSingle|NSUnderlineByWord) //[NSNumber numberWithInt:NSSingleUnderlineStyle]
                 range:range];
    
    [text addAttribute:NSUnderlineColorAttributeName value:lineColor range:range];
    self.attributedText = text;
}


- (void)setTextWithoutUnderLineInRange:(NSRange)range
{
    NSMutableAttributedString *text = [self.attributedText mutableCopy];
    
    [text removeAttribute:NSUnderlineStyleAttributeName
                    range:range];
    
    self.attributedText = text;
}


- (void)setTextColor:(UIColor *)textColor fromOccurenceOfString:(NSString*)separator1 toOccurenceOfString:(NSString*)separator2
{
    NSRange rangeFrom = [self.text rangeOfString:separator1];
    NSRange rangeTo = [self.text rangeOfString:separator2 options:0 range:NSMakeRange(rangeFrom.location,self.text.length-rangeFrom.location)];
    
    if (rangeFrom.location != NSNotFound)
    {
        rangeFrom.location ++;
        if ( rangeTo.location == NSNotFound)
            rangeFrom.length = self.text.length - rangeFrom.location;
        else{
            rangeFrom.length = rangeTo.location - rangeFrom.location;
        }
        [self setTextColor:textColor range:rangeFrom];
        if ([textColor isEqual:[UIColor clearColor]] == YES)
        {
            [self setTextUnderLine:[UIColor blueColor] range:rangeFrom];
        }
    }
}



-(void)setTextDeleteLine:(UIColor *)lineColor range:(NSRange)range
{
    NSMutableAttributedString *text = [self.attributedText mutableCopy];
    [text addAttribute:NSStrikethroughStyleAttributeName
                 value:@(YES)
                 range:range];
    
    [text addAttribute:NSUnderlineColorAttributeName value:lineColor range:range];
    self.attributedText = text;
}


-(void)setObliqueness:(id)obliqueness range:(NSRange)range{
    NSMutableAttributedString *text = [self.attributedText mutableCopy];
    [text addAttribute:NSObliquenessAttributeName value:obliqueness range:range];
    self.attributedText = text;
}


-(void)setWordSpace:(id)space range:(NSRange)range;
{
    NSMutableAttributedString *text = [self.attributedText mutableCopy];
    [text addAttribute:NSKernAttributeName value:space range:range];
    self.attributedText = text;
}


/** 设置多个属性*/
-(void)setTextAttributes:(NSDictionary *)attributes range:(NSRange)range
{
    NSMutableAttributedString *text = [self.attributedText mutableCopy];
    [text addAttributes:attributes range:range];
    self.attributedText = text;
}


/*添加图片*/
-(void)addImgAttachment:(UIImage *)image size:(CGSize)size range:(NSRange)range
{
    NSMutableAttributedString *text = [self.attributedText mutableCopy];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [self imageWithImage:image scaleToSize:size];
    
    NSAttributedString *iconAttributedString = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [text replaceCharactersInRange:range withAttributedString:iconAttributedString];
    self.attributedText = text;
}


-(UIImage*)imageWithImage:(UIImage*)image scaleToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
