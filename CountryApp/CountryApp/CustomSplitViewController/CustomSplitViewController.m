//
//  CustomSplitViewController.m
//  CountryApp
//
//  Created by Artak Martirosyan on 4/9/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "CustomSplitViewController.h"

@interface CustomSplitViewController ()

@end

@implementation CustomSplitViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    // Do any additional setup after loading the view.
    self.delegate = self;

    if ([self.viewControllers.lastObject conformsToProtocol:@protocol(DetailDelegate)]) {
        UIViewController<DetailDelegate>* detail =  self.viewControllers.lastObject;
        
        self.detailDelegate = detail;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (nullable UIViewController *)primaryViewControllerForCollapsingSplitViewController:(UISplitViewController *)splitViewController {
    return splitViewController.viewControllers.firstObject;

}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController{
    return true;
}


@end
