//
//  ZKWebViewController.m
//  ZKNavigatorApp
//
//  Created by user on 12-5-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZKWebViewController.h"

@implementation ZKWebViewController

@synthesize viewController;
@synthesize url;

- (void)perform
{
    NSLog(@"Implement this method in subclasses");
}

@end

@implementation ZKTemplateViewController

@synthesize template;


- (void)perform
{
    NSString* templatePath = [viewController pathForResource:template];
    NSURL* baseURL = [NSURL fileURLWithPath:templatePath];
    NSString *html = [NSString stringWithContentsOfFile:templatePath
                                               encoding:NSUTF8StringEncoding
                                                  error:nil];
    NSDictionary* context = [self getContext];
    NSString* pattern;
    if (context != nil) {
        for (NSString *key in context) {
            pattern = [NSString stringWithFormat:@"{%@}", key];
            html = [html stringByReplacingOccurrencesOfString:pattern
                                                   withString:[context objectForKey:key]];
        }
    }
    [[viewController webView] loadHTMLString:html baseURL:baseURL];
}

- (NSDictionary*)getContext
{
    NSMutableDictionary* context = [NSMutableDictionary dictionary];
    [context setValue:url forKey:@"url"];
    return [NSDictionary dictionaryWithDictionary:context];
}

@end
