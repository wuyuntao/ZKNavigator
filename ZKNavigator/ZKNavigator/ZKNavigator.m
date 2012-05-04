//
//  ZKNavigator.m
//  ZKNavigator
//
//  Created by user on 12-5-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZKURLMap.h"
#import "ZKNavigator.h"

@implementation ZKNavigator

@synthesize map;
@synthesize webview;

- (id)init
{
    self = [super init];
    if (self) {
        map = [[ZKURLMap alloc] init];
    }

    return self;
}

- (void)dealloc
{
    [map release];
    map = nil;

    [super dealloc];
}

- (void)from:(NSString*)URL toController:(id)controller
{
}

- (void)from:(NSString*)URL toController:(id)controller selector:(SEL)selector
{
}

- (ZKWebViewController*)controllerForURL:(NSString*)URL
{
}

- (ZKWebViewController*)openURL:(NSString*)URL
{
}

@end
