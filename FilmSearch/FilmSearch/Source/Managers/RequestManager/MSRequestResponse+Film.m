//
//  MSRequestResponse+Film.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSRequestResponse+Film.h"

#import "FSHistoryItemManagedModelKeys.h"
#import "FSFilmManagedModelKeys.h"

static NSString * const MSResponseKey = @"Response";
static NSString * const MSErrorKey = @"Error";

@implementation MSRequestResponse (Film)

+ (BOOL) isFilmExistInInfo:(NSDictionary *) info
{
    BOOL isExist = NO;
    
    if ([info valueForKey:MSResponseKey])
    {
        NSNumber *responseValue = [info valueForKey:MSResponseKey];
        
        isExist = responseValue.boolValue;
    }
    
    return isExist;
}

+ (NSString *) filmIdFromInfo:(NSDictionary *) info
{
    return [[info valueForKey:FSHistoryItemFilmKey] valueForKey:FSHistoryItemDataIdKey];
}

+ (NSString *) errorTextFromInfo:(NSDictionary *) info
{
    return [info valueForKey:MSErrorKey];
}


@end
