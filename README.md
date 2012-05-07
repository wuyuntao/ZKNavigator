ZKNavigator
===========

ZKNavigator provides URL-based navigation for Cordova/PhoneGap iOS application.

How to use ZKNavigator
----------------------

First, add `ZKNavigator` to your project.

Then open `MainViewController.h` and change super class from `CDVViewController` to `ZKViewController`.

```obj-c
// MainViewController.h
#import "ZKViewController.h"

@interface MainViewController : ZKViewController

@end
```

Routes should be defined before webview loads

```obj-c
// AppDelegate.m
- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    ...

    self.viewController.startPage = @"index.html";

    ZKNavigator *navigator = self.viewController.navigator;
    [navigator from:@"/" toController:[IndexController class]];
    [navigator from:@"/login" toController:[LoginController class]];
    [navigator from:@"/users/:username" toController:[UserController class] selector:@selector(initWithUsername:)];

    ...
}
```

Finaly, implement some view controllers.

```obj-c
// WebViewController.h
@interface UserController : ZKTemplateViewController {
    NSString* username;
}

@property (nonatomic, retain) NSString* username;

@end

// WebViewController.m
@implementation UserController

@synthesize username;

- (id)initWithUsername:(NSString*)theUsername
{
    self = [self init];
    if (self != nil) {
        // File name of template to render
        self.template = @"user.html";
        self.username = theUsername;
    }
    return self;
}

- (NSDictionary*)getContext
{
    // Provide extra context
    NSDictionary* context = [super getContext];
    NSMutableDictionary* mutableContext = [NSMutableDictionary dictionaryWithDictionary:context];
    [mutableContext setValue:username forKey:@"username"];
    return [NSDictionary dictionaryWithDictionary:mutableContext];
}

@end
```

See the example app `ZKNavigatorApp` for more details.
