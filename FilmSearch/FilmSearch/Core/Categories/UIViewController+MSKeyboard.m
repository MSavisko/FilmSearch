//
//  UIViewController+MSKeyboard.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "UIViewController+MSKeyboard.h"

#import <objc/runtime.h>

@implementation UIViewController (MSKeyboard)

- (void)setMs_keyboardStatus:(MSKeyboardStatus)ms_keyboardStatus
{
    if (ms_keyboardStatus == self.ms_keyboardStatus) {
        return;
    }

    if (![self ms_isIllogicalKeyboardStatus:ms_keyboardStatus]) {
        objc_setAssociatedObject(self, @selector(ms_keyboardStatus), @(ms_keyboardStatus), OBJC_ASSOCIATION_ASSIGN);
    }

    switch (self.ms_keyboardStatus) {
    case MSKeyboardStatusUnknown: {
        MSLogDebug(@"Keyboard status Unknown");
        break;
    }
    case MSKeyboardStatusHidden: {
        MSLogDebug(@"Keyboard status Hidden");
        break;
    }
    case MSKeyboardStatusShown: {
        MSLogDebug(@"Keyboard status Shown");
        break;
    }
    case MSKeyboardStatusWillShow: {
        MSLogDebug(@"Keyboard status Will Show");
        break;
    }
    case MSKeyboardStatusWillHide: {
        MSLogDebug(@"Keyboard status Will Hide");
        break;
    }
    }

    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self ms_keyboardStatusDidChange:ms_keyboardStatus];
        });
    } else {
        [self ms_keyboardStatusDidChange:ms_keyboardStatus];
    }
}

- (MSKeyboardStatus)ms_keyboardStatus
{
    return [objc_getAssociatedObject(self, @selector(ms_keyboardStatus)) integerValue];
}

