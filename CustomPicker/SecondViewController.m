//
//  SecondViewController.m
//  CustomPicker
//
//  Created by Jimoh Babatunde  on 25/04/2020.
//  Copyright © 2020 Jimoh Babatunde. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *myTextfield;
@property (weak, nonatomic) IBOutlet UITextField *mTextfield2;

@property (strong, nonatomic) NSMutableArray *bandArray;
@property (strong, nonatomic) NSMutableArray *bandArray2;
@property (strong, nonatomic) UIPickerView *pickerView;
@property (readwrite, nonatomic) NSInteger check;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    _bandArray = [[NSMutableArray alloc] init];
    // add some sample data
    [_bandArray addObject:@"Offspringsdddddd"];
    [_bandArray addObject:@"Radioheaddddddd"];
    [_bandArray addObject:@"Musdddddddd"];
    [_bandArray addObject:@"R.E.M."];
    [_bandArray addObject:@"The Killers"];
    [_bandArray addObject:@"Social Distortion"];
    
    _bandArray2 = [[NSMutableArray alloc] init];
    // add some sample data
    [_bandArray2 addObject:@"mango"];
    [_bandArray2 addObject:@"apple"];
    [_bandArray2 addObject:@"mat"];
    [_bandArray2 addObject:@"good"];
    [_bandArray2 addObject:@"bag"];
    [_bandArray2 addObject:@"books"];
    // Do any additional setup after loading the view from its nib.
    
    _myTextfield.delegate = self;
    _mTextfield2.delegate = self;
    _myTextfield.tag = 1;
    _mTextfield2.tag = 2;
    [self createPickerView];
    //[self createToolbar];
    NSLog(@"here i dey 0");
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//func textFieldDidBeginEditing(_ textField: UITextField) {
//
//switch textField {
//case textField1:
//    activeTextField = 1
//    picker1.reloadAllComponents()
//case textField2:
//    activeTextField = 2
//    picker1.reloadAllComponents()
//default:
//    activeTextField = 0
//}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 1:
            NSLog(@"textfield 1");
            _check = 1;
            [self createToolbar];
            [_pickerView reloadAllComponents];
            break;
            
        case 2:
        NSLog(@"textfield 2");
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
     NSLog(@"the check dd is now %li", _check);
//     if (_check == 1) {
//         return <#expression#>
//     }
//     else if (_check == 2){
//     }
 
     switch (_check) {
         case 1:
             return [_bandArray count];
             break;
             
         case 2:
            return [_bandArray2 count];
            break;
             
         default:
             return [_bandArray count];
             break;
     }
    // return _bandArray.count;
}
// The data to return for the row and component (column) that's being passed in
 - (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
 {
     NSLog(@"the check is now %li", _check);
//     if (_check == 1){
//         _return _bandArray[row];
//     }
//     else{
//         return _bandArray2[row];
//     }
//     else {
//         return _bandArray[row];
//     }
     
     switch (_check) {
         case 1:
             return _bandArray[row];
             break;

         case 2:
            return _bandArray2[row];
            break;

         default:
             return _bandArray[row];
             break;
     }
 }

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
  //  _myTextfield.text = (_check == 1)? _bandArray[row] : _bandArray2[row];
    switch (_check) {
    case 1:
        //NSArray *sd = @[@"sed",@"sdffdf"];
        _myTextfield.text = _bandArray[row];
        break;

    case 2:
       _mTextfield2.text = _bandArray2[row];
       break;

    default:
        _myTextfield.text = _bandArray[row];
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
    label.text = (_check == 1)? _bandArray[row] : _bandArray2[row];
    
    return label;

}

-(void) createPickerView
{
    _pickerView = [[UIPickerView alloc] init];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    //NSString *dd = [_bandArray objectAtIndex:[_pickerView selectedRowInComponent:0]];
    _myTextfield.inputView = _pickerView;
    _mTextfield2.inputView = _pickerView;
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
    UIBarButtonItem *button2=[[UIBarButtonItem alloc]initWithTitle:(_check == 1)? @"Title" :  @"Title2" style:UIBarButtonItemStyleDone target:self action:@selector(closePickerView)];
    UIBarButtonItem *spacer2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *button3=[[UIBarButtonItem alloc]initWithTitle:@"Cancel3" style:UIBarButtonItemStyleDone target:self action:@selector(closePickerView)];
    
    [toolbar setItems:[[NSArray alloc] initWithObjects:doneBtn,spacer,button2,spacer2, button3, nil] animated:YES];
    [toolbar setUserInteractionEnabled:YES];
    _myTextfield.inputAccessoryView = toolbar;
    _mTextfield2.inputAccessoryView = toolbar;
}

-(void) closePickerView
{
    [self.view endEditing:YES];
}

@end

//func createPickerView()
//{
//    picker1.delegate = self
//    picker1.delegate?.pickerView?(picker1, didSelectRow: 0, inComponent: 0)
//    textField1.inputView = picker1
//    textField2.inputView = picker1
//    picker1.backgroundColor = UIColor.brown
//
//}
//func createToolbar()
//{
//    let toolbar = UIToolbar()
//    toolbar.sizeToFit()
//    toolbar.tintColor = UIColor.red
//    toolbar.backgroundColor = UIColor.blue
//    let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.closePickerView))
//    toolbar.setItems([doneButton], animated: false)
//    toolbar.isUserInteractionEnabled = true
//    textField1.inputAccessoryView = toolbar
//    textField2.inputAccessoryView = toolbar
//}

//@objc func closePickerView()
//{
//    view.endEditing(true)
//}
