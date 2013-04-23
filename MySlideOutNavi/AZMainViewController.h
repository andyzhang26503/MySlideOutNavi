//
//  AZMainViewController.h
//  MySlideOutNavi
//
//  Created by andyzhang on 13-4-18.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AZCenterViewController.h"
#import "AZCenterViewControllerDelegate.h"
#import "AZLeftPanelViewController.h"
#import "AZRightPanelViewController.h"

#define CENTER_TAG 1
#define LEFT_TAG 2
#define CORNER_RADIUS 4
#define SLIDE_TIMING .26
#define PANEL_WIDTH 60
#define RIGHT_PANEL_TAG 3

@interface AZMainViewController : UIViewController<AZCenterViewControllerDelegate,UIGestureRecognizerDelegate>


@property (nonatomic,strong)AZCenterViewController *centerViewController;
@property (nonatomic,strong)AZLeftPanelViewController *leftViewController;
@property (nonatomic,strong)AZRightPanelViewController *rightViewController;
@property (nonatomic,assign)BOOL showingLeftPanel;
@property (nonatomic,assign)BOOL showingRightPanel;
@property (nonatomic,assign)BOOL showPanel;
@end
