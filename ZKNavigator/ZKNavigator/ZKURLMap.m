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
        objects = [[NSMutableArray alloc] init];
        mappings = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)dealloc {
    [patterns release];
    [objects release];
    [mappings release];
    patterns = nil;
    objects = nil;
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

- (void)addPattern:(SOCPattern*)pattern forObject:(id)object
{
    [patterns addObject:pattern];
    [objects addObject:object];
}

- (int)matchPattern:(NSURL*)URL {
    NSString* path = [URL path];
    int index = 0;

    for (SOCPattern* pattern in patterns) {
        if ([pattern stringMatches:path]) {
            return index;
        }
        index++;
    }
    return -1;
}

#pragma mark -
#pragma mark Mapping

- (void)from:(NSString*)URL toObject:(id)object
{
    SOCPattern *pattern = [SOCPattern patternWithString:URL];
    [self addPattern:pattern forObject:object];
    // NOTE Is it ok to release pattern here?
    [pattern release];
}

- (void)from:(NSString*)URL toObject:(id)object selector:(SEL)selector
{
}

- (void)setObject:(id)object forURL:(NSString*)URL
{
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
    int index = [self matchPattern:theURL];
    if (index > 0) {
        if (!object) {
            object = [self createObject:index fromURL:theURL];
        }
        SOCPattern* pattern = [patterns objectAtIndex:index];
        if (object) {
            [self setObject:object forURL:URL];
        }
        return object;
    }
    return nil;
}

@end
