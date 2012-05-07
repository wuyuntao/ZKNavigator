//
//  ZKNavigator.m
//  ZKNavigator
//
//  Created by user on 12-5-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZKURLMap.h"
#import "ZKNavigator.h"
#import "ZKViewController.h"
#import "ZKWebViewController.h"

// @class ZKViewController;
// @class ZKWebViewController;

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
    [map from:URL toObject:controller];
}

- (void)from:(NSString*)URL toController:(id)controller selector:(SEL)selector
{
    [map from:URL toObject:controller selector:selector];
}

- (ZKWebViewController*)controllerForURL:(NSString*)URL
{
    return [map objectForURL:URL];
}

- (ZKWebViewController*)openURL:(NSString*)URL withController:(ZKViewController*)viewController
{
    ZKWebViewController* controller = [self controllerForURL:URL];
    controller.viewController = viewController;
    if (controller != nil) {
        [controller perform];
    }
    return controller;
}

@end
