//
//  Animal.m
//  MySlideOutNavi
//
//  Created by andyzhang on 13-4-19.
//  Copyright (c) 2013年 andyzhang. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (id)initWithTitle:(NSString *)title withImage:(UIImage *)image withCreator:(NSString *)creator
{
    self = [super init];
    if (self) {
        self.title = title;
        self.image = image;
        self.creator = creator;
    }
    return self;
}

+ (id)itemWithTitle:(NSString *)title withImage:(UIImage *)image withCreator:(NSString *)creator
{
     return [[self alloc] initWithTitle:title withImage:image withCreator:creator];
    
}
@end
