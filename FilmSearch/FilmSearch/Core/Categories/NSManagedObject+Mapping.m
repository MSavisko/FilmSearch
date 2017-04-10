//
//  NSManagedObject+Mapping.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "NSManagedObject+Mapping.h"

#import "FSUserManagedModel+CoreDataClass.h"

@implementation NSManagedObject (Mapping)

+ (NSString *)entityName
{
    return NSStringFromClass([self class]);
}

+ (NSString *)ms_primaryIdKey
{
    return NSStringFromSelector(@selector(dataId));
}

+ (NSString *)ms_externalRepresentationPrimaryIdKey
{
    return NSStringFromSelector(@selector(dataId));
}

+ (EKManagedObjectMapping *)ms_primaryKeyMapping
{
    EKManagedObjectMapping *mapping = [[EKManagedObjectMapping alloc] initWithEntityName:[self entityName]];
    
    mapping.ignoreMissingFields = YES;
    
    if ( [self ms_primaryIdKey].length )
    {
        mapping.primaryKey = [self ms_primaryIdKey];
        
        [mapping mapKeyPath:[self ms_externalRepresentationPrimaryIdKey]
                 toProperty:[self ms_primaryIdKey]
             withValueBlock:^id(NSString *key, id value, NSManagedObjectContext *context) {
                 
                 return value;
             }
               reverseBlock:^id(id value, NSManagedObjectContext *context) {
                   
                   return value;
               }];
    }
    
    return mapping;
}

+ (EKManagedObjectMapping *)objectMapping
{
    EKManagedObjectMapping *mapping = [self ms_primaryKeyMapping];
    
    return mapping;
}

@end
