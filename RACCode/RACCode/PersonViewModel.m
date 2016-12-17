//
//  PersonViewModel.m
//  RACCode
//
//  Created by Yan on 16/11/30.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "PersonViewModel.h"

@implementation PersonViewModel

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.arrayPerson = [NSMutableArray array];
    }
    return self;
}

- (RACSignal *)loadPersons {

    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        
        NSLog(@"异步加载个人数组");
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            [NSThread sleepForTimeInterval:2];
            
            for (NSInteger i = 0; i < 10; i ++) {
                Person *person = [Person new];
                person.name = [@"RAC-" stringByAppendingFormat:@"%ld",i];
                person.age = 18 + arc4random_uniform(10);
                [self.arrayPerson addObject:person];
            }
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                BOOL isError = NO;
                if (isError) {
                    [subscriber sendError:[NSError errorWithDomain:@"com.sogou.error" code:1001 userInfo:@{@"error message" : @"异常错误"}]];
                } else {
                    
                    [subscriber sendNext:self];
                }
                
                [subscriber sendCompleted];
            });
        });

        
        
        return nil;
    }];
    
    
    
    

}

@end
