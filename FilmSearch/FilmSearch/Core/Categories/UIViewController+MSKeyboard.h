//
//  UIViewController+MSKeyboard.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MSKeyboardStatus){
    
    MSKeyboardStatusUnknown = 0,
    MSKeyboardStatusHidden,
    MSKeyboardStatusShown,
    MSKeyboardStatusWillShow,
    MSKeyboardStatusWillHide
};

typedef void (^MSKeyboardAnimationBlock)();
typedef void (^MSKeyboardAnimationCompletionBlock)(BOOL finished);

@interface UIViewController (MSKeyboard)

@property (nonatomic, readonly) MSKeyboardStatus ms_keyboardStatus;

@property (nonatomic, weak, nullable) IBOutlet NSLayoutConstraint *ms_keyboardAvoidingConstraint;
@property (nonatomic, weak, nullable) IBOutlet UIView *ms_intersectionView;
@property (nonatomic, strong, readonly, nullable) NSDictionary *ms_currentUserInfo;

- (void)ms_startKeyboardNotificaitonsIfNeeded;
- (void)ms_startKeyboardNotificaitons;
- (void)ms_stopKeyboardNotificaitons;

- (void)ms_keyboardStatusDidChange:(MSKeyboardStatus)keyboardStatus;

- (void)ms_animateKeyboardStatusChangeWithBlock:(nullable MSKeyboardAnimationBlock)animationBlock;
- (void)ms_animateKeyboardStatusChangeWithBlock:(nullable MSKeyboardAnimationBlock)animationBlock completionBlock:(nullable MSKeyboardAnimationCompletionBlock)completion;

@end
