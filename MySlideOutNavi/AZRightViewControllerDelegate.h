//
//  AZRightViewControllerDelegate.h
//  MySlideOutNavi
//
//  Created by zhang andy on 13-4-21.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Animal;
@protocol AZRightViewControllerDelegate <NSObject>


@optional
- (void)imageSelected:(UIImage *)image withTitle:(NSString *)imageTitle withCreator:(NSString *)imageCreator;

@required
- (void)animalSelected:(Animal *)animal;

@end
