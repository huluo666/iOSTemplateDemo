//
//  CustomTabBarController.m
//  RuntimeLearn
//
//  Created by luo.h on 16/2/1.
//  Copyright © 2016年 PCGROUP. All rights reserved.
//

#import "CustomTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

#import "CustomNavigationController.h"

@interface CustomTabBarController ()<UINavigationControllerDelegate>

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self CreatRootViewController];
    [self changeTabBarStyle];
}


-(void)CreatRootViewController
{
    FirstViewController   *firstVC=[[FirstViewController alloc]init];
    SecondViewController *secVC=[[SecondViewController alloc]init];
    ThirdViewController  *thirdVC=[[ThirdViewController alloc]init];
    FourthViewController *fourthVC=[[FourthViewController alloc]init];

    NSString *title1=@"one";
    NSString *title2=@"two";
    NSString *title3=@"three";
    NSString *title4=@"fouth";
 
    UINavigationController *nvc1 =[self viewControllerWithTabTitle:title1 viewController:firstVC imageName:@"tabBar_home_normal" selectedImageName:@"tabBar_home_selected"];
    UINavigationController *nvc2 =[self viewControllerWithTabTitle:title2 viewController:secVC imageName:@"tabBar_market_normal" selectedImageName:@"tabBar_market_selected"];
    secVC.title=title2;
    UINavigationController *nvc3 =[self viewControllerWithTabTitle:title3 viewController:thirdVC imageName:@"tabBar_find_normal" selectedImageName:@"tabBar_find_selected"];
    thirdVC.title=title3;
    UINavigationController *nvc4 =[self viewControllerWithTabTitle:title4 viewController:fourthVC imageName:@"tabBar_order_normal" selectedImageName:@"tabBar_order_selected"];
    fourthVC.title=title4;

    nvc1.tabBarItem.tag=0;
    nvc2.tabBarItem.tag=1;
    nvc3.tabBarItem.tag=2;
    nvc4.tabBarItem.tag=3;
    
    self.viewControllers=@[nvc1,nvc2,nvc3,nvc4];
    NSLog(@"%d",(int)self.viewControllers.count);
}


-(UINavigationController *) viewControllerWithTabTitle:(NSString *)title
                                        viewController:(UIViewController*)viewController
                                             imageName:(NSString *)imgName
                                     selectedImageName:(NSString *)selectedImgName

{
    viewController.tabBarItem = [self createTabBarItemWithTitle:title
                                                      imageName:imgName
                                              selectedImageName:selectedImgName];
    //return UINavigationController;
    UINavigationController *nav= [[CustomNavigationController alloc] initWithRootViewController:viewController];
    nav.delegate=self;
    return nav;
}



#pragma mark -BaseViewController的leftBarButton在导航栏首页隐藏.

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController * view=navigationController.viewControllers.firstObject ;
    view.navigationItem.leftBarButtonItem.customView=[[UIView alloc] init];
}

/**
 *  UITabBarItem 文字图片 设置
 *
 */
- (UITabBarItem *)createTabBarItemWithTitle:(NSString *)title
                                  imageName:(NSString *)imgName
                          selectedImageName:(NSString *)selectedImgName
{
    UITabBarItem *tabbarItem = nil;
    UIImage *image = [[UIImage imageNamed:imgName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *selectedImage = [[UIImage imageNamed:selectedImgName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    tabbarItem = [[UITabBarItem alloc] initWithTitle:title
                                               image:image
                                       selectedImage:selectedImage];
    
    
    //标题位置  防止出现标题 y轴偏移20px
        [[UITabBarItem  appearance]  setTitlePositionAdjustment:UIOffsetMake(0,-15)];
//        int offset = -5;
//        UIEdgeInsets imageInset = UIEdgeInsetsMake(offset, 0, offset, 0);
//        tabbarItem.imageInsets = imageInset;
    return tabbarItem;
}



/**
 *  Tabbar 背景，字体等设置
 */
- (void)changeTabBarStyle
{
    //设置tabbar背景图片
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"sixin_bottom_bg"]];
    
    //去除tabbar在iOS7显示的时候在顶部出现的黑线
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    //修改tabbarItem的字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor],
                                                        NSFontAttributeName:[UIFont systemFontOfSize:10]
                                                        }
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor],
                                                        NSFontAttributeName:[UIFont systemFontOfSize:10]}
                                             forState:UIControlStateSelected];
}

#pragma mark----UITabBarControllerDelegate ----
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    //防止TabBar 未隐藏 问题
    if ([viewController isKindOfClass:[UINavigationController class]])
    {
        [(UINavigationController *)viewController popToRootViewControllerAnimated:NO];
    }
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
        return YES;
}



@end
