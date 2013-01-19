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
 Style parts of an attributed string for a given style
 
 You shouldn't need to call this method yourself. It applies styles as defined by
 the theme over the ranges given to it, typically the results of an `RPSyntaxMatcher`
 processing code.
 
 @see RPSyntaxMatcher
 
 @param string the string styles should be applied to
 @param ranges an `NSSet` of `NSValue` objects containing the ranges to be styled
 @param styleName a name corresponding to style which should be used to highlight the ranges
 */
- (void)styleString:(NSMutableAttributedString *)string atRanges:(NSSet *)ranges forStyle:(NSString *)styleName;

/**
 Default styles for the theme
 
 You probably won't need to call this function. It provides the default style to use
 for the given theme including font, foreground and background colours, and so on.
 
 @return an NSDictionary of `NSAttributedString` styles
 */
- (NSDictionary *)defaultStyles;

@end
