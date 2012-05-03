//
//  ZKViewController.h
//  ZKNavigator
//
//  Created by user on 12-5-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifdef CORDOVA_FRAMEWORK
    #import <Cordova/CDVViewController.h>
#else
    #import "CDVViewController.h"
#endif

@interface ZKViewController : CDVViewController

@property (nonatomic, readwrite, copy) NSString* startURL;

@end
