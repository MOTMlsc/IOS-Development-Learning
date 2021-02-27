//
//  ViewController.m
//  04UIScrollViewDemo
//
//  Created by liusicheng on 2021/2/24.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation ViewController

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
//    1. 获取滚动的X方向的偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
//    用当前偏移量加半页的宽度
    offsetX += scrollView.frame.size.width / 2;
//    2. 用X方向的偏移量计算当前滚动到第几页
    int page = offsetX / scrollView.frame.size.width;
//    3. 将页面设置给UIPageControl
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timer invalidate];
    self.timer = nil;
}

- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}


//    自动滚动方法
- (void) scrollImage {
//    1. 获取当前页码
    NSInteger page = self.pageControl.currentPage;
//    2. 判断是否到达最后一页，如果到达最后一页那么将页码设置为0，否则将页码加1
    if(page == self.pageControl.numberOfPages - 1) page = 0;
    else page ++;
//    3. 用每页的宽度 * （页码 + 1）就是下一页的偏移量
    CGFloat offsetX = page * self.scrollView.frame.size.width;
//    4. 设置新的偏移量
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0)animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    动态创建UIImageView添加到UIScrollView
    CGFloat imgW = 360;
    CGFloat imgH = 126;
    CGFloat imgY = 30;
    CGFloat imgX = 0;
    int picNum = 3;
    
//    1. 循环创建5个UIImageView添加到ScrollView中
    for(int i=0;i<picNum;i++){
//        创建一个UIImageView
        UIImageView *imgView = [[UIImageView alloc] init];
        
//        设置UIImageView中的图片
        NSString *imgName = [NSString stringWithFormat:@"img%02d", i + 1];
        imgView.image = [UIImage imageNamed:imgName];
        
//        设置UIImageView中的图片
        imgView.frame = CGRectMake(imgX, imgY, imgW, imgH);
//        更新每个UIImageView中图片的x坐标值
        imgX += imgW;
        
//        把imgView添加到UIScrollView中
        [self.scrollView addSubview:imgView];
    }
    
//    设置UIScrollView的contentSize
    self.scrollView.contentSize = CGSizeMake(imgW * picNum, 0);
    
//    实现UIScrollView分页效果
    self.scrollView.pagingEnabled = YES;
    
//    隐藏滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
//    制定UIPageControl的总页数
    self.pageControl.numberOfPages = picNum;
    
//    指定默认在第0页
    self.pageControl.currentPage = 0;
    
//    创建计时器控件NSTimer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    
//    修改timer优先级
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
//    [self.scrollView bringSubviewToFront:self.pageControl];
}


@end
