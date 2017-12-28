//
//  RootController.m
//  macOS
//
//  Created by qianjn on 2017/12/28.
//  Copyright © 2017年 SF. All rights reserved.
//

#import "RootController.h"

@interface RootController ()

@end

@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBeganWithEvent:(NSEvent *)event
{
    NSLog(@"sas");
}
- (IBAction)bbb:(NSButton *)sender {
    
    //self.view.window.contentMinSize = NSMakeSize(500, 400);
    [self.view.window setContentSize:NSMakeSize(500, 400)];
    //[[NSApplication sharedApplication].keyWindow setContentSize:NSMakeSize(500, 400)];
}
@end
