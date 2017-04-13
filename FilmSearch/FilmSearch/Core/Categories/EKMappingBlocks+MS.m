//
//  EKMappingBlocks+MS.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "EKMappingBlocks+MS.h"

@import HealthKit;

typedef NSString *__nullable (^PVTrimInvalidCharactersForStringBlock)(NSString *__nullable source, NSCharacterSet *__nonnull charSetToRemove);

static NSCharacterSet *unitInvalidCharacterSet = nil;
static NSCharacterSet *valueInvalidCharacterSet = nil;

@implementation EKMappingBlocks (PV)


#pragma mark - Seconds

+ (EKManagedMappingValueBlock)secondsFromStringManagedMappingBlock
{
    return ^id(NSString *key, id value, NSManagedObjectContext *context) {
        
        return [self secondsFromStringMappingBlock](key, value);
    };
}

+ (EKManagedMappingReverseValueBlock)secondsToStringManagedMappingBlock
{
    return ^id(id value, NSManagedObjectContext *context) {
        
        return [self secondsToStringMappingBlock](value);
    };
}

+ (EKMappingReverseBlock)secondsToStringMappingBlock
{
    return ^id(id value) {
        
        return [NSString stringWithFormat:@"%@ %@", value, [[HKUnit secondUnit] unitString]];
    };
}

#pragma mark - NULL

+ (EKMappingValueBlock)nullMappingBlock
{
    return ^id(NSString *key, id value) {
        
        if ( [value isKindOfClass:[NSNull class]] )
        {
            return nil;
        }
        
        return value;
    };
}

+ (EKMappingReverseBlock)toNullMappingBlock
{
    return ^id(id value) {
        
        if ( !value )
        {
            return [NSNull null];
        }
        
        return value;
    };
}

+ (EKManagedMappingValueBlock)nullManagedMappingBlock
{
    return ^id(NSString *key, id value, NSManagedObjectContext *context) {
        
        return [self nullMappingBlock](key, value);
    };
}

+ (EKManagedMappingReverseValueBlock)toNullManagedMappingBlock
{
    return ^id(id value, NSManagedObjectContext *context) {
        
        return [self toNullMappingBlock](value);
    };
}


#pragma mark - String


+ (EKMappingValueBlock)stringMappingBlock
{
    return ^id(NSString *key, id value) {
        
        if ( [value isKindOfClass:[NSString class]] )
        {
            return value;
        }
        
        if ( [value respondsToSelector:@selector(stringValue)] )
        {
            return [value stringValue];
        }
        
        return nil;
    };
}

+ (EKMappingReverseBlock)toStringMappingBlock
{
    return ^id(id value) {
        
        if ( ![value isKindOfClass:[NSString class]] )
        {
            return [value description];
        }
        
        return value;
    };
}

+ (EKManagedMappingValueBlock)stringManagedMappingBlock
{
    return ^id(NSString *key, id value, NSManagedObjectContext *context) {
        
        return [self stringMappingBlock](key, value);
    };
}

+ (EKManagedMappingReverseValueBlock)toStringManagedMappingBlock
{
    return ^id(id value, NSManagedObjectContext *context) {
        
        return [self toStringMappingBlock](value);
    };
}

#pragma mark - Date


+ (EKManagedMappingValueBlock)stringToDateManagedMappingBlockUsingFormatter:(NSDateFormatter *)formatter
{
    return ^id(NSString *key, id value, NSManagedObjectContext *context) {
        
        return [self stringToDateMappingBlockUsingFormatter:formatter](key, value);
    };
}

+ (EKManagedMappingReverseValueBlock)dateToStringManagedMappingBlockUsingFormatter:(NSDateFormatter *)formatter
{
    return ^id(id value, NSManagedObjectContext *context) {
        
        return [self dateToStringMappingBlockUsingFormatter:formatter](value);
    };
}

+ (EKMappingValueBlock)stringToDateMappingBlockUsingFormatter:(NSDateFormatter *)formatter
{
    return ^id(NSString *key, id value) {
        
        if ( [value isKindOfClass:[NSDate class]] )
        {
            return value;
        }
        
        __kindof NSObject *result = [value isKindOfClass:[NSString class]] ? [formatter dateFromString:value] : [NSNull null];
        
        return result;
    };
}

+ (EKMappingReverseBlock)dateToStringMappingBlockUsingFormatter:(NSDateFormatter *)formatter
{
    return ^id(id value) {
        
        if ( [value isKindOfClass:[NSString class]] )
        {
            return value;
        }
        
        __kindof NSObject *result = [value isKindOfClass:[NSDate class]] ? [formatter stringFromDate:value] : [NSNull null];
        
        return result;
    };
}

@end

