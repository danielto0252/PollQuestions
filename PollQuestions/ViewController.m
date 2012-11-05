//
//  ViewController.m
//  PollQuestions
//
//  Created by Daniel To on 10/15/12.
//  Copyright (c) 2012 ISAT 480. All rights reserved.
//

#import "ViewController.h"
#import "PollBrain.h"

@interface ViewController ()

@property (nonatomic, strong) PollBrain *brain; 
@property (nonatomic, strong) NSString *questionId;

@end

@implementation ViewController

@synthesize order = _order;
@synthesize question = _question;
@synthesize response = _response;
@synthesize brain = _brain;
@synthesize questionId = _questionId;


//if I don't have a question yet, allocate it memory so its not nil!
- (PollBrain *) brain
{
    if (!_brain) _brain = [[PollBrain alloc] init];
    return _brain;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //must set the response UITextView to self in order to dismiss
    self.response.delegate = self;
    
    NSArray *parsedQuestions = [self.brain getParsedQuestions];
    
    NSDictionary *question;
    
    question = [parsedQuestions objectAtIndex:[parsedQuestions count] - 1];
    NSString *orderLabel = @"Question ";
    
    self.order.text = [orderLabel stringByAppendingString:[question objectForKey:@"Question_num"]];;
    self.question.text = [question objectForKey:@"Question"];
    self.questionId = [question objectForKey:@"id"];
    
    //NSLog(@"%@", [question objectForKey:@"id"]);
    //NSLog(@"%@", self.questionId);
    
    /*
    * Useful logging for debugging
    *
    for (int i = 0; i < [parsedQuestions count]; i++) {
        question = [parsedQuestions objectAtIndex:i];
        NSLog(@"Question: %@", [question objectForKey:@"Question"]);
        NSLog(@"HELLO");
    }*/

}

- (IBAction)submitResponse:(id)sender
{
    NSLog(@"%@", self.questionId);
    NSString *userResponse = self.response.text;
    NSString *questionId = self.questionId;
    NSLog(@"%@, %@", userResponse, questionId);
    //[self.brain sendResponse:userResponse withQuestionId:questionId];
}


//method used to dismiss keyboard on return
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


@end
