//
//  FSSearchViewController.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSSearchViewController.h"

#import "MSRequestManager+Films.h"

#import "MSThemeManager.h"


@interface FSSearchViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@end

@implementation FSSearchViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    [self setupTextField];
    [self setupButton];
    [self setupNavigationTitle];
}

#pragma mark - Setup

- (void) setupViews
{
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self.view action:@selector(endEditing:)]];
}

- (void) setupTextField
{
    [[MSThemeManager sharedInstance] customizeTextView:_searchTextField];
}

- (void) setupButton
{
    [_searchButton setTitle:NSLocalizedString(@"Search", @"v1.0") forState:UIControlStateNormal];
}

- (void) setupNavigationTitle
{
    self.title = NSLocalizedString(@"Movie Search", @"v1.0");
}

@end
