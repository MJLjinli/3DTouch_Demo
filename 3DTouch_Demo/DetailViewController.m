//
//  DetailViewController.m
//  3DTouch_Demo
//
//  Created by 马金丽 on 17/7/13.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *topView = [[UILabel alloc]initWithFrame:CGRectMake(20, 64, [UIScreen mainScreen].bounds.size.width - 40, 40)];
    topView.backgroundColor = [UIColor blackColor];
    topView.alpha = 0.5;
    [self.view addSubview:topView];
    
    UILabel *topLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 64, [UIScreen mainScreen].bounds.size.width - 40, 40)];
    topLabel.backgroundColor = [UIColor clearColor];
    topLabel.text = [_dict objectForKey:@"decr"];
    topLabel.textColor = [UIColor whiteColor];
    topLabel.font = [UIFont systemFontOfSize:15.0];
    topLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:topLabel];
    
    UIImageView *contenImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(topView.frame)+5, [UIScreen mainScreen].bounds.size.width - 40, 250)];
    
    contenImageView.image = [UIImage imageNamed:[_dict objectForKey:@"contentImageStr"]];
    [self.view addSubview:contenImageView];
}


- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"分享" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"分享");
    }];
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"连接" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"连接");
    }];
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"连接3" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"连接3");
    }];
    UIPreviewActionGroup *actionGroup = [UIPreviewActionGroup actionGroupWithTitle:@"组" style:UIPreviewActionStyleDestructive actions:@[action3]];
    return @[action1,action2,actionGroup];
    
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
