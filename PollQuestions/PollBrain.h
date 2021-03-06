//
//  Questions.h
//  PollQuestions
//
//  Created by Daniel To on 11/4/12.
//  Copyright (c) 2012 ISAT 480. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PollBrain : NSObject 

- (NSArray *) getParsedQuestions;
- (NSMutableURLRequest *) sendResponse: (NSString *)response
       withQuestionId: (NSString *)questionId;

@end
