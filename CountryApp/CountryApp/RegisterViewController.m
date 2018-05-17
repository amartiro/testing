//
//  RegisterViewController.m
//  CountryApp
//
//  Created by Artak Martirosyan on 5/16/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *countryNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *capitalNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *languageTextField;

@property (weak, nonatomic) UITextField *activeTextField;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
  //  [self.navigationController setNavigationBarHidden:false];
    [self registerForKeyboardNotifications];
}

-(void) textFieldDidBeginEditing:(UITextField *)textField{
    self.activeTextField = textField;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return true;
    
}
// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}



// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height + 50, 0.0);
    _contentScrollView.contentInset = contentInsets;
    _contentScrollView.scrollIndicatorInsets = contentInsets;
    
    CGRect visibleRect = CGRectMake(_activeTextField.frame.origin.x, _activeTextField.frame.origin.y - 1.1 * _activeTextField.frame.size.height, _activeTextField.frame.size.width, 2.1 * _activeTextField.frame.size.height);
    
    [_contentScrollView scrollRectToVisible:visibleRect animated:true];
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _contentScrollView.contentInset = contentInsets;
    _contentScrollView.scrollIndicatorInsets = contentInsets;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end