//
//  FSBaseViewController.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/12/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSBaseViewController.h"
#import <KVOController/NSObject+FBKVOController.h>

@interface FSBaseViewController ()

@end

@implementation FSBaseViewController

#pragma mark - Initialization

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self initializeKVO];
    }

    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        [self initializeKVO];
    }

    return self;
}

- (void)initializeKVO
{
    __unused FBKVOController *initializedKVO = self.KVOController; //inititialize kvo to prevent crashes when this variable is created in dealloc method
}

- (void)dealloc
{
    [self.KVOController unobserveAll];
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
