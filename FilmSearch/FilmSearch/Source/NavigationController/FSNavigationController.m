//
//  FSNavigationController.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSNavigationController.h"

#import "MSThemeManager.h"

@interface FSNavigationController ()

@end

@implementation FSNavigationController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[MSThemeManager sharedInstance] customizeNavigationBar:self.navigationBar];
}

@end
