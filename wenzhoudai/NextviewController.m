//
//  NextviewController.m
//  wenzhoudai
//
//  Created by 田瑞娇 on 14-3-17.
//  Copyright (c) 2014年 田瑞娇. All rights reserved.
//


#import "NextViewController.h"
#import "helloViewController.h"

@implementation NextViewController
@synthesize titlePage = _titlePage;
@synthesize helloImageview=_helloImageview;
//视图将要加载
-(void)viewDidLoad{
    [super viewDidLoad];
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"helloLaunch"]) {
        _helloImageview = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height)];
        _helloImageview.image = [UIImage imageNamed:@"hello.jpg"];
        _helloImageview.contentMode = UIViewContentModeScaleToFill;
        [self.view addSubview:_helloImageview];
        [NSTimer scheduledTimerWithTimeInterval:(0.2) target:self selector:@selector(ontime) userInfo:nil repeats:NO];
    }
  
  
    
    _titlePage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height)];
    [_titlePage setImage:[UIImage imageNamed:@"title2.jpg"]];
    _titlePage.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:_titlePage];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"helloLaunch"]) {
        [self.view bringSubviewToFront:_helloImageview];
    }

}

-(void)ontime{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:1];
    _helloImageview.alpha = 0.0;
    
    [UIView commitAnimations];
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
    _titlePage = nil;

    
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



@end
