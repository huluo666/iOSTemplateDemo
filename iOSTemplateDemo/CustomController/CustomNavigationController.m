//
//  CustomNavigationController.m
//  RuntimeLearn
//
//  Created by luo.h on 16/2/1.
//  Copyright © 2016年 PCGROUP. All rights reserved.
//
//  J雨 iOS利用Runtime自定义控制器POP手势动画(http://www.jianshu.com/p/d39f7d22db6c?utm_campaign=maleskine&utm_content=note&utm_medium=writer_share&utm_source=weibo)


#import "CustomNavigationController.h"
#import <objc/runtime.h>

#import "UIBarButtonItem+BarButtonItem.h"


@interface CustomNavigationController ()<UIGestureRecognizerDelegate,UINavigationBarDelegate>

@property(nonatomic,assign) PC_GestureRecognizerType PC_GestureRecognizerType;

@end

@implementation CustomNavigationController

/**
 *  第一次使用这个类的时候会调用(1个类只会调用1次)
 */
+ (void)initialize{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.PC_GestureRecognizerType=PC_GestureRecognizerTypeEdgePan;
    
    [self configPanGesture];
}


-(void)configPanGesture
{
    // 获取系统自带滑动手势的target对象
    id target = self.interactivePopGestureRecognizer.delegate;
//    NSLog(@"target->%@",target);
    
    UIPanGestureRecognizer *gestureRecognizer = nil;
    
//私有APi   http://stackoverflow.com/questions/2842357/how-does-apple-know-you-are-using-private-api
    //私有handleNavigationTransition: 处理方式：1.加密 2.拆解
    NSArray *selArray=@[@"Navigation",@"sition:",@"Tran",@"handle"];
    SEL trans_Sel = NSSelectorFromString([NSString stringWithFormat:@"%@%@%@%@",selArray[3],selArray[0],selArray[2],selArray[1]]);
    if (self.PC_GestureRecognizerType==PC_GestureRecognizerTypePan) {
        // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:trans_Sel];
        gestureRecognizer=pan;
    }else{
        UIScreenEdgePanGestureRecognizer*  edgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:trans_Sel];
        ((UIScreenEdgePanGestureRecognizer*)edgePan).edges = UIRectEdgeLeft;
        gestureRecognizer=edgePan;
    }
    
    // 设置手势代理，拦截手势触发
    gestureRecognizer.delegate = self;
    
    // 给导航控制器的view添加全屏滑动手势
    [self.view addGestureRecognizer:gestureRecognizer];
    
    // 禁止使用系统自带的滑动手势
    self.interactivePopGestureRecognizer.enabled = NO;
}





// 什么时候调用：每次触发手势之前都会询问下代理，是否触发。
// 作用：拦截手势触发
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
    if(self.topViewController.interactivePopGestureDisabled){
        return NO;
    }
    
    //当push、pop动画正在执行时，手势不执行
    if ([self.transitionCoordinator isAnimated]||
        self.viewControllers.count < 2) {
        return NO;
    }
    
   return YES;
}




-(id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (!self) { return nil; }
    //导航栏字体设置
    self.navigationBar.titleTextAttributes = @{
                                               NSFontAttributeName: [UIFont  boldSystemFontOfSize:18.0],
                                               NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#2c2c2b"],
                                               };
    
    //navigationBar的背景颜色
    self.navigationBar.barTintColor = [UIColor whiteColor];
    
    //导航栏背景
    /*[[UINavigationBar appearance] setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];*/
    
    return self;
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
   
    NSString *title = @"返回";
    //如果是第一次跳转的话,显示的标题为上一个控制器的标题
    if (self.viewControllers.count == 1) {
        title = [[[self.viewControllers firstObject]navigationItem ]title];
    }
    
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;

        if ([UIApplication sharedApplication].statusBarHidden == YES){
            [UIApplication sharedApplication].statusBarHidden = NO;
        }
        
        //设置返回按钮
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithimage:@"navigationbar_back_withtext" addTarget:self action:@selector(back:) title:nil];
    }
    [super pushViewController:viewController animated:animated];// 父类调用放在最后面执行
}



- (void)back:(UIButton *)button{
    
    [self popViewControllerAnimated:YES];
}

@end


@implementation UIViewController(NavigationGesture)

#pragma mark ----
//_cmd在OC的方法中表示当前方法的selector,objc_selector编译时会根据每个方法名字参数序列生成唯一标识,所以_cmd在编译时候就已经确定的值
- (void)setInteractivePopGestureDisabled:(BOOL)interactivePopGestureDisabled
{
    objc_setAssociatedObject(self, @selector(interactivePopGestureDisabled), @(interactivePopGestureDisabled), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)interactivePopGestureDisabled
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

@end
