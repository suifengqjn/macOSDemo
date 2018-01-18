//
//  Mycell.m
//  macOS
//
//  Created by qianjn on 2017/12/28.
//  Copyright © 2017年 SF. All rights reserved.
//

#import "Mycell.h"

@implementation Mycell

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        [self buildUI];
    }
    return self;
}
- (void)buildUI
{
    _titlelabel = [[NSTextField alloc] init];
    _titlelabel.textColor = [NSColor blackColor];
    _titlelabel.font = FMFont(25);
    [self addSubview:_titlelabel];
    [_titlelabel autoPinEdgesToSuperviewEdgesWithInsets:NSEdgeInsetsMake(5, 0, 0, 0)];
    [_titlelabel autoCenterInSuperview];

}

@end
