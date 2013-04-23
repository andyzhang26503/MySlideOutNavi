//
//  AZMainViewController.m
//  MySlideOutNavi
//
//  Created by andyzhang on 13-4-18.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import "AZMainViewController.h"

@interface AZMainViewController ()

@end

@implementation AZMainViewController

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
    
    [self setupView];
    [self setupGesture];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupGesture
{
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    gesture.delegate = self;
    gesture.minimumNumberOfTouches=1;
    gesture.maximumNumberOfTouches=1;
    //[self.view addGestureRecognizer:gesture];
    [self.centerViewController.view addGestureRecognizer:gesture];
}

- (void)handlePan:(UIPanGestureRecognizer *)gesture
{
    CGPoint p = [gesture translationInView:self.view];
    NSLog(@"p.x==%f",p.x);
    CGPoint velocity = [gesture velocityInView:self.view];
    CGFloat beginStatusOrinX = 0;
    
    [gesture.view.layer removeAllAnimations];
    UIView *outView;
    if (gesture.state == UIGestureRecognizerStateBegan) {
        if (p.x<0) {
            if (!self.showingLeftPanel) {
                outView = [self getRightView];
            }   
        }else{
            if (!self.showingRightPanel) {
                outView = [self getLeftView];
            }
        }        
        beginStatusOrinX = _centerViewController.view.frame.origin.x;
        [self.view sendSubviewToBack:outView];
        //[gesture.view bringSubviewToFront:gesture.view];
    }else if(gesture.state == UIGestureRecognizerStateChanged){
        
        gesture.view.center = CGPointMake(gesture.view.center.x+p.x, gesture.view.center.y);
        if (gesture.view.frame.origin.x<=(gesture.view.frame.size.width-SLIDE_TIMING)/2 && gesture.view.frame.origin.x>= (-gesture.view.frame.size.width+SLIDE_TIMING)/2) {
            _showPanel = NO;
        }else{
            _showPanel = YES;
        }
        
//        if (gesture.view.frame.origin.x<=(gesture.view.frame.size.width-SLIDE_TIMING)/2 && gesture.view.frame.origin.x>= (-gesture.view.frame.size.width+SLIDE_TIMING)/2) {
//            //_centerViewController.view.frame = CGRectMake(beginStatusOrinX+p.x, 0, self.view.frame.size.width, self.view.frame.size.height);
//            gesture.view.center = CGPointMake(gesture.view.center.x+p.x, gesture.view.center.y);
//            _showPanel = NO;
//        }else{
//            _showPanel = YES;
//        }
   
        [gesture setTranslation:CGPointMake(0, 0) inView:self.view];
    }else if(gesture.state == UIGestureRecognizerStateEnded){
        if (!_showPanel) {
            [self movePanelToOriginalPosition];
        } else {
            if (_showingLeftPanel) {
                [self movePanelRight];
            }  else if (_showingRightPanel) {
                [self movePanelLeft];
            }
        }
        
        //[gesture setTranslation:CGPointMake(0, 0) inView:self.view];
    }

    
    
    
//    [[[(UITapGestureRecognizer*)sender view] layer] removeAllAnimations];
//    
//	CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];
//	CGPoint velocity = [(UIPanGestureRecognizer*)sender velocityInView:[sender view]];
//    
//	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
//        UIView *childView = nil;
//        
//        if(velocity.x > 0) {
//            if (!_showingRightPanel) {
//                childView = [self getLeftView];
//            }
//        } else {
//            if (!_showingLeftPanel) {
//                childView = [self getRightView];
//            }
//			
//        }
//        // make sure the view we're working with is front and center
//        [self.view sendSubviewToBack:childView];
//        [[sender view] bringSubviewToFront:[(UIPanGestureRecognizer*)sender view]];
//	}
//    
//	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
//        
//        if(velocity.x > 0) {
//            // NSLog(@"gesture went right");
//        } else {
//            // NSLog(@"gesture went left");
//        }
//        
//        if (!_showPanel) {
//            [self movePanelToOriginalPosition];
//        } else {
//            if (_showingLeftPanel) {
//                [self movePanelRight];
//            }  else if (_showingRightPanel) {
//                [self movePanelLeft];
//            }
//        }
//	}
//    
//	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateChanged) {
//        if(velocity.x > 0) {
//            // NSLog(@"gesture went right");
//        } else {
//            // NSLog(@"gesture went left");
//        }
//        
//        // are we more than halfway, if so, show the panel when done dragging by setting this value to YES (1)
//        _showPanel = abs([sender view].center.x - _centerViewController.view.frame.size.width/2) > _centerViewController.view.frame.size.width/2;
//        
//        // allow dragging only in x coordinates by only updating the x coordinate with translation position
//        [sender view].center = CGPointMake([sender view].center.x + translatedPoint.x, [sender view].center.y);
//        [(UIPanGestureRecognizer*)sender setTranslation:CGPointMake(0,0) inView:self.view];
//        
//        // if you needed to check for a change in direction, you could use this code to do so
////        if(velocity.x*_preVelocity.x + velocity.y*_preVelocity.y > 0) {
//            // NSLog(@"same direction");
////        } else {
//            // NSLog(@"opposite direction");
////        }
//        
////        _preVelocity = velocity;
//	}
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint p = [gestureRecognizer translationInView:self.view];
    if (p.x!=0&&p.y==0) {
        return TRUE;
    }
    return NO;
}

