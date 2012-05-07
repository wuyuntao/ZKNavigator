//
//  ZKURLMap.h
//  ZKNavigatorApp
//
//  Created by user on 12-5-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SOCKit.h"

@interface ZKURLMap : NSObject {
  NSMutableDictionary*    mappings;
  NSMutableArray*         patterns;
  // NSMutableArray*         objects;
}

/**
 * Adds a URL pattern which will perform a selector on an object when loaded.
 */
- (void)from:(NSString*)URL toObject:(id)object;
- (void)from:(NSString*)URL toObject:(id)object selector:(SEL)selector;

/**
 * Adds a direct mapping from a literal URL to an object.
 *
 * The URL must not be a pattern - it must be the a literal URL. All requests to open this URL will
 * return the object bound to it, rather than going through the pattern matching process to create
 * a new object.
 *
 * Mapped objects are not retained.  You are responsible for removing the mapping when the object
 * is destroyed, or risk crashes.
 */
- (void)setObject:(id)object forURL:(NSString*)URL;

/**
 * TODO Removes Removes all objects and patterns mapped to a URL.
 */
- (void)removeURL:(NSString*)URL;

/**
 * TODO Removes Removes all URLs bound to an object.
 */
- (void)removeObject:(id)object;

/**
 * TODO Removes objects bound literally to the URL.
 */
- (void)removeObjectForURL:(NSString*)URL;

/**
 * Gets or creates the object with a pattern that matches the URL.
 */
- (id)objectForURL:(NSString*)URL;

- (id)createObject:(SOCPattern*)pattern fromURL:(NSURL*)URL;

@end
