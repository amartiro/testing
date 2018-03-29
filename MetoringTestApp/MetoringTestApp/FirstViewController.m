//
//  FirstViewController.m
//  MetoringTestApp
//
//  Created by Artak on 3/13/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    
   
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        [NSNotificationCenter.defaultCenter addObserverForName:@"Samo" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            NSLog(@"Running1 on %@ thread", [NSThread currentThread]);
            NSLog(@"FirstViewController1 %@", note.name);
        }];
        [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(notificationAction:) name:@"Samo" object:nil];
      
    });
    


}

-(void) notificationAction:(NSNotification *) notification{
    NSLog(@"Running on %@ thread", [NSThread currentThread]);
    NSLog(@"FirstViewController %@", notification.name);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
