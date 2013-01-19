//
//  RPSyntaxMatcher.m
//  RPSyntaxHighlighter
//
//  Created by Rhys Powell on 19/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import "RPSyntaxMatcher.h"

@implementation RPSyntaxMatcher

+ (NSArray *)matchersWithFile:(NSString *)filename
{
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:filename ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    
    NSError *error = nil;
    id matcherArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    if (error) {
        NSLog(@"[RPSyntaxHighlighter] Error loading matcher JSON: %@", error.localizedDescription);
    }
    
    NSMutableArray *matchers = [[NSMutableArray alloc] init];
    for (NSDictionary *matcherDict in (NSArray *)matcherArray) {
        RPSyntaxMatcher *matcher = [[RPSyntaxMatcher alloc] init];
        matcher.pattern = [NSRegularExpression regularExpressionWithPattern:matcherDict[@"pattern"] options:0 error:nil];
        matcher.scopes = matcherDict[@"scopes"];
        [matchers addObject:matcher];
    }
    
    return matchers;
}

- (NSSet *)matchesInString:(NSString *)string
{
    NSMutableSet *matches = [[NSMutableSet alloc] init];
    
    [self.pattern enumerateMatchesInString:string options:0 range:NSMakeRange(0, [string length]) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        [matches addObject:[NSValue valueWithRange:result.range]];
    }];
    
    return [NSSet setWithSet:matches];
}

@end
