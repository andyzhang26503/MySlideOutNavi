//
//  AZCenterViewController.h
//  MySlideOutNavi
//
//  Created by andyzhang on 13-4-18.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AZCenterViewControllerDelegate.h"
#import "AZLeftViewControllerDelegate.h"
#import "AZRightViewControllerDelegate.h"
@interface AZCenterViewController : UIViewController<AZLeftViewControllerDelegate,AZRightViewControllerDelegate>


@property (nonatomic,weak)id<AZCenterViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

- (IBAction)btnMovePanelRight:(id)sender;
- (IBAction)btnMovePanelLeft:(id)sender;
@end
