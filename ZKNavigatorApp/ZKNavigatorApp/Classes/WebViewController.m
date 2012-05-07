//
//  WebViewController.m
//  ZKNavigatorApp
//
//  Created by user on 12-5-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "WebViewController.h"

@implementation IndexController

- (void)perform
{
    NSLog(@"Perform index controller: %@", url);
    NSString* filePath = [viewController pathForResource:@"index.html"];
    NSURL* fileURL = [NSURL fileURLWithPath:filePath];
    NSURLRequest* request = [NSURLRequest requestWithURL:fileURL
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:20.0];
    [[viewController webView] loadRequest:request];
}

@end

@implementation LoginController

- (void)perform
{
    NSLog(@"Perform login controller, %@", url);
    NSString* filePath = [viewController pathForResource:@"login.html"];
    NSURL* fileURL = [NSURL fileURLWithPath:filePath];
    NSURLRequest* request = [NSURLRequest requestWithURL:fileURL
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:20.0];
    [[viewController webView] loadRequest:request];
}

@end

@implementation UserController

@synthesize userId;

- (id)initWithUserId:(NSString*)uid
{
    self = [self init];
    if (uid != nil) {
        self.userId = uid;
    }
    return self;
}

- (void)perform
{
    NSLog(@"perform user controller");
}

@end
