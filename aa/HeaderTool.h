//
//  HeaderTool.h
//  aa
//
//  Created by 于海涛 on 17/3/9.
//  Copyright © 2017年 KennyHito. All rights reserved.
//

//设置背景色
#define view_backColor self.view.backgroundColor = [UIColor whiteColor];

#define PROPERTY_type(type,key) @property (nonatomic,strong) type * key

//主窗口
#define kApplication [UIApplication sharedApplication].keyWindow
//版本号
#define kOSVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#define _LolitaFunctions [LolitaFunctions sharedObject]

//屏幕的宽高
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height

//声明属性
#define PROPERTY(key) @property (nonatomic,strong) NSString * key

#define viewY_H_Padding(view1,view2,ls) view1.frame.size.height+view2.frame.origin.y+ls
#define viewX_W_Padding(view1,view2,ls) view1.frame.size.width+view2.frame.origin.x+ls

#define viewH(view1) view1.frame.size.height
#define viewW(view1) view1.frame.size.width
#define viewX(view1) view1.frame.origin.x
#define viewY(view1) view1.frame.origin.y
#define VW (self.view.frame.size.width)
#define VH (self.view.frame.size.height)
///实例化
#define viewAlloc(view1,xs1,ys2,ws3,hs4)  [[view1 alloc]initWithFrame:CGRectMake(xs1, ys2, ws3, hs4)]
#define viewAlloc_(view1) [[view1 alloc]init]


///颜色 a代表透明度,1为不透明,0为透明
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
