//
//  RPSyntaxColorScheme.h
//  RPSyntaxHighlighter
//
//  Created by Rhys Powell on 19/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPSyntaxTheme : NSObject

/**
 Loads a theme definition from a JSON file
 
 This method loads a theme definition from a properly formatted JSON file and returns
 a newly instantiated object from it.
 
 @param filename the name of the JSON file, sans extension
 
 @return A newly instantiated `RPSyntaxTheme`
 */
- (instancetype)initWithContentsOfFile:(NSString *)filename;

/**
 Returns the NSTextAttributes for a given scope
 
 This method is responsible for providing a dictionary of NSTextAttributes for a given
 scope. It transforms the JSON representations of these styles into valid Objective-C
 constructs in the process.
 
 @param scope the scope to return attributes for
 
 @return an NSDictionary of NSTextAttributes
 */
- (NSDictionary *)attributesForScope:(NSString *)scope;

/**
 Default styles for the theme
 
 You probably won't need to call this function. It provides the default style to use
 for the given theme including font, foreground and background colours, and so on.
 
 @return an NSDictionary of `NSAttributedString` styles
 */
- (NSDictionary *)defaultStyles;

@end
