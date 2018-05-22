//
//  Account.h
//  CountryApp
//
//  Created by Artak Martirosyan on 5/22/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

@property (nonatomic, strong) NSString * firstName;
@property (nonatomic, strong) NSString * lastName;
@property (nonatomic, strong) NSString * userName;
@property (nonatomic, strong) NSString * password;
@property (nonatomic, strong) NSString * country;
@property (nonatomic, strong) NSString * capital;
@property (nonatomic, strong) NSString * language;

@end
