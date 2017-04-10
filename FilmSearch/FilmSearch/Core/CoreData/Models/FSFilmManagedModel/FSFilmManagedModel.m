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
                                           FSFilmReleaseDateKey : NSStringFromSelector(@selector(releaseDate)),
                                           FSFilmTitleKey : NSStringFromSelector(@selector(title))
                                           }];
    
    return mapping;
}

@end
