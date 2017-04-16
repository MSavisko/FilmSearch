//
//  EKManagedObjectMapping+MS.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "EKManagedObjectMapping+MS.h"
#import "EKMappingBlocks+MS.h"

@implementation EKManagedObjectMapping (MS)

- (void)mapNullValueWithKeypath:(nonnull NSString *)keypath toProperty:(nonnull NSString *)property
{
    [self mapKeyPath:keypath toProperty:property withValueBlock:[EKMappingBlocks nullManagedMappingBlock] reverseBlock:[EKMappingBlocks toNullManagedMappingBlock]];
}

- (void)mapDateWithKeypath:(NSString *)keypath toProperty:(NSString *)property
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];

    [self mapKeyPath:keypath
            toProperty:property
        withValueBlock:[EKMappingBlocks stringToDateManagedMappingBlockUsingFormatter:formatter]
          reverseBlock:[EKMappingBlocks dateToStringManagedMappingBlockUsingFormatter:formatter]];
}

@end
