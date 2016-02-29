//
//  MiscUtils.m
//  
//
//  Created by Emiliano Bivachi on 15/11/15.
//
//

#import "MiscUtils.h"

@implementation MiscUtils

+ (void) addConstraintsToMatchItsSuperView: (UIView *)view {
    [view setTranslatesAutoresizingMaskIntoConstraints: NO];
    [view.superview addConstraints: [[self class] constraintsToMatchSizeOfView:view intoView:view.superview]];
}

+ (void) addConstraintsToMatchItsSuperView:(UIView *)view withInsets:(UIEdgeInsets)insets {
    [view setTranslatesAutoresizingMaskIntoConstraints: NO];
    [view.superview addConstraints: [[self class] constraintsToMatchSizeOfView:view
                                                                      intoView:view.superview
                                                                    withInsets:insets]];
}

+ (NSArray *) constraintsToMatchSizeOfView: (UIView *) view intoView: (UIView *) superview {
    return [[self class]constraintsToMatchSizeOfView:view intoView:superview withInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
}

+ (NSArray *) constraintsToMatchSizeOfView: (UIView *) view intoView: (UIView *) superview withInsets:(UIEdgeInsets)insets {
    NSLayoutConstraint *topAlign = [NSLayoutConstraint constraintWithItem:view
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:superview
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:insets.top];
    
    NSLayoutConstraint *leadAlign = [NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:superview
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1.0
                                                                  constant:insets.left];
    
    NSLayoutConstraint *bottomAlign = [NSLayoutConstraint constraintWithItem:view
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:superview
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1.0
                                                                    constant:insets.bottom];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:view
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:superview
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:insets.right];
    
    return @[topAlign, leadAlign, bottomAlign, trailing];
}

@end

