//
//  FSHistoryItemManagedModel+CoreDataProperties.h
//  
//
//  Created by Maksym Savisko on 4/10/17.
//
//

#import "FSHistoryItemManagedModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface FSHistoryItemManagedModel (CoreDataProperties)

+ (NSFetchRequest<FSHistoryItemManagedModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *dataId;
@property (nullable, nonatomic, copy) NSDate *searchDate;
@property (nullable, nonatomic, copy) NSString *searchTitle;
@property (nullable, nonatomic, retain) FSUserManagedModel *user;
@property (nullable, nonatomic, retain) FSFilmManagedModel *film;

@end

NS_ASSUME_NONNULL_END
