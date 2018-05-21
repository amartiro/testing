//
//  UIViewController+ErrorHandler.m
//  CountryApp
//
//  Created by Artak Martirosyan on 5/21/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "UIViewController+ErrorHandler.h"
#import "ErrorHandler.h"


@implementation UIViewController(ErrorHandler)

-(void) showAlertWithTitle:(NSString *) title andDesctiption:(NSString *) desc andComplition:(void(^)(void)) complition{
    
    UIAlertController * alertController = [ErrorHandler.sharedManager showWithTitle:title andDesctiption:desc andComplition:complition];
    
     [self presentViewController:alertController animated:true completion:nil];
}

@end
