//
//  FSFilmManagedModel+CoreDataProperties.h
//  
//
//  Created by Maksym Savisko on 4/10/17.
//
//

#import "FSFilmManagedModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface FSFilmManagedModel (CoreDataProperties)

+ (NSFetchRequest<FSFilmManagedModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *dataId;
@property (nullable, nonatomic, copy) NSString *imdbId;
@property (nullable, nonatomic, copy) NSString *posterUrl;
@property (nullable, nonatomic, copy) NSDate *releaseDate;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, retain) NSSet<FSHistoryItemManagedModel *> *history;

@end

@interface FSFilmManagedModel (CoreDataGeneratedAccessors)

- (void)addHistoryObject:(FSHistoryItemManagedModel *)value;
- (void)removeHistoryObject:(FSHistoryItemManagedModel *)value;
- (void)addHistory:(NSSet<FSHistoryItemManagedModel *> *)values;
- (void)removeHistory:(NSSet<FSHistoryItemManagedModel *> *)values;

@end

NS_ASSUME_NONNULL_END
