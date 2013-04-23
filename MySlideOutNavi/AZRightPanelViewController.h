//
//  AZRightPanelViewController.h
//  MySlideOutNavi
//
//  Created by andyzhang on 13-4-18.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AZRightViewControllerDelegate.h"
@interface AZRightPanelViewController : UIViewController

@property (nonatomic,weak)id<AZRightViewControllerDelegate>delegate;
@end
