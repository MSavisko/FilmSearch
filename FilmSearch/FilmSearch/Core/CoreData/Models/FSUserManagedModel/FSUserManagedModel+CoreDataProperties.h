//
//  FSUserManagedModel+CoreDataProperties.h
//
//
//  Created by Maksym Savisko on 4/10/17.
//
//

#import "FSUserManagedModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface FSUserManagedModel (CoreDataProperties)

+ (NSFetchRequest<FSUserManagedModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *dataId;
@property (nullable, nonatomic, retain) NSSet<FSHistoryItemManagedModel *> *searchHistory;

@end

@interface FSUserManagedModel (CoreDataGeneratedAccessors)

- (void)addSearchHistoryObject:(FSHistoryItemManagedModel *)value;
- (void)removeSearchHistoryObject:(FSHistoryItemManagedModel *)value;
- (void)addSearchHistory:(NSSet<FSHistoryItemManagedModel *> *)values;
- (void)removeSearchHistory:(NSSet<FSHistoryItemManagedModel *> *)values;

@end

NS_ASSUME_NONNULL_END
