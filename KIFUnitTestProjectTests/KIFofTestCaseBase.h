//
//  KIFofTestCaseBase.h
//  KIFTeProject
//
//  Created by zk on 2016/11/17.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "AccessibilityConstants.h"
#import "UIAccessibilityElement-KIFAdditions.h"

#import <KIF/KIF.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface KIFofTestCaseBase : KIFTestCase

- (UIView *)waitForViewWithAccessibilityIdentifier:(NSString *)accessibilityIdentifier;
- (void)swipeViewWithAccessibilityIdentifier:(NSString *)identifier inDirection:(KIFSwipeDirection)direction;

@end
