//
//  ZKNavigator.h
//  ZKNavigator
//
//  Copyright (c) 2012 Wu Yuntao.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ZKURLMap;
@class ZKViewController;
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
- (ZKWebViewController*)openURL:(NSString*)URL withController:(ZKViewController*)viewController;

@end
