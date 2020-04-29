//
//  SecondViewController.m
//  CustomPicker
//
//  Created by Jimoh Babatunde  on 25/04/2020.
//  Copyright © 2020 Jimoh Babatunde. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *pLanguageTextfield;
@property (weak, nonatomic) IBOutlet UITextField *fruitTextfield;

@property (strong, nonatomic) NSMutableArray *programmingLanguageList;
@property (strong, nonatomic) NSMutableArray *fruitList;
@property (strong, nonatomic) UIPickerView *pickerView;
@property (readwrite, nonatomic) NSInteger check;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    _programmingLanguageList = [[NSMutableArray alloc] init];
    // add some sample data
    [_programmingLanguageList addObject:@"Swift"];
    [_programmingLanguageList addObject:@"Objective-C"];
    [_programmingLanguageList addObject:@"C#"];
    [_programmingLanguageList addObject:@"React"];
    [_programmingLanguageList addObject:@"Go"];
    [_programmingLanguageList addObject:@"Dart"];
    
    _fruitList = [[NSMutableArray alloc] init];
    // add some sample data
    [_fruitList addObject:@"mango"];
    [_fruitList addObject:@"apple"];
    [_fruitList addObject:@"orange"];
    [_fruitList addObject:@"banana"];
    [_fruitList addObject:@"berry"];
    [_fruitList addObject:@"melon"];
    // Do any additional setup after loading the view from its nib.
    
    _pLanguageTextfield.delegate = self;
    _fruitTextfield.delegate = self;
    _pLanguageTextfield.tag = 1;
    _fruitTextfield.tag = 2;
    [self createPickerView];
    //[self createToolbar];
    NSLog(@"here i dey 0");
    
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 1:
            _check = 1;
            [self createToolbar];
            [_pickerView reloadAllComponents];
            break;
            
        case 2:
            _check = 2;
             [self createToolbar];
            [_pickerView reloadAllComponents];
        break;
            
        default:
            break;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
 {
     return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
 {
 
     switch (_check) {
         case 1:
             return [_programmingLanguageList count];
             break;
             
         case 2:
            return [_fruitList count];
            break;
             
         default:
             return [_programmingLanguageList count];
             break;
     }
}

// The data to return for the row and component (column) that's being passed in
 - (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
 {
     
     switch (_check) {
         case 1:
             return _programmingLanguageList[row];
             break;

         case 2:
            return _fruitList[row];
            break;

         default:
             return _programmingLanguageList[row];
             break;
     }
 }

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (_check) {
    case 1:
        _pLanguageTextfield.text = _programmingLanguageList[row];
        break;

    case 2:
       _fruitTextfield.text = _fruitList[row];
       break;

    default:
        _pLanguageTextfield.text = _programmingLanguageList[row];
        break;
}
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 300.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60.0;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    UILabel *label = [[UILabel alloc] init];

    if ([view isKindOfClass:[UILabel class]]) {

    }
    else {

    }
    label.textColor = [UIColor yellowColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"Helvetica" size:16];
    label.text = (_check == 1)? _programmingLanguageList[row] : _fruitList[row];
    
    return label;

}

-(void) createPickerView
{
    _pickerView = [[UIPickerView alloc] init];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    _pLanguageTextfield.inputView = _pickerView;
    _fruitTextfield.inputView = _pickerView;
    _pickerView.backgroundColor = [UIColor brownColor];
}

-(void) createToolbar
{
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar sizeToFit];
    toolbar.tintColor = [UIColor redColor];
    toolbar.backgroundColor  = [UIColor blueColor];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(closePickerView)];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *button2=[[UIBarButtonItem alloc]initWithTitle:(_check == 1)? @"Programming Language" :  @"Fruit" style:UIBarButtonItemStyleDone target:self action:@selector(closePickerView)];
    UIBarButtonItem *spacer2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *button3=[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(closePickerView)];
    
    [toolbar setItems:[[NSArray alloc] initWithObjects:doneBtn,spacer,button2,spacer2, button3, nil] animated:YES];
    [toolbar setUserInteractionEnabled:YES];
    _pLanguageTextfield.inputAccessoryView = toolbar;
    _fruitTextfield.inputAccessoryView = toolbar;
}

-(void) closePickerView
{
    [self.view endEditing:YES];
}

@end
