//
//  ZKWebViewController.h
//  ZKNavigatorApp
//
//  Created by user on 12-5-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZKViewController.h"

@interface ZKWebViewController : NSObject {
    ZKViewController* viewController;
    NSString* url;
}

@property (nonatomic, retain) ZKViewController* viewController;
@property (nonatomic, retain) NSString* url;

- (void)perform;

@end

@interface ZKTemplateViewController : ZKWebViewController {
    NSString* template;
}

@property (nonatomic, retain) NSString* template;

- (NSDictionary*)getContext;

@end
