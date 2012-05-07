//
//  WebViewController.m
//  ZKNavigatorApp
//
//  Created by user on 12-5-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "WebViewController.h"

@implementation IndexController

- (id)init {
    self = [super init];
    if (self != nil) {
        self.template = @"index.html";
    }
    return self;
}

@end

@implementation LoginController

- (id)init {
    self = [super init];
    if (self != nil) {
        self.template = @"login.html";
    }
    return self;
}

@end

@implementation UserController

@synthesize username;

- (id)initWithUsername:(NSString*)theUsername
{
    self = [self init];
    if (self != nil) {
        self.template = @"user.html";
        self.username = theUsername;
    }
    return self;
}

- (NSDictionary*)getContext
{
    NSDictionary* context = [super getContext];
    NSMutableDictionary* mutableContext = [NSMutableDictionary dictionaryWithDictionary:context];
    [mutableContext setValue:username forKey:@"username"];
    return [NSDictionary dictionaryWithDictionary:mutableContext];
}

@end
