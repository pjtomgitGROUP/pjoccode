//
//  NewFeatureController.m
//  新浪微博
//
//  Created by ki_tom on 14-1-20.
//  Copyright (c) 2014年 ki_tom. All rights reserved.
//

#import "NewFeatureController.h"
#define  KNewFeatureListName @"new_feature"
#define KNewFeatureExt @"plist"
@interface NewFeatureController ()

@end

@implementation NewFeatureController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//自定义创建view,不需要父组件创建
-(void)loadView{
    //不用掉 【super loadView 】
    //获取屏幕的位置和大小
    CGRect mainScreen = [UIScreen mainScreen].applicationFrame;
    //创建scrollview
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:mainScreen];
    self.view = scrollView;
    [scrollView release];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor redColor];
    //读取图片new_feature pics
    NSString* path  = [[NSBundle mainBundle]pathForResource:KNewFeatureListName ofType:KNewFeatureExt];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    int size = arr.count;
    //设置scrollview的内容宽度
    UIScrollView *scrollview = (UIScrollView *)self.view;
    scrollview.contentSize= CGSizeMake(size*self.view.bounds.size.width, 0);
    //设置分页
    scrollview.pagingEnabled = YES;
    //隐藏弹簧效果
    scrollview.bounces = NO;
    //隐藏水平滚动天
    scrollview.showsHorizontalScrollIndicator = NO;
    
    
    int i = 0;
    PJLog(@"%i",size);
    for (i; i<size; i++) {
        NSString *imgname = [arr objectAtIndex:i];
        UIImage *img =[UIImage imageNamed:imgname];
        UIImageView  * imgview = [[UIImageView alloc]initWithImage:img];
        //定位
        CGRect frame = imgview.frame;
        frame.origin.x = i*img.size.width;
        imgview.frame = frame;
        //添加到父容器
        [self.view addSubview:imgview];
        [imgview release];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
