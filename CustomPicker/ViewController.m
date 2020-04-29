//
//  ViewController.m
//  CustomPicker
//
//  Created by Jimoh Babatunde  on 24/04/2020.
//  Copyright © 2020 Jimoh Babatunde. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "DownPicker.h"


@interface ViewController ()<UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *myPicker2;

@property (weak, nonatomic) IBOutlet UITextField *realTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *myPicker;
@property (strong, nonatomic) DownPicker *downPicker;
@property (strong, nonatomic) NSMutableArray *sports;
@property (strong, nonatomic) NSArray *picker2Options;
@property (strong, strong) NSArray *arrTemp;
@property (strong, strong) NSMutableArray *arrSample;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSDictionary *dd =  @{@"dd": @"ddd"};
//    NSArray *arr = [@{@"dd": @"ddd"}];
    // create the array of data
    self.myPicker.delegate = self;
    self.myPicker.dataSource = self;
    self.myPicker2.delegate = self;
    self.myPicker2.dataSource = self;
    //_picker2Options = [[NSMutableArray alloc] init];
    _picker2Options = @[@"Item 1",@"Item 2",@"Item 3",@"Item 4"];
    _sports = [NSMutableArray arrayWithObjects:
    @"Cricket", @"Football",
    @"Hockey", @"Table Tennis", nil];
    NSMutableArray* bandArray = [[NSMutableArray alloc] init];
    _arrTemp = @[
    @{@"Appearance" : @"Copper",
      @"Bitterness" : @"50",
      @"Style" : @"India Pale Ale (IPA)"},

    @{@"Appearance" : @"Jet Black",
      @"Bitterness" : @"35",
      @"Style" : @"Stout"},

    @{@"Appearance" : @"Copper2",
      @"Bitterness" : @"25",
      @"Style" : @"English Brown Ale"},

    @{@"Appearance" : @"Deep Gold",
      @"Bitterness" : @"252",
      @"Style" : @"Bock"},
    
    @{@"Appearance" : @"Sand",
      @"Bitterness" : @"253",
      @"Style" : @"Bock"},
    
    @{@"Appearance" : @"Silver",
      @"Bitterness" : @"254",
      @"Style" : @"Bock"}
    
    ];
    _arrSample = [NSMutableArray array] ;
    for (int i=0; i<[_arrTemp count]; i++) {
        NSMutableDictionary *dd = [_arrTemp objectAtIndex:i];
        NSLog(@"the stuff is %@", dd);
        [_arrSample addObject:[dd objectForKey:@"Appearance"]];
    }
    NSLog(@"the array is %@", _arrSample);
    // add some sample data
    [bandArray addObject:@"Offsprings"];
    [bandArray addObject:@"Radiohead"];
    [bandArray addObject:@"Muse"];
    [bandArray addObject:@"R.E.M."];
    [bandArray addObject:@"The Killers"];
    [bandArray addObject:@"Social Distortion"];

    // bind yourTextField to DownPicker
    self.downPicker = [[DownPicker alloc] initWithTextField:self.myTextField withData:_arrSample];
    self.myPicker.tag = 2;
    self.myPicker2.tag = 4;
    NSLog(@"the tags are %li and %li", [_myPicker tag], [_myPicker2 tag]);
}
- (IBAction)presMe:(id)sender {
    NSLog(@"the text is %@", _myTextField.text);
    NSString *dd = [_arrSample objectAtIndex:[_myPicker selectedRowInComponent:0]];
    NSString *dd1 = [_arrSample objectAtIndex:[_myPicker2 selectedRowInComponent:0]];
    NSLog(@"it is %@", dd);
    NSLog(@"it is 2 %@", dd1);
    SecondViewController *confirmation = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    
    [self.navigationController pushViewController:confirmation animated:YES];
    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    SecondViewController *creaccVC = [storyboard instantiateViewControllerWithIdentifier:@"secondVC"];
//    [self.navigationController pushViewController:creaccVC animated:YES];
//    SecondViewController *ViewController2 = [self storyboardinstantiateViewControllerWithIdentifier:@"SecondViewController"];
//    [self.navigationController pushViewController: ViewController2 animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"i'm herhghe");
    NSLog(@"sdfdsf %@ ", _myTextField.text);
    _myLabel.text = _myTextField.text;
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"i'm here");
    _myLabel.text = textField.text;
    
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
 {
     return 1;
}
// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
 {
     
     return _arrSample.count;
}
// The data to return for the row and component (column) that's being passed in
 - (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
 {
     
     return _arrSample[row];
 }

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ([pickerView tag] == 1) {
        NSLog(@"the s index at %li is %@", row, _arrSample[row]);
        NSMutableDictionary *strV = [_arrTemp objectAtIndex:row];
        NSLog(@"the guy is %@", [strV objectForKey:@"Bitterness"]);
        _myLabel.text = [strV objectForKey:@"Bitterness"];
    }
    else {
        
    }
    

}

//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
//{
//    return 100.0;
//}
//
//- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
//{
//    return 60.0;
//}
//
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
////    var label:UILabel
////
////    if let v = view as? UILabel{
////        label = v
////    }
////    else{
////        label = UILabel()
////    }
////
////    label.textColor = UIColor.yellow
////    label.textAlignment = .left
////    label.font = UIFont(name: "Helvetica", size: 16)
////
////    label.text = arrayOfCountries[row]
////
////    return label
//    UILabel *label = [[UILabel alloc] init];
//
//    if ([view isKindOfClass:[UILabel class]]) {
//
//    }
//    else {
//
//    }
//    label.textColor = [UIColor yellowColor];
//    label.textAlignment = NSTextAlignmentLeft;
//    label.font = [UIFont fontWithName:@"Helvetica" size:16];
//    label.text = _arrSample[row];
//    return label;
//
//}
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
//
//@objc func closePickerView()
//{
//    view.endEditing(true)
//}
