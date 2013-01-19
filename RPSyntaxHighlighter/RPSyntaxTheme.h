//
//  RPSyntaxColorScheme.h
//  RPSyntaxHighlighter
//
//  Created by Rhys Powell on 19/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPSyntaxTheme : NSObject

- (instancetype)initWithContentsOfFile:(NSString *)filename;
- (void)styleString:(NSMutableAttributedString *)string atRanges:(NSSet *)ranges forStyle:(NSString *)styleName;
- (NSDictionary *)defaultStyles;

@end
