//
//  EKManagedObjectMapping+MS.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <EasyMapping/EasyMapping.h>

@interface EKManagedObjectMapping (MS)

- (void)mapNullValueWithKeypath:(nonnull NSString *)keypath toProperty:(nonnull NSString *)property;
- (void)mapDateWithKeypath:(nonnull NSString *)keypath toProperty:(nonnull NSString *)property;

@end
