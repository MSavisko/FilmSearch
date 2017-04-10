//
//  FSUserManagedModel+CoreDataProperties.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSUserManagedModel+CoreDataProperties.h"

@implementation FSUserManagedModel (CoreDataProperties)

+ (NSFetchRequest<FSUserManagedModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"FSUserManagedModel"];
}

@dynamic dataId;
@dynamic searchHistory;

@end
