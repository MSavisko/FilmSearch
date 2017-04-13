//
//  NSManagedObject+Mapping.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <CoreData/CoreData.h>

#import <EasyMapping/EasyMapping.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSManagedObject (Mapping) <EKManagedMappingProtocol>

+ (NSString *)entityName;
+ (nullable NSString *)ms_primaryIdKey;
+ (NSString *)ms_externalRepresentationPrimaryIdKey;

+ (EKManagedObjectMapping *)ms_primaryKeyMapping;

NS_ASSUME_NONNULL_END

@end
