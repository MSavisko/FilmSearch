//
//  FSFilmManagedModel+CoreDataProperties.m
//  
//
//  Created by Maksym Savisko on 4/10/17.
//
//

#import "FSFilmManagedModel+CoreDataProperties.h"

@implementation FSFilmManagedModel (CoreDataProperties)

+ (NSFetchRequest<FSFilmManagedModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"FSFilmManagedModel"];
}

@dynamic dataId;
@dynamic imdbId;
@dynamic posterUrl;
@dynamic releaseDate;
@dynamic title;
@dynamic history;

@end
