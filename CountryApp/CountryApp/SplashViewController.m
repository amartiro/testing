//
//  SplashViewController.m
//  CountryApp
//
//  Created by Artak Martirosyan on 5/16/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "SplashViewController.h"
#import "AccountManager.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([[AccountManager sharedManager] getAccountName] != nil) {
        [self openMenuScreen];
    } else {
        [self registrationScreen];
    }
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if ([[AccountManager sharedManager] getAccountName] != nil) {
        [self openMenuScreen];
    } else {
        [self registrationScreen];
    }
}

-(void) registrationScreen {
    [self performSegueWithIdentifier:@"splashToRegistration" sender:nil];
}

-(void) openMenuScreen {
    [self performSegueWithIdentifier:@"splashToMenu" sender:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
