//
//  SplashViewController.m
//  CountryApp
//
//  Created by Artak Martirosyan on 5/16/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self performSelector:@selector(registrationScreen) withObject:nil afterDelay:2.0f];
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
