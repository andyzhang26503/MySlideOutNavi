//
//  AZLeftPanelViewController.h
//  MySlideOutNavi
//
//  Created by andyzhang on 13-4-18.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AZLeftViewControllerDelegate.h"
@interface AZLeftPanelViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak)id<AZLeftViewControllerDelegate>delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
