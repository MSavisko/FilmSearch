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
@property (nullable, nonatomic, retain) FSHistoryItemManagedModel *history;

@end

NS_ASSUME_NONNULL_END
