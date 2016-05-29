//
//  ViewController.m
//  MyPageViewController
//
//  Created by tanli on 16/5/28.
//  Copyright © 2016年 tanli. All rights reserved.
//

#import "ViewController.h"
#import "MyContentViewController.h"

@interface ViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
{
    UIPageViewController *_pageViewController;
    NSArray *_titles;
    NSArray *_images;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pageViewController"];
//    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
//                                                          navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
//                                                                        options:nil];
    _pageViewController.dataSource = self;
    _pageViewController.delegate = self;
    
    _titles = @[@"lighthouse",@"weather",@"dewdrop"];
    _images = @[@"001.jpg",@"002.jpg",@"004.jpg"];
    
    MyContentViewController *viewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[viewController];
    [_pageViewController setViewControllers:viewControllers
                                  direction:UIPageViewControllerNavigationDirectionForward
                                   animated:true
                                 completion:nil];
    _pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height-60);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview: _pageViewController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - dataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = ((MyContentViewController *)viewController).pageIndex;
    if (index == NSNotFound || index == 0  )
    {
        return nil;
    }
    index --;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(nonnull UIViewController *)viewController
{
    NSInteger index = ((MyContentViewController *)viewController).pageIndex;
    if (index == NSNotFound)
    {
        return nil;
    }
    index ++;
    if (index == _titles.count)
    {
        return nil;
    }
    return [self viewControllerAtIndex:index];

}

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [_titles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (MyContentViewController*)viewControllerAtIndex:(NSInteger)index
{
    if (_titles.count == 0 || index > _titles.count)
    {
        return nil;
    }
    MyContentViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
    viewController.pageTitle = _titles[index];
    viewController.imagefile = _images[index];
    viewController.pageIndex = index;
    
    return viewController;
}
@end
