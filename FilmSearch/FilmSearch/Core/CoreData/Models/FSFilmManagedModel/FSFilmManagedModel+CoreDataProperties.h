//
//  FSFilmManagedModel+CoreDataProperties.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSFilmManagedModel+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface FSFilmManagedModel (CoreDataProperties)

+ (NSFetchRequest<FSFilmManagedModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *dataId;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSDate *releaseDate;
@property (nullable, nonatomic, copy) NSString *posterUrl;
@property (nullable, nonatomic, copy) NSString *imdbId;
@property (nullable, nonatomic, retain) FSUserManagedModel *user;

@end

NS_ASSUME_NONNULL_END
