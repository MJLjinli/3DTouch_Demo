//
//  RootTabBarViewController.m
//  3DTouch_Demo
//
//  Created by 马金丽 on 17/7/13.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "MyViewController.h"
#import "MyCollectionViewController.h"
@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViewController];
}

- (void)addSubViewController
{
    MyCollectionViewController *myCollectionVC = [[MyCollectionViewController alloc]init];
    myCollectionVC.view.backgroundColor = [UIColor grayColor];
    myCollectionVC.tabBarItem.title = @"收藏";
    myCollectionVC.tabBarItem.image = [UIImage imageNamed:@"myCollectionNormal"];
    myCollectionVC.tabBarItem.selectedImage = [UIImage imageNamed:@"mycollection"];
    UINavigationController *myCollectionNav = [[UINavigationController alloc]initWithRootViewController:myCollectionVC];
    
    
    MyViewController *myVC = [[MyViewController alloc]init];
    myVC.view.backgroundColor = [UIColor grayColor];
    myVC.tabBarItem.title = @"我的";
    myVC.tabBarItem.image = [UIImage imageNamed:@"myNormal"];
    myVC.view.backgroundColor = [UIColor whiteColor];
    myVC.tabBarItem.selectedImage = [UIImage imageNamed:@"my"];
        UINavigationController *myNav = [[UINavigationController alloc]initWithRootViewController:myVC];
    self.viewControllers = @[myCollectionNav,myNav];
    
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
