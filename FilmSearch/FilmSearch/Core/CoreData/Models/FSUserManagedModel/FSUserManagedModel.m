//
//  FSUserManagedModel.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSUserManagedModel.h"
#import "FSHistoryItemManagedModel.h"
#import "FSUserManagedModelKeys.h"

#import "NSManagedObject+Mapping.h"

@implementation FSUserManagedModel

+ (EKManagedObjectMapping *)objectMapping
{
    EKManagedObjectMapping *mapping = [super objectMapping];
    
    [mapping hasMany:[FSHistoryItemManagedModel class] forKeyPath:FSUserSearchHistoryKey forProperty:NSStringFromSelector(@selector(searchHistory))];
    
    return mapping;
}

@end
