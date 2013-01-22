//
//  RPScopedMatch.m
//  RPSyntaxHighlighter
//
//  Created by Rhys Powell on 19/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import "RPScopedMatch.h"

@implementation RPScopedMatch

- (BOOL)overlapsMatch:(RPScopedMatch *)match
{
    CGFloat thisStart  = self.range.location;
    CGFloat thisEnd    = self.range.location + self.range.length;
    CGFloat otherStart = match.range.location;
    CGFloat otherEnd   = match.range.location + match.range.length;
    
    if (thisEnd > otherStart && thisEnd < otherEnd) {
        return YES;
    } else if (thisStart > otherStart && thisStart < otherEnd) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)containedByMatch:(RPScopedMatch *)match
{
    CGFloat thisStart  = self.range.location;
    CGFloat thisEnd    = self.range.location + self.range.length;
    CGFloat otherStart = match.range.location;
    CGFloat otherEnd   = match.range.location + match.range.length;
    
    if (thisStart > otherStart && thisStart < otherEnd && thisEnd > otherStart && thisEnd < otherEnd) {
        return YES;
    } else {
        return NO;
    }
}

@end
