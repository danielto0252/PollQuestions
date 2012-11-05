//
//  Questions.m
//  PollQuestions
//
//  Created by Daniel To on 11/4/12.
//  Copyright (c) 2012 ISAT 480. All rights reserved.
//

#import "PollBrain.h"

@implementation PollBrain

- (NSArray *)getParsedQuestions
{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://172.16.94.130/480-project/json-baby"]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *jsonParsingError = nil;
    NSArray *questions = [NSJSONSerialization JSONObjectWithData:response options:0 error:&jsonParsingError];
    if (questions)
        NSLog(@"Finished Parsing");
    return questions;
}


- (void)sendResponse:(NSString *)response withQuestionId:(NSString *)questionId
{
    //must send the response as a post to a url that will then update the response field in the database
    
    NSString *postURL = @"";
    NSMutableURLRequest *postResponse = [NSMutableURLRequest requestWithURL:postURL];
    [postResponse setHTTPMethod:@"POST"];
    [postResponse setHTTPBody:[response dataUsingEncoding:NSUTF8StringEncoding]];
    [postResponse setHTTPBody:[questionId dataUsingEncoding:NSUTF8StringEncoding]];
    
    
}

@end 
