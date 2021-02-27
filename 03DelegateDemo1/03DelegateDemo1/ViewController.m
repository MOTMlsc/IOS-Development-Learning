//
//  ViewController.m
//  03DelegateDemo1
//
//  Created by liusicheng on 2021/2/24.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

/**
    通过代理监听滚动事件的步骤：
    1. 为UIScrollView找一个代理对象，也就是设置UISCrollView的delegate属性
    self.scrollView.delegate = self;
    直接将控制器作为控件的代理对象
 
    2. 为了保证代理对象中拥有对应方法，必须让代理对象遵守对应控件的代理协议
    命名规则：控件名+Delegate
 
    3. 在控制器中实现代理方法
 
 */

@implementation ViewController

//    即将开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"即将开始拖拽");
}

//    正在滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"正在滚动");
    
//    输出当前位置
    NSString *pointStr = NSStringFromCGPoint(scrollView.contentOffset);
    NSLog(@"%@",pointStr);
}

//    拖拽完毕
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"拖拽完毕");
}


//    实现缩放方法
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize = self.imageView.image.size;
    
//    为UIScrollView设置代理
    self.scrollView.delegate = self;
    
//    设置UIScrollView的缩放比例
    self.scrollView.maximumZoomScale = 10.5;
    self.scrollView.minimumZoomScale = 0.1;
    
}


@end
