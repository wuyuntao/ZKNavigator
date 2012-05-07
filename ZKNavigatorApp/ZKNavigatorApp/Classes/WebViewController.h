//
//  WebViewController.h
//  ZKNavigatorApp
//
//  Created by user on 12-5-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZKWebViewController.h"

@interface IndexController : ZKTemplateViewController

@end

@interface LoginController : ZKTemplateViewController

@end

@interface UserController : ZKTemplateViewController {
    NSString* username;
}

@property (nonatomic, retain) NSString* username;

@end
