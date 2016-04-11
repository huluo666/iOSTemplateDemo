//
//  CustomNavigationController.h
//  RuntimeLearn
//
//  Created by luo.h on 16/2/1.
//  Copyright © 2016年 PCGROUP. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    PC_GestureRecognizerTypePan,     //拖动模式
    PC_GestureRecognizerTypeEdgePan, //边界拖动模式
} PC_GestureRecognizerType;


@interface CustomNavigationController : UINavigationController


@end

@interface UIViewController(NavigationGesture)

/**
 *   是否禁止手势返回（避免手势密码等手势冲突）
 */
@property (nonatomic, assign) BOOL interactivePopGestureDisabled;

@end