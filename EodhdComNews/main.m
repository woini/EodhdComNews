//  main.m
// Created by 01.02.2025.

#import "AppDelegate.h"
#import "ECNApp.h"


int main(int argc, char * argv[]) {
    NSString * principalClassName;
    NSString * delegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        principalClassName = NSStringFromClass(ECNApp.class);
        delegateClassName = NSStringFromClass(AppDelegate.class);
    }
    return UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}
