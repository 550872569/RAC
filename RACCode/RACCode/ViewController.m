//
//  ViewController.m
//  RACCode
//
//  Created by Yan on 16/11/29.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** viewModel */
@property (nonatomic, strong) PersonViewModel *viewModelPerson;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self loadData];
}
- (void)loadData {
    
    [[self.viewModelPerson  loadPersons] subscribeNext:^(id x) {
        NSLog(@"x:%@",[x class]);
        
        PersonViewModel *viewModel = (PersonViewModel *)x;
        
        NSLog(@"viewModel : %@",viewModel.arrayPerson);
        
    } error:^(NSError *error) {
        NSLog(@"error:%@",error);
    } completed:^{
        NSLog(@"completed");
    }];
}

- (PersonViewModel *)viewModelPerson {
    if (!_viewModelPerson) {
        _viewModelPerson = [[PersonViewModel alloc]init];
    }
    return _viewModelPerson;
}
@end
