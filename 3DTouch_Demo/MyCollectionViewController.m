//
//  MyCollectionViewController.m
//  3DTouch_Demo
//
//  Created by 马金丽 on 17/7/13.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "MyCollectionViewController.h"
#import <Masonry.h>
#import "CollectionCell.h"
#import "DetailViewController.h"
static NSString *CollectionCellID = @"CollectionCell";
@interface MyCollectionViewController ()<UITableViewDataSource,UITableViewDelegate,UIViewControllerPreviewingDelegate>

@property(nonatomic,strong)UITableView *mainTableView;

@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation MyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收藏";
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    for (int i = 0; i < 15; i++) {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        if (i%2 == 0) {
            [dict setObject:@"这世上所有的不公平都是因为当事人能力的不足" forKey:@"decr"];
            [dict setObject:@"cell04" forKey:@"contentImageStr"];
        }else{
            [dict setObject:@"这个世界是残酷的但也是美好的" forKey:@"decr"];
            [dict setObject:@"cell02" forKey:@"contentImageStr"];
        }
        [self.dataArray addObject:dict];
    }

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:CollectionCellID];
    NSDictionary *dict = [_dataArray objectAtIndex:indexPath.row];
    [cell cellDatawithDict:dict];
    
    if ([self respondsToSelector:@selector(traitCollection)]) {
        if ([self.traitCollection respondsToSelector:@selector(forceTouchCapability)]) {
            if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
                [self registerForPreviewingWithDelegate:self sourceView:cell];
            }
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark UIViewControllerPreviewingDelegate
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    CGRect rect = CGRectMake(0, 0,previewingContext.sourceView.frame.size.width, previewingContext.sourceView.frame.size.height);
    previewingContext.sourceRect = rect;
    NSIndexPath *indexPath = [self.mainTableView indexPathForCell:(CollectionCell *)[previewingContext sourceView]];
    NSDictionary *dict = [self.dataArray objectAtIndex:indexPath.row];
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    detailVC.dict = dict;
   
    return detailVC;
}


- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}




- (UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
         
        [_mainTableView registerClass:[CollectionCell class] forCellReuseIdentifier:CollectionCellID];
        [self.view addSubview:_mainTableView];
    }
    return _mainTableView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
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
