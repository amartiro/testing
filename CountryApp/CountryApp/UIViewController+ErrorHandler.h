//
//  UIViewController+ErrorHandler.h
//  CountryApp
//
//  Created by Artak Martirosyan on 5/21/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController(ErrorHandler)
-(void) showAlertWithTitle:(NSString *) title andDesctiption:(NSString *) desc andComplition:(void(^)(void)) complition;
@end
