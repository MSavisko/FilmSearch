//
//  FSUserManagedModel+CoreDataProperties.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSUserManagedModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface FSUserManagedModel (CoreDataProperties)

+ (NSFetchRequest<FSUserManagedModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *dataId;
@property (nullable, nonatomic, retain) FSFilmManagedModel *searchHistory;

@end

NS_ASSUME_NONNULL_END
