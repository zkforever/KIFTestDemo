//
//  KIFLoginTest.m
//  KIFTeProject
//
//  Created by zk on 2016/11/17.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "KIFofTestCaseBase.h"

@interface KIFLoginTest : KIFofTestCaseBase

@end

@implementation KIFLoginTest

- (void)beforeEach {
    [super beforeEach];
}

- (void)afterEach {
    [super afterEach];
}


- (void)testLoginSuccess {
    [tester enterText:@"admin" intoViewWithAccessibilityLabel:AccessibilityConstants.loginTextField];
    [tester enterText:@"admin" intoViewWithAccessibilityLabel:AccessibilityConstants.passwordTextField];
    [tester tapViewWithAccessibilityLabel:AccessibilityConstants.loginButton];
    [tester waitForViewWithAccessibilityLabel:AccessibilityConstants.mainView];
}

- (void)testLoginFailed {
    [tester enterText:@"admin123" intoViewWithAccessibilityLabel:AccessibilityConstants.loginTextField];
    [tester enterText:@"admin" intoViewWithAccessibilityLabel:AccessibilityConstants.passwordTextField];
    [tester tapViewWithAccessibilityLabel:AccessibilityConstants.loginButton];
    [tester waitForViewWithAccessibilityLabel:@"登录失败"];
}


- (void)testMain {
    [self testLoginSuccess];
    UITableView *tableView = (UITableView*)[tester waitForViewWithAccessibilityLabel:AccessibilityConstants.mainTable];
    NSInteger firstCount = [tableView numberOfRowsInSection:0];
    [tester swipeRowAtIndexPath:[NSIndexPath indexPathForRow:5 inSection:0] inTableView:tableView inDirection:KIFSwipeDirectionLeft];
    [tester tapViewWithAccessibilityLabel:@"删除"];
    NSInteger lastCount = [tableView numberOfRowsInSection:0];
    XCTAssertTrue(firstCount == lastCount + 1);
    NSError *err = nil;
    XCTAssert([tester tryFindingViewWithAccessibilityLabel:@"第6行" error:&err] == NO);
    XCTAssert([tester tryFindingViewWithAccessibilityLabel:@"第7行" error:&err] == YES);
    XCTAssert([tester tryFindingViewWithAccessibilityLabel:@"第5行" error:&err] == YES);
}



@end
