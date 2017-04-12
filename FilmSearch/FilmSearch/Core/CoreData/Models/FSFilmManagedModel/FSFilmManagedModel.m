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

@implementation FSFilmManagedModel

+ (EKManagedObjectMapping *)objectMapping
{
    EKManagedObjectMapping *mapping = [super objectMapping];
    
    [mapping mapPropertiesFromDictionary:@{
                                           FSFilmImdbIdKey : NSStringFromSelector(@selector(imdbId)),
                                           FSFilmPosterUrlIdKey : NSStringFromSelector(@selector(posterUrl)),
                                           FSFilmTitleKey : NSStringFromSelector(@selector(title))
                                           }];
    
    [mapping mapKeyPath:FSFilmReleaseDateKey toProperty:NSStringFromSelector(@selector(releaseDate)) withValueBlock:^id(NSString *key, id value, NSManagedObjectContext *context)
    {
        if ([value isKindOfClass:[NSString class]])
        {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"d LLLL yyyy"];
            
            return [formatter dateFromString:value];
        }
        
        if ([value isKindOfClass:[NSDate class]])
        {
            return value;
        }
        
        return nil;
    }
        reverseBlock:^id(id value, NSManagedObjectContext *context)
    {
        return value;
    }];
    
    return mapping;
}

@end
