//
//  PersonViewModel.h
//  RACCode
//
//  Created by Yan on 16/11/30.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonViewModel : NSObject

/** person array */
@property (nonatomic, strong) NSMutableArray <Person *>* arrayPerson;

/** load person as */
- (RACSignal *)loadPersons;

@end
