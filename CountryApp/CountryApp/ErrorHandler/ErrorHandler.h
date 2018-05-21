//
//  ErrorHandler.h
//  CountryApp
//
//  Created by Artak on 5/19/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ErrorHandler : NSObject
//                      success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success

-(UIAlertController*) showWithTitle:(NSString *) title andDesctiption:(NSString *) desc andComplition:(void(^)(void)) complition;

+ (id)sharedManager;

@end
