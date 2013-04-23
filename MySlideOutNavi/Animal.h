//
//  Animal.h
//  MySlideOutNavi
//
//  Created by andyzhang on 13-4-19.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)UIImage *image;
@property (nonatomic,copy)NSString *creator;

+ (id)itemWithTitle:(NSString *)title withImage:(UIImage *)image withCreator:(NSString *)creator;
- (id)initWithTitle:(NSString *)title withImage:(UIImage *)image withCreator:(NSString *)creator;
@end
