//
//  UIView+Event.m
//  RuntimeLearn
//
//  Created by luo.h on 16/2/17.
//  Copyright © 2016年 PCGROUP. All rights reserved.
//

#import "UIView+Event.h"
#import <objc/runtime.h>

static char kViewEventsBlockKey;

@implementation UIView (Event)

/*方式 一*/
- (void)addViewControlEvents:(UIControlEvents)controlEvents withBlock:(ViewTapActionBlock)block {
    objc_setAssociatedObject(self, &kViewEventsBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewtapAction:)];
    [self addGestureRecognizer:tgr];
}

- (void)viewtapAction:(id)sender {
    ViewTapActionBlock block = (ViewTapActionBlock)objc_getAssociatedObject(self, &kViewEventsBlockKey);
    if (block) {
        block();
    }
}


/*方式 二*/
-(void)addTapAction:(id)target action:(SEL)action
{
    self.userInteractionEnabled=YES;
    UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
}

@end