- (void)setMs_currentUserInfo:(NSDictionary *)ms_currentUserInfo
{
    objc_setAssociatedObject(self, @selector(ms_currentUserInfo), ms_currentUserInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setMs_showsKeyboard:(BOOL)ms_showsKeyboard
{
    objc_setAssociatedObject(self, @selector(ms_showsKeyboard), @(ms_showsKeyboard), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)ms_showsKeyboard
{
    return [objc_getAssociatedObject(self, @selector(ms_showsKeyboard)) boolValue];
}

- (NSDictionary *)ms_currentUserInfo
{
    return objc_getAssociatedObject(self, @selector(ms_currentUserInfo));
}

- (MSKeyboardStatus)ms_keyboardStatusFromNotification:(NSNotification *)notification
{
    NSString *name = notification.name;

    if ([name isEqualToString:UIKeyboardWillShowNotification]) {
        return MSKeyboardStatusWillShow;
    } else if ([name isEqualToString:UIKeyboardWillHideNotification]) {
        return MSKeyboardStatusWillHide;
    } else if ([name isEqualToString:UIKeyboardDidShowNotification]) {
        return MSKeyboardStatusShown;
    } else if ([name isEqualToString:UIKeyboardDidHideNotification]) {
        return MSKeyboardStatusHidden;
    }

    return MSKeyboardStatusUnknown;
}

- (NSDictionary *)ms_userInfoFromNotification:(NSNotification *)notification
{
    CGRect beginFrame = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];

    beginFrame = [self.view convertRect:beginFrame fromView:nil];
    endFrame = [self.view convertRect:endFrame fromView:nil];

    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo addEntriesFromDictionary:notification.userInfo];

    [userInfo setValue:[NSValue valueWithCGRect:beginFrame] forKey:UIKeyboardFrameBeginUserInfoKey];
    [userInfo setValue:[NSValue valueWithCGRect:endFrame] forKey:UIKeyboardFrameEndUserInfoKey];

    return [userInfo copy];
}

#pragma mark - Notifications

- (BOOL)ms_isIllogicalKeyboardStatus:(MSKeyboardStatus)newStatus
{
    if (self.ms_keyboardStatus == MSKeyboardStatusUnknown || (self.ms_keyboardStatus == MSKeyboardStatusHidden && newStatus == MSKeyboardStatusWillShow) || (self.ms_keyboardStatus == MSKeyboardStatusWillShow && newStatus == MSKeyboardStatusShown) || (self.ms_keyboardStatus == MSKeyboardStatusShown && newStatus == MSKeyboardStatusWillHide) || (self.ms_keyboardStatus == MSKeyboardStatusWillHide && newStatus == MSKeyboardStatusHidden)) {

        return NO;
    }
    return YES;
}

- (void)ms_startKeyboardNotificaitonsIfNeeded
{
    if (self.ms_keyboardAvoidingConstraint) {
        [self ms_startKeyboardNotificaitons];
    }
}

- (void)ms_startKeyboardNotificaitons
{
    [self ms_registerForKeyboardNotificaitons:YES];
}

- (void)ms_stopKeyboardNotificaitons
{
    [self ms_registerForKeyboardNotificaitons:NO];
}

- (void)ms_registerForKeyboardNotificaitons:(BOOL)registerForNotifications
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];

    [center removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [center removeObserver:self name:UIKeyboardWillHideNotification object:nil];

    [center removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [center removeObserver:self name:UIKeyboardDidHideNotification object:nil];

    if (registerForNotifications) {
        [center addObserver:self selector:@selector(ms_keyboardUpdateNotification:) name:UIKeyboardWillShowNotification object:nil];
        [center addObserver:self selector:@selector(ms_keyboardUpdateNotification:) name:UIKeyboardWillHideNotification object:nil];

        [center addObserver:self selector:@selector(ms_keyboardUpdateNotification:) name:UIKeyboardDidShowNotification object:nil];
        [center addObserver:self selector:@selector(ms_keyboardUpdateNotification:) name:UIKeyboardDidHideNotification object:nil];
    }
}

- (void)ms_keyboardUpdateNotification:(NSNotification *)notification
{
    if (![self isViewLoaded] || !self.view.window || self.modalPresentationStyle == UIModalPresentationPopover) {
        return;
    }

    MSKeyboardStatus currentStatus = [self ms_keyboardStatusFromNotification:notification];

    self.ms_currentUserInfo = [self ms_userInfoFromNotification:notification];

    self.ms_keyboardStatus = currentStatus;
}

#pragma mark - Animations

- (void)ms_keyboardStatusDidChange:(MSKeyboardStatus)keyboardStatus
{
    [self ms_animateKeyboardStatusChangeWithBlock:nil];
}

- (void)ms_animateKeyboardStatusChangeWithBlock:(MSKeyboardAnimationBlock)animationBlock
{
    [self ms_animateKeyboardStatusChangeWithBlock:animationBlock completionBlock:nil];
}

- (void)ms_animateKeyboardStatusChangeWithBlock:(MSKeyboardAnimationBlock)animationBlock completionBlock:(MSKeyboardAnimationCompletionBlock)completion
{
    NSInteger curve = [self.ms_currentUserInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    NSTimeInterval duration = [self.ms_currentUserInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];

    CGRect beginFrame = [self.ms_currentUserInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endFrame = [self.ms_currentUserInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];

    UIView *viewForIntersection = self.ms_intersectionView ?: self.view;

    CGRect intersectionViewFrame = [viewForIntersection.superview convertRect:viewForIntersection.frame toView:self.view];

    CGRect intersectionRect = CGRectIntersection(endFrame, intersectionViewFrame);

    BOOL animated = !CGRectEqualToRect(beginFrame, endFrame);

    CGFloat bottomConstant = CGRectGetHeight(intersectionRect);

    CGFloat prevConstant = self.ms_keyboardAvoidingConstraint.constant;

    if (bottomConstant > 0.f || self.ms_keyboardStatus == MSKeyboardStatusWillHide || self.ms_keyboardStatus == MSKeyboardStatusHidden) {
        self.ms_keyboardAvoidingConstraint.constant = CGRectGetHeight(intersectionRect);
    }

    if (fabs(prevConstant - self.ms_keyboardAvoidingConstraint.constant) < DBL_EPSILON) {
        return;
    }

    [UIView animateWithDuration:animated ? duration : 0.f
                          delay:0.f
                        options:curve | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionLayoutSubviews
                     animations:^{

                         [self.view layoutIfNeeded];

                         if (animationBlock) {
                             animationBlock();
                         }
                     }
                     completion:completion];
}

#pragma mark - Outlets

- (void)setMs_keyboardAvoidingConstraint:(NSLayoutConstraint *)ms_keyboardAvoidingConstraint
{
    objc_setAssociatedObject(self, @selector(ms_keyboardAvoidingConstraint), ms_keyboardAvoidingConstraint, OBJC_ASSOCIATION_ASSIGN);
}

- (NSLayoutConstraint *)ms_keyboardAvoidingConstraint
{
    return objc_getAssociatedObject(self, @selector(ms_keyboardAvoidingConstraint));
}

- (void)setMs_intersectionView:(UIView *)ms_intersectionView
{
    objc_setAssociatedObject(self, @selector(ms_intersectionView), ms_intersectionView, OBJC_ASSOCIATION_ASSIGN);
}

- (UIView *)ms_intersectionView
{
    return objc_getAssociatedObject(self, @selector(ms_intersectionView));
}

@end
