//
//  ZKViewController.m
//  ZKNavigator
//
//  Created by user on 12-5-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZKViewController.h"

@implementation ZKViewController

@synthesize startURL;

- (BOOL) webView:(UIWebView*)theWebView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL* url = [request URL];
    // NSLog(@"Request URL: %@", [url absoluteString]);
    // NSLog(@"Request scheme: %@", [url scheme]);
    // NSLog(@"Request host: %@", [url host]);
    // NSLog(@"Request path: %@", [url path]);
    if ([[url scheme] isEqualToString:@"zk"]) {
        NSString *path = [url path];
        NSString* filePath;
        NSURL* appURL;
        NSURLRequest* appRequest;

        // TODO Refactor to ZKNavigator. e.g. [ZKNavigator match:path]
        if ([path isEqualToString:@"/"]) {
            filePath = [self pathForResource:@"index.html"];
        } else if ([path isEqualToString:@"/login"]) {
            filePath = [self pathForResource:@"login.html"];
        }
        // NSLog(@"file path: %@", filePath);
        appURL = [NSURL fileURLWithPath:filePath];
        // NSLog(@"app URL: %@, isFileURL: %i", [appURL path], [appURL isFileURL]);
        appRequest = [NSURLRequest requestWithURL:appURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        [self.webView loadRequest:appRequest];
        return NO;
    }

    return [super webView:theWebView shouldStartLoadWithRequest:request navigationType:navigationType];
}
@end
