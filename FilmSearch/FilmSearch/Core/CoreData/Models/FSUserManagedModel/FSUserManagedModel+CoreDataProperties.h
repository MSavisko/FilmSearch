//
//  FSUserManagedModel+CoreDataProperties.h
//  
//
//  Created by Maksym Savisko on 4/10/17.
//
//

#import "FSUserManagedModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface FSUserManagedModel (CoreDataProperties)

+ (NSFetchRequest<FSUserManagedModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *dataId;
@property (nullable, nonatomic, retain) FSHistoryItemManagedModel *searchHistory;

@end

NS_ASSUME_NONNULL_END
