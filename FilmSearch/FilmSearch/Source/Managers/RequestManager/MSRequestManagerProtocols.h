//
//  MSRequestManagerProtocols.h
//  HealthHelper
//
//  Created by Maksym Savisko on 4/7/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

@import Foundation;
#import "MSRequestManagerConstants.h"

@class MSRequestToken;

NS_ASSUME_NONNULL_BEGIN

@protocol MSRequestManagerProtocol <NSObject>

@property (nonatomic, copy, nullable) MSRequestToken *accessToken;
@property (nonatomic, readonly, copy) NSString *serverAddress;

@property (nonatomic, getter=isAuthorize, readonly) BOOL authorize;
@property (nonatomic, getter=isOffline, readonly) BOOL offline;

@end

@protocol MSRequestManagerFilmsProtocol <MSRequestManagerProtocol>

- (void)findFilmByName:(nonnull NSString *)filmName andCompletion:(nullable MSRequestManagerResponseCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
