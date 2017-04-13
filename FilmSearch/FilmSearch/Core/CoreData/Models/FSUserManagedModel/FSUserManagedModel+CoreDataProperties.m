//
//  FSUserManagedModel+CoreDataProperties.m
//  
//
//  Created by Maksym Savisko on 4/10/17.
//
//

#import "FSUserManagedModel+CoreDataProperties.h"

@implementation FSUserManagedModel (CoreDataProperties)

+ (NSFetchRequest<FSUserManagedModel *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"FSUserManagedModel"];
}

@dynamic dataId;
@dynamic searchHistory;

@end
