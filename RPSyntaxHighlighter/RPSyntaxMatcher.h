//
//  RPSyntaxMatcher.h
//  RPSyntaxHighlighter
//
//  Created by Rhys Powell on 19/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPSyntaxMatcher : NSObject

@property (nonatomic, strong) NSArray *scopes;
@property (nonatomic, strong) NSRegularExpression *pattern;
@property (nonatomic, strong) NSArray *submatchers;


/**
 Creates an array of matchers from a JSON file
 
 This method takes a JSON file containing descriptions of matchers and turns
 it into an array of matcher objects. The JSON is expected to be in the
 following format:
 
     [
         {
             scopes: ["comment"],
             pattern: "\\/\\*[\\s\\S]*?\\*\\/|(\\/\\/|\\#)[\\s\\S]*?$",
         }
     ]
 
 @param filename the name of the JSON file, sans extension
 
 @return an `NSArray` of `RPSyntaxMatcher` objects
 */
+ (NSArray *)matchersWithFile:(NSString *)filename;

/**
 Finds all the matches in a given string
 
 This method returns a set of matches in the given string that match the
 object's `pattern`.
 
 @see RPScopedMatch
 
 @param string the `NSString` to be matched
 
 @return an `NSSet` of `NSScopedMatch` objects
 */
- (NSSet *)matchesInString:(NSString *)string;

@end
