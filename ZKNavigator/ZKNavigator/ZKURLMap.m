//
//  ZKURLMap.m
//  ZKNavigatorApp
//
//  Created by user on 12-5-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SOCKit.h"

#import "ZKURLMap.h"

@implementation ZKURLMap

- (id)init {
    self = [super init];
    if (self) {
        patterns = [[NSMutableArray alloc] init];
        // objects = [[NSMutableArray alloc] init];
        mappings = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)dealloc {
    [patterns release];
    // [objects release];
    [mappings release];
    patterns = nil;
    // objects = nil;
    mappings = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark Private

/**
 * @return a unique key for a class with a given name.
 * @private
 */
- (NSString*)keyForClass:(Class)cls withName:(NSString*)name {
    const char* className = class_getName(cls);
    return [NSString stringWithFormat:@"%s_%@", className, (nil != name) ? name : @""];
}

- (void)addPattern:(SOCPattern*)pattern forObject:(id)object selector:(SEL)selector
{
    pattern.object = object;
    if (selector != nil) {
        pattern.selector = selector;
    }
    [patterns addObject:pattern];
}

- (SOCPattern*)matchPattern:(NSURL*)URL {
    NSString* path = [URL path];

    for (SOCPattern* pattern in patterns) {
        if ([pattern stringMatches:path]) {
            return pattern;
        }
    }
    return nil;
}

#pragma mark -
#pragma mark Mapping

- (void)from:(NSString*)URL toObject:(id)object
{
    SOCPattern *pattern = [SOCPattern patternWithString:URL];
    [self addPattern:pattern forObject:object selector:nil];
}

- (void)from:(NSString*)URL toObject:(id)object selector:(SEL)selector
{
    SOCPattern *pattern = [SOCPattern patternWithString:URL];
    [self addPattern:pattern forObject:object selector:selector];
}

- (void)setObject:(id)object forURL:(NSString*)URL
{
    [mappings setObject:object forKey:URL];
}

- (void)removeURL:(NSString*)URL
{
}

- (void)removeObject:(id)object
{
}

- (void)removeObjectForURL:(NSString*)URL
{
}

- (id)objectForURL:(NSString*)URL
{
    id object = nil;
    // Get object from cache
    if (mappings) {
        object = [mappings objectForKey:URL];
        if (object) {
            return object;
        }
    }

    NSURL* theURL = [NSURL URLWithString:URL];
    SOCPattern* pattern = [self matchPattern:theURL];
    if (pattern != nil) {
        if (!object) {
            object = [self createObject:pattern fromURL:theURL];
        }
        [self setObject:object forURL:URL];
        return object;
    }
    return nil;
}

- (id)createObject:(SOCPattern*)pattern fromURL:(NSURL*)URL
{
    id value = nil;
    if (pattern.selector != nil) {
        value = [pattern performSelector:pattern.selector
                                onObject:pattern.object
                            sourceString:[URL path]];
    } else {
        value = [[[[pattern object] alloc] init] autorelease];
    }
    return value;
}

@end
