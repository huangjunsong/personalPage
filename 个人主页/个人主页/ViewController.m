//
//  ViewController.m
//  个人主页
//
//  Created by  on 15/7/4.
//  Copyright (c) 2015年 junsong. All rights reserved.
//

#import "ViewController.h"
#define imageViewH 200
#define selectLineH 44
#define zero 0
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewHConstant;
@property (nonatomic,assign) CGFloat lastOffSet;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _lastOffSet = - (imageViewH + selectLineH);
    self.tableview.contentInset = UIEdgeInsetsMake(imageViewH + selectLineH, 0, 0, 0);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.y;
        if (offset > -selectLineH) {
            offset = -selectLineH;

        }
        self.imageViewHConstant.constant = ABS(offset+44);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
