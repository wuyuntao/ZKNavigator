//
//  ZKViewController.m
//  ZKNavigator
//
//  Created by user on 12-5-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZKViewController.h"

@class ZKWebViewController;

@implementation ZKViewController

@synthesize navigator;
@synthesize startURL;

- (id)init {
    self = [super init];
    if (self) {
        navigator = [[ZKNavigator alloc] init];
    }
    return self;
}

- (void)dealloc {
    [navigator release];
    navigator = nil;
    [super dealloc];
}

- (BOOL)webView:(UIWebView*)theWebView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL* url = [request URL];
    if ([[url scheme] isEqualToString:@"zk"]) {
        NSString *path = [url path];
        ZKWebViewController* controller = [navigator openURL:path withController:self];
        if (controller != nil) {
            return NO;
        }
    }

    return [super webView:theWebView shouldStartLoadWithRequest:request navigationType:navigationType];
}
@end
