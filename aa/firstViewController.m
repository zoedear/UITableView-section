//
//  firstViewController.m
//  aa
//
//  Created by 于海涛 on 17/3/9.
//  Copyright © 2017年 KennyHito. All rights reserved.
//

#import "firstViewController.h"
#import "HeaderFile.h"

@interface firstViewController ()<UITableViewDelegate,UITableViewDataSource>

PROPERTY_type(UITableView, tableView);
@property (nonatomic,strong)NSMutableArray *sectionArray;
@property (nonatomic,strong)NSMutableArray *flagArray;

@end

@implementation firstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    view_backColor;
    self.navigationItem.title =@"首页";
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    [self makeData];
}



- (void)makeData{
    _sectionArray = [NSMutableArray array];
    _flagArray  = [NSMutableArray array];
    NSInteger num = 6;
    for (int i = 0; i < num; i ++) {
        NSMutableArray *rowArray = [NSMutableArray array];
        for (int j = 0; j < arc4random()%20 + 1; j ++) {
            [rowArray addObject:[NSString stringWithFormat:@"%d",j]];
        }
        [_sectionArray addObject:rowArray];
        [_flagArray addObject:@"0"];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _sectionArray.count;
}

//组头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *sectionLabel = [[UILabel alloc] init];
    sectionLabel.frame = CGRectMake(0, 0, self.view.frame.size.width, 444);
    sectionLabel.textColor = [UIColor redColor];
    sectionLabel.text = [NSString stringWithFormat:@"组%ld",(long)section];
    sectionLabel.textAlignment = NSTextAlignmentCenter;
    sectionLabel.tag = 100 + section;
    sectionLabel.userInteractionEnabled = YES;
    sectionLabel.backgroundColor = [UIColor yellowColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sectionClick:)];
    [sectionLabel addGestureRecognizer:tap];
    
    return sectionLabel;
}

//组头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
//组尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
//cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_flagArray[indexPath.section] isEqualToString:@"0"])
        return 0;
    else
        return 44;
}

//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = _sectionArray[section];
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * str = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.textLabel.text= [NSString stringWithFormat:@"第%ld组的第%ld个cell",(long)indexPath.section,(long)indexPath.row];
    
    cell.clipsToBounds = YES; //这句话很重要
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",[NSString stringWithFormat:@"第%ld组的第%ld个cell",(long)indexPath.section,(long)indexPath.row]);
}

//手势点击事件
- (void)sectionClick:(UITapGestureRecognizer *)tap{
    int index = tap.view.tag % 100;
    
    NSMutableArray *indexArray = [[NSMutableArray alloc]init];
    NSArray *arr = _sectionArray[index];
    for (int i = 0; i < arr.count; i ++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:i inSection:index];
        [indexArray addObject:path];
    }
    
    if ([_flagArray[index] isEqualToString:@"0"]) {//展开
        _flagArray[index] = @"1";
        [_tableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationBottom];  //使用下面注释的方法就 注释掉这一句
    } else { //收起
        _flagArray[index] = @"0";
        [_tableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationTop]; //使用下面注释的方法就 注释掉这一句
    }
    
    //  NSRange range = NSMakeRange(index, 1);
    //  NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
    //  [_tableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationAutomatic];
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
