//
//  ErrorHandler.m
//  CountryApp
//
//  Created by Artak on 5/19/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "ErrorHandler.h"
#import <UIKit/UIKit.h>

@implementation ErrorHandler


static ErrorHandler *sharedModel = nil;

+ (ErrorHandler*)sharedManager {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedModel = [[ErrorHandler alloc] init];
    });
    return sharedModel;
}

-(UIAlertController*) showWithTitle:(NSString *) title andDesctiption:(NSString *) desc andComplition:(void(^)(void)) complition{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:desc preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];

    if (complition != nil) {
        UIAlertAction * retryAction = [UIAlertAction actionWithTitle:@"Retry" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            complition();
        }];
        
        [alertController addAction:retryAction];
    }

    return alertController;
}

@end
