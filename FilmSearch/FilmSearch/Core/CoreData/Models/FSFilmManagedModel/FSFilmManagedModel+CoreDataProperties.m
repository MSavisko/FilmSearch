//
//  FSFilmManagedModel+CoreDataProperties.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSFilmManagedModel+CoreDataProperties.h"

@implementation FSFilmManagedModel (CoreDataProperties)

+ (NSFetchRequest<FSFilmManagedModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"FSFilmManagedModel"];
}

@dynamic dataId;
@dynamic title;
@dynamic releaseDate;
@dynamic posterUrl;
@dynamic imdbId;
@dynamic user;

@end
