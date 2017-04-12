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
#import "MSDataManager+Film.h"
#import "UIColor+MSTheme.h"

typedef NS_ENUM(NSInteger, FSSearchScreenState)
{
    FSSearchScreenStateReadyToSearch = 0,
    FSSearchScreenStateSearching,
    FSSearchScreenStateSearchFinished
};

@interface FSSearchViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic) FSSearchScreenState screenState;

@end

@implementation FSSearchViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateScreenForState:FSSearchScreenStateReadyToSearch];
    [self setupViews];
    [self setupTextField];
    [self setupButton];
    [self setupNavigationTitle];
}

#pragma mark - Setup

- (void) setupViews
{
    _activityIndicator.color = [UIColor ms_primaryRedColor];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self.view action:@selector(endEditing:)]];
}

- (void) setupTextField
{
    _searchTextField.delegate = self;
    [[MSThemeManager sharedInstance] customizeTextView:_searchTextField withPlaceholderText:NSLocalizedString(@"Enter film name", @"v1.0")];
}

- (void) setupButton
{
    [_searchButton setTitle:NSLocalizedString(@"Search", @"v1.0") forState:UIControlStateNormal];
}

- (void) setupNavigationTitle
{
    self.title = NSLocalizedString(@"Film Search", @"v1.0");
}

#pragma mark - Update Screen State

- (void) updateScreenForState:(FSSearchScreenState) state
{
    self.screenState = state;
    
    switch (state)
    {
        case FSSearchScreenStateSearchFinished:
        case FSSearchScreenStateReadyToSearch:
            _searchButton.hidden = NO;
            _searchTextField.enabled = YES;
            [_activityIndicator stopAnimating];
            break;
            
        case FSSearchScreenStateSearching:
            [_activityIndicator startAnimating];
            _activityIndicator.hidden = NO;
            _searchButton.hidden = YES;
            _searchTextField.enabled = NO;
            break;
    }
}

#pragma mark - Actions

- (IBAction)searchButtonDidPressed:(id)sender
{
    //Check for space and empty request
    [self updateScreenForState:FSSearchScreenStateSearching];
    
    
    FSFilmManagedModel *film = [MSDataManager fetchFilmsByTitle:_searchTextField.text inContext:nil].firstObject;
    
    if (film)
    {
        //TODO: Show next screen
    }
}

#pragma mark - UITextFieldDelegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //Add filter for english letters.
    /*
    NSCharacterSet *englishCharSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"];
    NSMutableCharacterSet *
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
    return [string isEqualToString:filtered];
     */
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

@end
