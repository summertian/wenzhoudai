//
//  ViewController.h
//  wenzhoudai
//
//  Created by 田瑞娇 on 14-3-17.
//  Copyright (c) 2014年 田瑞娇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>

@property (retain, nonatomic)  UIScrollView *pageScroll; //滑动条
@property (retain, nonatomic)  UIPageControl *pageControl; //下面的小圆点

@property(nonatomic, strong)NSArray  *arrayImages;          //存放图片的数组
@property(nonatomic, strong)NSMutableArray *viewControllers; //存放UIViewController的可变数组
@property (retain, nonatomic)  UIImageView *helloImageview; //启动页面的图片

@property (retain, nonatomic) UIButton *setGotoMainViewBtn; //按钮点击进入主页

@end

