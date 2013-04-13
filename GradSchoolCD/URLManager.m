//
//  GSCDSender.m
//  GradSchoolCD
//
//  Created by Will Hofacker on 12/7/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import "URLManager.h"

@implementation URLManager


+(BOOL) sendToURL:(NSString *)url withData:(StudentInqury *)inquiry {

    NSString *post = [self createPost:inquiry];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSURLResponse *response;
    NSError *err;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSString *data = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
    NSLog(@"data: %@", data);
    
    if ( [data isEqualToString:@"success"] ) {
        NSLog(@"the data is in the data base");
        return YES;
    }
    else {
        if ( [data isEqualToString:@"error"] ){
            NSLog(@"connected, but with error");
            // this is where an error 
            return NO;
        }
        else {
            NSLog(@"didn't connect at all to php script");
            return NO;
        }
    }
}

// removes parts of strings that could possibly mess up the URL
+(NSString *) urlEncodeValue:(NSString *)str{
    NSString *result = (__bridge_transfer NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)str, NULL, CFSTR("?=&+"), kCFStringEncodingUTF8);
    return result;

}

// creates a sting that can be sent as post data
+(NSString *)createPost:(StudentInqury *)inquiry{

    NSString *post = [NSString stringWithFormat:@"anticipatedTerm=%@&anticipatedYear=%@&aptNum=%@&city=%@&country=%@&dateOfBith=%@&email=%@&findOutAbout=%@&institution=%@&major=%@&name=%@&otherProgram=%@&phoneNum=%@&programsIntrestedIn=%@&state=%@&street=%@&zip=%@", 
                      [self urlEncodeValue:inquiry.anticipatedTerm],
                      [self urlEncodeValue:inquiry.anticipatedYear],
                      [self urlEncodeValue:inquiry.aptNum],
                      [self urlEncodeValue:inquiry.city],
                      [self urlEncodeValue:inquiry.country],
                      [self urlEncodeValue:inquiry.dateOfBirth],
                      [self urlEncodeValue:inquiry.email],
                      [self urlEncodeValue:inquiry.findOutAbout],
                      [self urlEncodeValue:inquiry.insitution],
                      [self urlEncodeValue:inquiry.major],
                      [self urlEncodeValue:inquiry.name],
                      [self urlEncodeValue:inquiry.otherProgram],
                      [self urlEncodeValue:inquiry.phoneNum],
                      [self urlEncodeValue:inquiry.programsIntrestedIn],
                      [self urlEncodeValue:inquiry.state],
                      [self urlEncodeValue:inquiry.street],
                      [self urlEncodeValue:inquiry.zip]];
    
    return post;
}

@end
