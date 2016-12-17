//
//  Person.m
//  RACCode
//
//  Created by Yan on 16/11/30.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description {
    
    NSArray *keys = @[@"name", @"age"];
    
    return [self dictionaryWithValuesForKeys:keys].description;
}
@end
