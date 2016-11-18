//
//  ViewController.m
//  KIFUnitTestProject
//
//  Created by zk on 2016/11/17.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AccessibilityForDebug.h"
#import "AccessibilityConstants.h"
#import "MainViewController.h"

@interface ViewController () {
    UITextField *loginField;
    UITextField *passwordField;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //用户名
    loginField = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 200, 40)];
    [loginField setBorderStyle:UITextBorderStyleLine];
    loginField.autocorrectionType = UITextAutocorrectionTypeNo;
    loginField.autocapitalizationType = UITextAutocapitalizationTypeNone;

    [loginField setAccessibilityLabelForDebug:AccessibilityConstants.loginTextField];
    [self.view addSubview:loginField];
    
    //密码
    passwordField = [[UITextField alloc] initWithFrame:CGRectMake(50, 150, 200, 40)];
    [passwordField setSecureTextEntry:YES];
    [passwordField setBorderStyle:UITextBorderStyleLine];
    [passwordField setAccessibilityLabelForDebug:AccessibilityConstants.passwordTextField];
    passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;

    [self.view addSubview:passwordField];
    
    //登录按钮
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 40)];
    [loginBtn setAccessibilityLabelForDebug:AccessibilityConstants.loginButton];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor redColor]];
    [loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
}


- (void)loginAction:(UIButton*)btn {
    if ([loginField.text isEqualToString:@"admin"] && [passwordField.text isEqualToString:@"admin"]) {
        MainViewController *main = [[MainViewController alloc] init];
        [self.navigationController pushViewController:main animated:YES];
    }else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"登录失败" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [alertController dismissViewControllerAnimated:YES completion:NULL];
        }];
        alertController.isAccessibilityElement = YES;
        alertController.accessibilityLabel = AccessibilityConstants.theAlertView;
        [alertController addAction:action];
        [self presentViewController:alertController animated:YES completion:NULL];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
