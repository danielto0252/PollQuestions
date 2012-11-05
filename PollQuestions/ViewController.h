//
//  ViewController.h
//  PollQuestions
//
//  Created by Daniel To on 10/15/12.
//  Copyright (c) 2012 ISAT 480. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextViewDelegate> 
@property (weak, nonatomic) IBOutlet UILabel *order;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UITextView *response;


@end
