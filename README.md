# MyPageViewController
UIPageViewController可用于管理多个平行关系的viewCOntroller，提供页面滑动和很炫的翻页效果，可用于引导页切换。
##配置属性
UIPageViewController可以配置多个属性进行展示，

名称|含义|值
---|----|----
navigationOrientation|导航的方向：水平or垂直| UIPageViewControllerNavigationOrientationHorizontal、UIPageViewControllerNavigationOrientationVertical
transitionStyle|翻页的过渡样式：类似书页翻卷或者Scroll滑动| UIPageViewControllerTransitionStylePageCurl、UIPageViewControllerTransitionStyleScroll
spineLocation|书脊位置，只有书页翻卷效果时有效；|UIPageViewControllerSpineLocationNone：无书脊、UIPageViewControllerSpineLocationMin：根据导航方向，位于屏幕左侧或顶部、UIPageViewControllerSpineLocationMid：位于屏幕中部，同时显示两个页面、UIPageViewControllerSpineLocationMax：根据导航方向，位于屏幕右侧或底部
doubleSided|屏幕是否显示两个页面，当spineLocation为mid时，其值需设为Yes|默认为no

##初始化
a) UIPageViewController初始化方法

~~~
- (instancetype)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style
                  navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation
                                options:(NSDictionary<NSString *,id> *)options
~~~
参数style对应上述文中transitionStyle，navigationOrientation对应导航方向，options是可选的,但只可以是UIPageViewControllerOptionSpineLocationKey和UIPageViewControllerOptionInterPageSpacingKey组成的字典.

1. UIPageViewControllerOptionSpineLocationKey：定义书脊位置，只有其transitionStyle选为UIPageViewControllerTransitionStylePageCurl才有效
2. UIPageViewControllerOptionInterPageSpacingKey：定义两个页面的间距，只有其transitionStyle选为UIPageViewControllerTransitionStyleScroll才有效

b) 设置UIPageViewController初始显示的viewController

~~~
- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers
                 direction:(UIPageViewControllerNavigationDirection)direction
                  animated:(BOOL)animated
                completion:(void (^)(BOOL finished))completion
~~~
参数direction值分为UIPageViewControllerNavigationDirectionForward（水平导航时为从左向右，垂直方向时为从上到下）、
UIPageViewControllerNavigationDirectionReverse（水平导航时为从右向左，垂直方向时为从下到上）

##DataSource
UIPageViewControllerDataSource提供了四个方法，两个是@required，两个是@optional

~~~
@required
//返回前一个页面;如果返回为nil,则会认为当前页面不可以向前滚动或翻页
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController
//返回后一个页面;如果返回为nil,则会认为当前页面不可以向后滚动或翻页    
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController

@optional
//返回页面总数
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
//返回默认展示的页面index
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
~~~
需要注意的是@optional中的方法是和页面指示器（Page Indicator）相对应的，实现了这两个方法，才可以显示Page Indicator；同时Page Indicator是在scroll过渡效果下显示。

##Delegate
UIPageViewControllerDelegate定义了五个方法

~~~
//开始滚动或者翻页时执行
- (void)pageViewController:(UIPageViewController *)pageViewController
willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers
//结束滚动或者翻页时执行
- (void)pageViewController:(UIPageViewController *)pageViewController
        didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers
       transitionCompleted:(BOOL)completed
//在书页翻卷效果和旋转屏幕时执行，可以根据屏幕旋转方向设置书脊位置和初始化首页
- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController
                   spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation

//支持的屏幕类型                   
- (UIInterfaceOrientationMask)pageViewControllerSupportedInterfaceOrientations:(UIPageViewController *)pageViewController
- (UIInterfaceOrientation)pageViewControllerPreferredInterfaceOrientationForPresentation:(UIPageViewController *)pageViewController
~~~

##实现效果
类似于scroll滚动效果如下图：
<center>
<img src= "http://7xrh2s.com1.z0.glb.clouddn.com/iospageControlview.gif" width = 40% height=40%>
</center>

类似于书卷翻页效果如下图：
<center>
<img src= "http://7xrh2s.com1.z0.glb.clouddn.com/iospageControlview1.gif" width = 40% height=40%>
</center>

可以利用UIPageControl修改page indicator，具体如下

~~~
UIPageControl *pageControl = [UIPageControl appearance];
pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
pageControl.backgroundColor = [UIColor whiteColor];
~~~


##参考资料
[Page View Controllers](https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/PageViewControllers.html#//apple_ref/doc/uid/TP40011313-CH4-SW7)

[UIPageViewController](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIPageViewControllerClassReferenceClassRef/#//apple_ref/doc/c_ref/UIPageViewControllerNavigationDirection)

[UIPageViewController - Xcode 6.2 iOS 8.2 Tutorial](https://www.youtube.com/watch?v=8bltsDG2ENQ)

[UIPageViewController in iOS](http://www.theappguruz.com/blog/uipageviewcontroller-in-ios)

[UIPageViewController教程](http://www.jianshu.com/p/46c8c585d50b)
