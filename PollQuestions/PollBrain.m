//
//  Questions.m
//  PollQuestions
//
//  Created by Daniel To on 11/4/12.
//  Copyright (c) 2012 ISAT 480. All rights reserved.
//

#import "PollBrain.h"
#import "Hasher.h"
#import "AESCrypt.h"


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


- (NSMutableURLRequest *)sendResponse:(NSString *)response withQuestionId:(NSString *)questionId
{
    //must send the response as a post to a url that will then update the response field in the database
    NSString *postURL = @"http://172.16.94.130/480-project/add-response.php";
    
    //Use the hasher model to hash the response and questionId
    NSString *hashResponse = [Hasher createSHA256HashFrom:response];
    NSString *hashQuestionId = [Hasher createSHA256HashFrom:questionId];
    NSLog(@"Hashed response: %@, Hashed questionId: %@", hashResponse, hashQuestionId);
    
    //trying to encrypt the same things
    NSString *encryptResponse = [AESCrypt encrypt:response password:@"chicken butt"];
    NSString *encryptQuestionId = [AESCrypt encrypt:questionId password:@"chicken butt"];
    NSLog(@"Encrypted Response: %@", encryptResponse);
    NSLog(@"Decrypted Response: %@", [AESCrypt decrypt:encryptResponse password:@"chicken butt"]);
    NSLog(@"Decrypted Response: %@", [AESCrypt decrypt:encryptQuestionId password:@"chicken butt"]);
    
    NSDictionary *responseDict = [NSDictionary dictionaryWithObjectsAndKeys:response, @"response",
                                  questionId, @"questionId", nil];
    NSError *err;
    NSData *responseJSONData = [NSJSONSerialization dataWithJSONObject:responseDict options:0 error:&err];
    
    
    NSString *result = [[NSString alloc] initWithData:responseJSONData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", result);
    NSLog(@"%@", responseJSONData);
    
    NSMutableURLRequest *postRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:postURL]];
    [postRequest setHTTPMethod:@"POST"];
    [postRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [postRequest setHTTPBody:responseJSONData];

    return postRequest;
}

@end 
