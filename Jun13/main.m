//
//  main.m
//  Jun13
//
//  Created by tslocal on 6/11/13.
//  Copyright (c) 2013 acheung. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Jun13AppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
        NSLog(@"This is output produced by NSLog.");
		int i = 10;
		NSLog(@"The value of i is %d.", i);
        
		CGFloat f = 3.14159;
		NSLog(@"The value of f is %g.", f);
        
		NSString *s = @"How are you?";
		NSLog(@"The value of s is %@.", s);
		CGPoint p = CGPointMake(10.0, 20.0);
		NSLog(@"The value of p is (%g, %g).", p.x, p.y);
		CGRect r = CGRectMake(0.0, 0.0, 360.0, 480.0);
        
		NSLog(@"The value of r is (%g, %g), %g by %g.",
              r.origin. x, r.origin.y,
              r.size.width, r.size.height
              );
		//There is only one object of class UIDevice, and it already
		//exists.  Get the address of this object.
		UIDevice *device = [UIDevice currentDevice];
        
		NSString *version = device.systemVersion;
		NSLog(@"The version of iOS is %@.", version);
		//There is only one object of class UIScreen, and it already
		//exists.  Get the address of this object.
		UIScreen *screen = [UIScreen mainScreen];
        
		CGRect bounds = [screen bounds];
		NSLog(@"Origin is (%g, %g), dimensions are %g by %g.",
              bounds.origin.x, bounds.origin.y,
              bounds.size.width, bounds.size.height
              );
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([Jun13AppDelegate class]));
    }
}
