//
//  RootController.m
//  macOS
//
//  Created by qianjn on 2017/12/28.
//  Copyright © 2017年 SF. All rights reserved.
//

#import "RootController.h"
#import "Mycell.h"
@interface RootController ()<NSTableViewDelegate, NSTableViewDataSource>
@property (nonatomic, strong) NSTableView *tableView;
@property (nonatomic, strong) NSTableColumn *tableColum;
@property (nonatomic, strong) NSScrollView *scrollow;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // 1. 先添加scrollow
    
    _scrollow = [[NSScrollView alloc] init];
    [_scrollow setHasVerticalScroller:YES];
    [self.view addSubview:_scrollow];
    [_scrollow setFrame:NSMakeRect(0, 0, kScreenWidth, kScreenHeight)];
    
    // 2. 添加 tableview
    _tableView = [[NSTableView alloc] init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setAllowsColumnSelection:YES];
    [self.view addSubview:_tableView];
    [_tableView setFrame:self.view.frame];
    
    // 2.1 添加 NSTableColumn
    _tableColum = [[NSTableColumn alloc] initWithIdentifier:@"iden_colum"];
    _tableColum.width = self.view.frame.size.width;
    _tableColum.title = @"功能列表";
    [_tableView addTableColumn:_tableColum];
    
    // 2.2 设置为 scrollow的 DocumentView
     [_scrollow setDocumentView:_tableView];
    

    _dataArr = [NSMutableArray new];
    for(int i = 0; i < 20;i++) {
        [_dataArr addObject:@(i)];
    }
    
    [_tableView reloadData];

}


#pragma mark - NSTabViewDelegate, NSTableViewDataSource

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return _dataArr.count;
}


-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSString * cellId = [tableColumn identifier];
    
    Mycell *cell = [tableView makeViewWithIdentifier:cellId owner:self];
    if(!cell) {
        cell = [[Mycell alloc] initWithFrame:NSMakeRect(0, 0, tableColumn.width, 50)];
        cell.titlelabel.stringValue =[_dataArr objectAtIndex:row];
    }
    return cell;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    return nil;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row{
    return 50;
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row{
    
    NSLog(@"***********%ld*********",(long)row);
    return YES;
}

@end
