//
//  MSRequestManager+Films.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSRequestManager+Films.h"

#import "MSRequestManager+Private.h"

@implementation MSRequestManager (Films)

- (void) findFilmByName:(nonnull NSString *)filmName andCompletion:(nullable MSRequestManagerResponseCompletionBlock)completion
{
    MSRequestResponse *response = [MSRequestResponse response];
    
    NSString *urlQueryfilmName = [filmName stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSString *urlString = [self apiCall:[NSString stringWithFormat:@"?t=%@&plot=full", urlQueryfilmName]];
    
    [self GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        response.isSuccess = YES;
        response.statusCode = [self statusCodeFromTask:task];
        response.object = responseObject;
        
        if (completion)
        {
            completion (response);
        }
    }
      failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        response.isSuccess = NO;
        response.statusCode = [self statusCodeFromTask:task];
        response.error = error;
        
        if (completion)
        {
            completion (response);
        }
    }];
    
}

@end