- (void)setupView
{
    self.centerViewController = [[AZCenterViewController alloc] initWithNibName:@"AZCenterViewController" bundle:nil];
    self.centerViewController.view.tag = CENTER_TAG;
    self.centerViewController.delegate = self;
    
    [self.view addSubview:self.centerViewController.view];
    [self addChildViewController:self.centerViewController];
    [self.centerViewController didMoveToParentViewController:self];
}

- (void)showCenterViewWithShadow:(BOOL)value withOffset:(double)offset
{
    if (value) {
        [_centerViewController.view.layer setCornerRadius:offset];
        [_centerViewController.view.layer setShadowColor:[UIColor blackColor].CGColor];
        [_centerViewController.view.layer setShadowOpacity:0.8];
        [_centerViewController.view.layer setShadowOffset:CGSizeMake(offset, offset)];
        
    }else{
        [_centerViewController.view.layer setCornerRadius:0.0f];
        [_centerViewController.view.layer setShadowOffset:CGSizeMake(offset, offset)];
    }
}

- (void)movePanelToOriginalPosition
{
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _centerViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion:^(BOOL finished){
        if (finished) {
            [self resetMainView];
        }
    }];
}

- (UIView *)getLeftView
{
    if (!_leftViewController) {
        self.leftViewController = [[AZLeftPanelViewController alloc] initWithNibName:@"AZLeftPanelViewController" bundle:nil];
        self.leftViewController.view.tag = LEFT_TAG;
        self.leftViewController.delegate = _centerViewController;
        
        [self.view addSubview:self.leftViewController.view];
        [self addChildViewController:self.leftViewController];
        
        [self.leftViewController didMoveToParentViewController:self];
        
        _leftViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    
    self.showingLeftPanel = YES;
    [self showCenterViewWithShadow:YES withOffset:-2];
    UIView *view = self.leftViewController.view;
    return view;
}

- (UIView *)getRightView
{
    if (!_rightViewController) {
        self.rightViewController = [[AZRightPanelViewController alloc] initWithNibName:@"AZRightPanelViewController" bundle:nil];
        _rightViewController.view.tag = RIGHT_PANEL_TAG;
        _rightViewController.delegate = _centerViewController;
        
        [self.view addSubview:_rightViewController.view];
        [self addChildViewController:_rightViewController];
        
        [_rightViewController didMoveToParentViewController:self];
        _rightViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    self.showingRightPanel = YES;
    [self showCenterViewWithShadow:YES withOffset:-2];
    
    return _rightViewController.view;
}

- (void)movePanelRight
{
    UIView *childView = [self getLeftView];
    [self.view sendSubviewToBack:childView];
    
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _centerViewController.view.frame = CGRectMake(self.view.frame.size.width-PANEL_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion:^(BOOL finished){
        if (finished) {
            _centerViewController.leftButton.tag = 0;
        }
    }];
}

- (void)movePanelLeft
{
    UIView *childView = [self getRightView];
    [self.view sendSubviewToBack:childView];
    [UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _centerViewController.view.frame = CGRectMake(-self.view.frame.size.width+PANEL_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion:^(BOOL finished){
        if (finished) {
            _centerViewController.rightButton.tag = 0;
        }
    }];
}

- (void)resetMainView
{
    if (_leftViewController) {
        [self.leftViewController.view removeFromSuperview];
        self.leftViewController = nil;
        _centerViewController.leftButton.tag = 1;
        self.showingLeftPanel = NO;
    }
    if (_rightViewController) {
        [self.rightViewController.view removeFromSuperview];
        self.rightViewController = nil;
        _centerViewController.rightButton.tag = 1;
        self.showingRightPanel = NO;
    }
    [self showCenterViewWithShadow:NO withOffset:0];
}
@end
