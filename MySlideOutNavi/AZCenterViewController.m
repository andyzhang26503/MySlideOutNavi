//
//  AZCenterViewController.m
//  MySlideOutNavi
//
//  Created by andyzhang on 13-4-18.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import "AZCenterViewController.h"

@interface AZCenterViewController ()

@end

@implementation AZCenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animalSelected:(Animal *)animal
{
    
}

- (IBAction)btnMovePanelRight:(id)sender {
    
    UIButton *button = sender;
    switch (button.tag) {
        case 0:{
            [_delegate movePanelToOriginalPosition];
            break;
        }
        case 1:{
            [_delegate movePanelRight];
            break;
        }
        default:
            break;
    }
}

- (IBAction)btnMovePanelLeft:(id)sender {
    UIButton *button = sender;
    switch (button.tag) {
        case 0:{
            [_delegate movePanelToOriginalPosition];
            break;
        }
        case 1:{
            [_delegate movePanelLeft];
            break;
        }
        default:
            break;
    }

}
@end
