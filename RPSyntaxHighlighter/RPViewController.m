//
//  RPViewController.m
//  RPSyntaxHighlighter
//
//  Created by Rhys Powell on 18/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import "RPViewController.h"
#import "RPSyntaxHighlighter.h"

@interface RPViewController ()

@end

@implementation RPViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"rainbow" ofType:@"js"];
    NSString *codeSnippet = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:nil];
    NSAttributedString *code = [RPSyntaxHighlighter highlightCode:codeSnippet withLanguage:@"javascript"];
    
    [self.textView setAttributedText:code];
}

@end
