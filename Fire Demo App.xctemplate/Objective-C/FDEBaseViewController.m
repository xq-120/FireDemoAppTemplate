//
//  FDEBaseViewController.m
//  Demon
//
//  Created by xuequan on 2020/1/29.
//  Copyright © 2020 xuequan. All rights reserved.
//

#import "FDEBaseViewController.h"

@interface FDEBaseViewController ()

@end

@implementation FDEBaseViewController

- (void)dealloc
{
    NSLog(@"%@销毁", self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
}


@end
