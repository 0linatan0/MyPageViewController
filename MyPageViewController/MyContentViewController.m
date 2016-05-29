//
//  MyContentViewController.m
//  MyPageViewController
//
//  Created by tanli on 16/5/29.
//  Copyright © 2016年 tanli. All rights reserved.
//

#import "MyContentViewController.h"

@interface MyContentViewController ()

@end

@implementation MyContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageView.image = [UIImage imageNamed:self.imagefile];
    self.titleLabel.text = self.pageTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
