//
//  ViewController.m
//  Empleados
//
//  Created by centro docente de computos on 24/04/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "ViewController.h"
#import "Empleado.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Empleado * emp = [[Empleado alloc] init];
    [emp createDatabaseInDocuments];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
