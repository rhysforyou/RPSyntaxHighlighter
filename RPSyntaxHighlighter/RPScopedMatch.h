//
//  RPScopedMatch.h
//  RPSyntaxHighlighter
//
//  Created by Rhys Powell on 19/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPScopedMatch : NSObject

@property (nonatomic) NSRange range;
@property (nonatomic, strong) NSArray *scopes;

- (BOOL)overlapsMatch:(RPScopedMatch *)match;
- (BOOL)containedByMatch:(RPScopedMatch *)match;

@end
