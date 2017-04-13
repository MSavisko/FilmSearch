//
//  FSHistoryItemManagedModel+CoreDataProperties.m
//  
//
//  Created by Maksym Savisko on 4/10/17.
//
//

#import "FSHistoryItemManagedModel+CoreDataProperties.h"

@implementation FSHistoryItemManagedModel (CoreDataProperties)

+ (NSFetchRequest<FSHistoryItemManagedModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"FSHistoryItemManagedModel"];
}

@dynamic dataId;
@dynamic searchDate;
@dynamic user;
@dynamic film;
@dynamic searchTitle;

@end
