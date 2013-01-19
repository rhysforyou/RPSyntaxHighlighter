//
//  RPAppDelegate.h
//  RPSyntaxHighlighter
//
//  Created by Rhys Powell on 18/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RPViewController;

@interface RPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RPViewController *viewController;

@end
