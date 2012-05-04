//
//  ZKNavigator.h
//  ZKNavigator
//
//  Created by user on 12-5-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ZKURLMap;
@class ZKWebViewController;

@interface ZKNavigator : NSObject {
    ZKURLMap* map;
    UIWebView* webview;
}

/**
 * The URL map used to translate between URLs and view controllers.
 *
 * @see ZKURLMap
 */
@property (nonatomic, readonly) ZKURLMap* map;

@property (nonatomic, retain) UIWebView* webview;

/**
 * Adds a URL pattern which will render page in webview when loaded.
 *
 * The selector will be called on the view controller after is created, and arguments from
 * the URL will be extracted using the pattern and passed to the selector.
 *
 */
- (void) from:(NSString*)URL toController:(id)controller;
- (void) from:(NSString*)URL toController:(id)controller selector:(SEL)selector;

/**
 * Gets a webview controller for the URL without opening it.
 *
 */
- (ZKWebViewController*)controllerForURL:(NSString*)URL;

/**
 * Load and display the page with a pattern that matches the URL
 */
- (ZKWebViewController*)openURL:(NSString*)URL;

@end
