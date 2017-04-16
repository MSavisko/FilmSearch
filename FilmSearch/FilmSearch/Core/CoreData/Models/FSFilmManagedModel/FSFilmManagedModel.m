//
//  FSFilmManagedModel.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSFilmManagedModel.h"
#import "FSHistoryItemManagedModel.h"
#import "FSFilmManagedModelKeys.h"

#import "NSManagedObject+Mapping.h"

static NSString *const FSFilmReleaseDateFormat = @"d LLLL yyyy";

@implementation FSFilmManagedModel

+ (EKManagedObjectMapping *)objectMapping
{
    EKManagedObjectMapping *mapping = [super objectMapping];

    [mapping mapPropertiesFromDictionary:@{
        FSFilmImdbIdKey : NSStringFromSelector(@selector(imdbId)),
        FSFilmPosterUrlIdKey : NSStringFromSelector(@selector(posterUrl)),
        FSFilmTitleKey : NSStringFromSelector(@selector(title))
    }];

    [mapping mapKeyPath:FSFilmPosterUrlIdKey
        toProperty:NSStringFromSelector(@selector(posterUrl))
        withValueBlock:^id(NSString *key, id value, NSManagedObjectContext *context) {
            if (![value isKindOfClass:[NSString class]]) {
                return nil;
            }

            if ([value isEqualToString:FSFilmNAKey]) {
                return nil;
            }

            return value;
        }
        reverseBlock:^id(id value, NSManagedObjectContext *context) {
            return value;
        }];

    [mapping mapKeyPath:FSFilmReleaseDateKey
        toProperty:NSStringFromSelector(@selector(releaseDate))
        withValueBlock:^id(NSString *key, id value, NSManagedObjectContext *context) {
            if ([value isKindOfClass:[NSString class]]) {


                return [[self releaseDateFormatter] dateFromString:value];
            }

            if ([value isKindOfClass:[NSDate class]]) {
                return value;
            }

            return nil;
        }
        reverseBlock:^id(id value, NSManagedObjectContext *context) {
            return value;
        }];

    return mapping;
}

+ (UIImage *)placeholder
{
    return [UIImage imageNamed:@"plc_poster"];
}

- (NSString *)stringReleaseDate
{
    return self.releaseDate ? [[self.class releaseDateFormatter] stringFromDate:self.releaseDate] : nil;
}

+ (NSDateFormatter *)releaseDateFormatter
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:FSFilmReleaseDateFormat];

    return formatter;
}

@end
