//
//  MSDataManager+User.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/12/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSDataManager+User.h"
#import "MSDataManager+Private.h"

#import "FSUserManagedModel.h"
#import "FSUserManagedModelKeys.h"

#import "NSString+MS.h"

@implementation MSDataManager (User)

+ (FSUserManagedModel *)currentUserModelInContext:(nullable NSManagedObjectContext *)context
{
    NSManagedObjectContext *_context = context? : [[self sharedInstance] mainContext];
    
    FSUserManagedModel *userModel = [FSUserManagedModel MR_findFirstInContext:_context];
    
    if ( !userModel )
    {
        userModel = [EKManagedObjectMapper objectFromExternalRepresentation:@{FSUserDataIdKey : [NSString ms_uuidString]}
                                                                withMapping:[FSUserManagedModel objectMapping]
                                                     inManagedObjectContext:_context];
    }
    
    return userModel;
}

+ (FSUserManagedModel *)currentUserModel
{
    return [self currentUserModelInContext:nil];
}

@end
