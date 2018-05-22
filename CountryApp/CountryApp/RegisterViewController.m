//
//  RegisterViewController.m
//  CountryApp
//
//  Created by Artak Martirosyan on 5/16/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "RegisterViewController.h"
#import "Helper.h"
#import "UIViewController+ErrorHandler.h"
#import "AccountManager.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
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
- (IBAction)registerAction:(id)sender {
    Account * account = [[Account alloc] init];
    account.firstName = self.firstNameTextField.text;

    if (![Helper isValidFirstname:account.firstName]) {
        [self showAlertWithTitle:@"Information" andDesctiption:@"Please enter valid firstname." andComplition:nil];
        return;
    }
    
    account.lastName = self.lastNameTextField.text;
    if (![Helper isValidLastname:account.lastName]) {
        [self showAlertWithTitle:@"Information" andDesctiption:@"Please enter valid lastname." andComplition:nil];
        return;
    }
    
    account.userName = self.usernameTextField.text;
    if (![Helper isValidUsername:account.userName]) {
        [self showAlertWithTitle:@"Information" andDesctiption:@"Please enter valid username." andComplition:nil];
        return;
    }
    
    account.password = self.passwordTextField.text;
    if (![Helper isValidPassword:account.password]) {
        [self showAlertWithTitle:@"Information" andDesctiption:@"Please enter valid password." andComplition:nil];
        return;
    }
    
    account.country = self.countryNameTextField.text;
    if (![Helper isValidCountry:account.country]) {
        [self showAlertWithTitle:@"Information" andDesctiption:@"Please enter valid country." andComplition:nil];
        return;
    }
    
    account.capital = self.capitalNameTextField.text;
    if (![Helper isValidCapital:account.capital]) {
        [self showAlertWithTitle:@"Information" andDesctiption:@"Please enter valid capital." andComplition:nil];
        return;
    }
    
    account.language = self.languageTextField.text;
    if (![Helper isValidLanguage:account.language]) {
        [self showAlertWithTitle:@"Information" andDesctiption:@"Please enter valid language." andComplition:nil];
        return;
    }
    
    if (![[AccountManager sharedManager] registerAccount:account]) {
        [self showAlertWithTitle:@"Information" andDesctiption:@"Account already exists" andComplition:nil];
        return;
    }
    
     [self performSegueWithIdentifier:@"registrationToMenu" sender:nil];
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
