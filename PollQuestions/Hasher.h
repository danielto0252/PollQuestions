//
//  Hasher.h
//  PollQuestions
//
//  Created by Daniel To on 11/12/12.
//  Copyright (c) 2012 ISAT 480. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>

@interface Hasher : NSObject

+ (NSString *)createSHA256HashFrom:(NSString *)input;
@end
