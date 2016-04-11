//
//  GlobalMacro.h
//  Qsend
//
//  Created by l.h on 2016/02/22
//  Copyright © 2016年 appledev. All rights reserved.
//

#ifndef Qsend_GlobalMacro_h
#define Qsend_GlobalMacro_h

///定义GCD的后台线程和主线程
//后台运行
#define BACK_GCD(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)

//主线程运行
#define MAIN_GCD(block) dispatch_async(dispatch_get_main_queue(),block)


///----------------------颜色类---------------------------
// 获取RGB颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]



///----------------------图片----------------------------
//1.读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

//2.定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//3.定义UIImage对象
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]
//建议使用前两种宏定义,性能高于后者

//粘贴板
#define PasteBoardString(string)   [[UIPasteboard generalPasteboard] setString:string];
#define PasteBoardImage(image)     [[UIPasteboard generalPasteboard] setImage:image];


/**  ARC Block 相关 */
#define WEAKSELF __weak __typeof(self) weakSelf = self  
#define AFWEAKSELF __weak __typeof(&*self) weakSelf = self  // AFNetworking的写法__weak __typeof(&*self)weakSelf = self;这种写法不局限于某个viewcontroller



///去警告
//忽略PerformSelector警告
#define SUPPRESS_PerformSelectorLeak_WARNING(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


//忽略未定义方法警告
#define  SUPPRESS_Undeclaredselector_WARNING(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wundeclared-selector\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#endif
