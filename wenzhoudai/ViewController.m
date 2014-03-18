//
//  ViewController.m
//  wenzhoudai
//
//  Created by 田瑞娇 on 14-3-17.
//  Copyright (c) 2014年 田瑞娇. All rights reserved.
//

#import "ViewController.h"
#import "NextviewController.h"


@implementation ViewController

@synthesize setGotoMainViewBtn = _setGotoMainViewBtn;

@synthesize viewControllers = _viewControllers;
@synthesize pageScroll = _pageScroll;
@synthesize pageControl = _pageControl;
@synthesize arrayImages = _arrayImages;
@synthesize helloImageview=_helloImageview;



#pragma mark - View lifecycle
//尽量不要在初始化的时候做关于view相关的东西，因为如果view为nil,且getter方法，会循环调用loadview
//-(id)init{
//    self =[super init];
//    if(self){
//        
//    }
//    return self;
//}
//- (void)loadView{
//    [super loadView];
//    
//
//}
//UIViewController已经存在了
- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    _helloImageview = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height)];
    _helloImageview.image = [UIImage imageNamed:@"hello.jpg"];
    _helloImageview.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:_helloImageview];
    
    
    [NSTimer scheduledTimerWithTimeInterval:(0.2) target:self selector:@selector(ontime) userInfo:nil repeats:NO];
    

    //图片数组
    self.arrayImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"adv1.jpg"],[UIImage imageNamed:@"adv2.jpg"],[UIImage imageNamed:@"adv3.jpg"], [UIImage imageNamed:@"adv4.jpg"],nil];
    
    //滑动条
    _pageScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height)];
    [_pageScroll setPagingEnabled:YES];
    _pageScroll.showsHorizontalScrollIndicator = NO;
    _pageScroll.showsVerticalScrollIndicator = NO;
    [_pageScroll setDelegate:self]; //设置代理
    [_pageScroll setBackgroundColor:[UIColor lightGrayColor]];
    //ContentSize 这个属性对于UIScrollView挺关键的，取决于是否滚动。
    [_pageScroll setContentSize:CGSizeMake(CGRectGetWidth(self.view.frame) * [self.arrayImages count], self.view.frame.size.height)];
    [self.view addSubview:_pageScroll];
    
    //滚动的原点
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.pageScroll.frame.size.height - 20, self.pageScroll.frame.size.width, 20)];
    
    _pageControl.numberOfPages = [self.arrayImages count];
    _pageControl.currentPage = 0;
    //_pageControl.backgroundColor = [UIColor blueColor];
    
    //[_pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControl ];
    
    [self loadImage];//加载滑动的动画
    [self.view bringSubviewToFront:_helloImageview];
    
}
-(void)ontime{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelay:2];
    _helloImageview.alpha = 0.0;
    
    [UIView commitAnimations];
}

- (void)loadImage
{
    if (nil == self.viewControllers) {
        self.viewControllers = [NSMutableArray arrayWithCapacity:[self.arrayImages count]];
        for (int i = 0; i < [self.arrayImages count]; ++i) {
            //如果是最后一个视图，则放在数组里的不是imageview 而是一个view，view里面有imageview 和button
            if(i == ([self.arrayImages count]-1)){
               /* UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(i * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
                [subview setBackgroundColor:[UIColor clearColor]];*/
                
                UIImageView *imageViews = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
                imageViews.contentMode = UIViewContentModeScaleToFill;
                imageViews.image = [self.arrayImages objectAtIndex:i];
              //  [subview addSubview:imageViews];
                imageViews.userInteractionEnabled = YES;
                
                _setGotoMainViewBtn =[UIButton buttonWithType:UIButtonTypeCustom];
                [_setGotoMainViewBtn
                 setBackgroundColor:[UIColor clearColor]];
                // button.tag = 101;
                //button.frame = CGRectMake(320/2-140/2, 80, 140, 40);
                _setGotoMainViewBtn.frame = imageViews.bounds;
               // [button setTitle:@"goMain" forState:UIControlStateNormal];
                
                [imageViews addSubview:_setGotoMainViewBtn];
                [_setGotoMainViewBtn addTarget:self  action:@selector(presentModalVC:) forControlEvents:UIControlEventTouchUpInside];
                

                [self.pageScroll addSubview:imageViews];
                [self.viewControllers addObject:imageViews];
                [imageViews release];
                break;
            }
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
           
            imageView.contentMode = UIViewContentModeScaleToFill;
            imageView.image = [self.arrayImages objectAtIndex:i];
            [self.pageScroll addSubview:imageView];
            [self.viewControllers addObject:imageView];
            [imageView release], imageView = nil;
        }
    }
    
}
//到最后一个视图,点击button跳转到这里显示一个模态视图
-(void)presentModalVC:(id)sender{
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"helloLaunch"];
    [self.setGotoMainViewBtn setHidden:YES];
    [self.pageScroll setHidden:YES];
    [self.pageControl setHidden:YES];
    
    NextViewController *modelVC = [[NextViewController alloc] init];
    modelVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    if([[UIDevice currentDevice].systemVersion floatValue]<6.0){
        [self presentModalViewController:modelVC animated:YES];
    }else{
        [self presentViewController:modelVC animated:YES completion:^{
            
        }];
    
    }
}

- (void)viewDidUnload
{
    _setGotoMainViewBtn = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}//视图控制器已经卸载，需要卸载其他的子视图

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    if([self.view window] == nil){
        self.view = nil;
        [self.setGotoMainViewBtn release];
        [self.pageScroll release];
        [self.pageControl release];
        [self.helloImageview release];
    }
}

-(void)dealloc
{
    [super dealloc];
    [self.arrayImages release];
    [self.viewControllers release];

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

//控制旋转屏幕时是否自适应
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


/*- (IBAction)gotoMainView:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    [self.gotoMainViewBtn setHidden:YES];

    [self.pageScroll setHidden:YES];
    [self.pageControl setHidden:YES];
    NextViewController *controller = [[NextViewController alloc] init];
    [self presentViewController:controller animated:YES completion:nil];
    [controller release];
}*/


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.view.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageControl.currentPage = page;
}

@end
