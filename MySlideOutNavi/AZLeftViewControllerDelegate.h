//
//  AZLeftViewControllerDelegate.h
//  MySlideOutNavi
//
//  Created by andyzhang on 13-4-19.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Animal;
@protocol AZLeftViewControllerDelegate <NSObject>

@optional
- (void)imageSelected:(UIImage *)image withTitle:(NSString *)imageTitle withCreator:(NSString *)imageCreator;

@required
- (void)animalSelected:(Animal *)animal;

@end
