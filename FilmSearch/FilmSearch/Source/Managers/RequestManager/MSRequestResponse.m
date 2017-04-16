//
//  MSRequestResponse.m
//  HealthHelper
//
//  Created by Maksym Savisko on 4/7/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSRequestResponse.h"

@implementation MSRequestResponse

#pragma mark - Public Class Methods

+ (instancetype)response
{
    return [[self alloc] init];
}

+ (NSString *)errorTextFromResponse:(NSError *)error
{

    if (error.code == kCFURLErrorNotConnectedToInternet) {
        return NSLocalizedString(@"No internet connection", @"v1.0");
    }

    if (error.code == kCFURLErrorTimedOut) {
        return @"";
    }

    if (error.code == 9) {
        return @"";
    }

    if (error.code == kCFURLErrorBadServerResponse) {
        return NSLocalizedString(@"Could not connet to server, try again later", @"v1.0");
    }

    if (error == nil) {
        return @"";
    }

    id responseData = [error.userInfo valueForKey:@"com.alamofire.serialization.response.error.data"];

    if (responseData == nil && [error.userInfo valueForKey:NSLocalizedDescriptionKey]) {
        return [error.userInfo valueForKey:NSLocalizedDescriptionKey];
    }

    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];

    NSString *text = [json valueForKey:@"error"];
    if (text == nil) {
        text = [json valueForKey:@"errors"];
    }

    if (text == nil) {
        text = NSLocalizedString(@"Could not connet to server, try again later", @"v1.0");
    }

    return text;
}

#pragma mark - Initialization

- (instancetype)init
{
    if (self == [super init]) {
        _requestStartTime = [NSDate date];
    }

    return self;
}

@end
