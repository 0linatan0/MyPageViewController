//
//  MyContentViewController.h
//  MyPageViewController
//
//  Created by tanli on 16/5/29.
//  Copyright © 2016年 tanli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) NSString *pageTitle;

@property (strong, nonatomic) NSString *imagefile;

@property (assign, nonatomic) NSInteger pageIndex;

@end
