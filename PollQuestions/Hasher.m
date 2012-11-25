//
//  Hasher.m
//  PollQuestions
//
//  Created by Daniel To on 11/12/12.
//  Copyright (c) 2012 ISAT 480. All rights reserved.
//

#import "Hasher.h"

@implementation Hasher

+ (NSString*)createSHA256HashFrom:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA256_DIGEST_LENGTH; i++)
    {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

@end
