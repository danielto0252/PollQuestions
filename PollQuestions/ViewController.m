//
//  ViewController.m
//  PollQuestions
//
//  Created by Daniel To on 10/15/12.
//  Copyright (c) 2012 ISAT 480. All rights reserved.
//

#import "ViewController.h"
#import "PollBrain.h"
#import <QuartzCore/QuartzCore.h>


@interface ViewController() <UIGestureRecognizerDelegate, NSURLConnectionDataDelegate>

@property (nonatomic, strong) PollBrain *brain;
@property (nonatomic, strong) NSString *questionId;
@property (weak, nonatomic) IBOutlet UIButton *swipeToSubmitButton;


@end

@implementation ViewController

@synthesize order = _order;
@synthesize question = _question;
@synthesize response = _response;
@synthesize brain = _brain;
@synthesize questionId = _questionId;
@synthesize swipeToSubmitButton = _swipeToSubmitButton;


//if I don't have a question yet, allocate it memory so its not nil!
- (PollBrain *) brain
{
    if (!_brain) _brain = [[PollBrain alloc] init];
    return _brain;
}


- (void)viewDidLoad
{
  
    [super viewDidLoad];
    
    self.response.layer.cornerRadius = 8;
    self.response.clipsToBounds = YES;
    [self.response.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.response.layer setBorderWidth: 2.5];
    
    UISwipeGestureRecognizer *oneFingerSwipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight:)];
    [oneFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.swipeToSubmitButton addGestureRecognizer:oneFingerSwipeRight];
    
    //must set the response UITextView to self in order to dismiss
    self.response.delegate = self;
    
    NSArray *parsedQuestions = [self.brain getParsedQuestions];
    
    NSDictionary *question;
    
    question = [parsedQuestions objectAtIndex:[parsedQuestions count] - 1];
    NSString *orderLabel = @"Question ";
    
    self.order.text = [orderLabel stringByAppendingString:[question objectForKey:@"Question_num"]];;
    self.question.text = [question objectForKey:@"Question"];
    [self.question sizeToFit];
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

- (void)swipeRight:(UISwipeGestureRecognizer *)recognizer
{
    NSString *userResponse = self.response.text;
    NSString *questionId = self.questionId;
    NSMutableURLRequest *postRequest = [self.brain sendResponse:userResponse withQuestionId:questionId];
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:postRequest delegate:self];
    
    [connection start];
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


//Must implement these for NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"Data Sent: %@", data);
}

/*
 if there is an error occured, this method will be called by connection
 */
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@" , error);
}

/*
 if data is successfully received, this method will be called by connection
 */
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Data Received!");
    [self.swipeToSubmitButton setImage:[UIImage imageNamed:@"submitted.png"] forState:UIControlStateNormal];
    self.response.text = @"";
}


@end
