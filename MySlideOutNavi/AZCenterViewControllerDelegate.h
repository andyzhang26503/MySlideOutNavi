//
//  AZCenterViewControllerDelegate.h
//  MySlideOutNavi
//
//  Created by andyzhang on 13-4-19.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AZCenterViewControllerDelegate <NSObject>

@optional
- (void)movePanelLeft;
- (void)movePanelRight;

@required
- (void)movePanelToOriginalPosition;

@end
