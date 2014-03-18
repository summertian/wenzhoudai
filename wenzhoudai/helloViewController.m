//
//  helloViewController.m
//  wenzhoudai
//
//  Created by 田瑞娇 on 14-3-18.
//  Copyright (c) 2014年 田瑞娇. All rights reserved.
//

#import "helloViewController.h"

@implementation helloViewController
@synthesize helloImageview=_helloImageview;

-(void)ontime{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelay:2];
    _helloImageview.alpha = 0.0;
    
    [UIView commitAnimations];
}

-(void)viewDidLoad{
    _helloImageview = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height)];
    _helloImageview.image = [UIImage imageNamed:@"hello.jpg"];
    _helloImageview.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:_helloImageview];
    [NSTimer scheduledTimerWithTimeInterval:(0.2) target:self selector:@selector(ontime) userInfo:nil repeats:NO];
    
    
}

//屏幕旋转的设置，不能反向立着
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    
}
//内存警告
-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
//释放强引用
-(void)dealloc
{
    [super dealloc];
    
    
}
//视图将要出现
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
//视图已经出现
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
