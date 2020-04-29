//
//  ViewController.m
//  CustomPicker
//
//  Created by Jimoh Babatunde  on 24/04/2020.
//  Copyright © 2020 Jimoh Babatunde. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"


@interface ViewController ()
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (IBAction)presMe:(id)sender {

    SecondViewController *confirmation = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    
    [self.navigationController pushViewController:confirmation animated:YES];
}

@end
