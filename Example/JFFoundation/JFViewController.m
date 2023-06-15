//
//  JFViewController.m
//  JFFoundation
//
//  Created by jumpingfrog0 on 09/10/2018.
//  Copyright (c) 2018 jumpingfrog0. All rights reserved.
//

#import "JFViewController.h"
#import <JFFoundation/JFFoundation.h>

@interface JFViewController ()

@end

@implementation JFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
////        NSLog(@"%@", [NSThread currentThread]);
//
//        jf_dispatch_main_async_safe(^{
//            NSLog(@"%@", [NSThread currentThread]);
//        });
//    });
	
    NSString *abc = @"123456789";
    NSString *str = [abc jf_stringByTruncatingToLength:3 ellipsis:YES];
    NSLog(@"%@", str);
}

@end
