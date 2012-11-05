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
    
    NSDictionary *responseDict = [NSDictionary dictionaryWithObjectsAndKeys:response, @"response",
                                  questionId, @"questionId", nil];
    NSError *err;
    NSData *responseJSONData = [NSJSONSerialization dataWithJSONObject:responseDict options:0 error:&err];
    
    NSString *result = [[NSString alloc] initWithData:responseJSONData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", result);
    
    /*
    NSMutableURLRequest *postRequest = [NSMutableURLRequest requestWithURL:postURL];
    [postRequest setHTTPMethod:@"POST"];
    [postRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [postRequest setHTTPBody:[response dataUsingEncoding:NSUTF8StringEncoding]];
    [postRequest setHTTPBody:[questionId dataUsingEncoding:NSUTF8StringEncoding]];
    NSError *err;*/
    
}

@end 
