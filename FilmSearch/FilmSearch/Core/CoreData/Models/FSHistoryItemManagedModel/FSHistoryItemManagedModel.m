//
//  FSHistoryItemManagedModel.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSHistoryItemManagedModel.h"
#import "FSFilmManagedModel.h"
#import "FSUserManagedModel.h"

#import "FSHistoryItemManagedModelKeys.h"
#import "FSFilmManagedModelKeys.h"

#import "NSManagedObject+Mapping.h"
#import "NSString+MS.h"

@implementation FSHistoryItemManagedModel

+ (EKManagedObjectMapping *)objectMapping
{
    EKManagedObjectMapping *mapping = [super objectMapping];
    
    [mapping mapPropertiesFromDictionary:@{
                                           FSHistoryItemSearchTitleKey : NSStringFromSelector(@selector(searchTitle))
                                           }];
    
    [mapping mapKeyPath:FSHistoryItemSearchDateKey toProperty:NSStringFromSelector(@selector(searchDate)) withValueBlock:^id(NSString *key, id value, NSManagedObjectContext *context)
    {
        if (![value isKindOfClass:[NSDate class]] || value == nil)
        {
            return [NSDate date];
        }
        
        return value;
        
    }
           reverseBlock:^id(id value, NSManagedObjectContext *context)
    {
        return value;
    }];
    
    [mapping hasOne:[FSFilmManagedModel class] forKeyPath:FSHistoryItemFilmKey forProperty:NSStringFromSelector(@selector(film))];
    
    return mapping;
}

+ (NSDictionary *) representationWithSearchTitle:(NSString *) searchTitle andFilmInfo:(NSDictionary *) filmInfo
{
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:0];
    [result setValue:[NSString ms_uuidString] forKey:FSHistoryItemDataIdKey];
    [result setValue:searchTitle forKey:FSHistoryItemSearchTitleKey];
    [result setObject:[NSDate date] forKey:FSHistoryItemSearchDateKey];
    
    NSMutableDictionary *_filmInfo = [NSMutableDictionary dictionaryWithDictionary:filmInfo];
    [_filmInfo setValue:[NSString ms_uuidString] forKey:FSFilmDataIdKey];
    [result setObject:_filmInfo forKey:FSHistoryItemFilmKey];
    
    return result;
}

@end
