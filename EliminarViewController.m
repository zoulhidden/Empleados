//
//  EliminarViewController.m
//  Empleados
//
//  Created by centro docente de computos on 20/05/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "EliminarViewController.h"
#import "Empleado.h"

@interface EliminarViewController (){
    Empleado *eliminarEmpleado;
}

@end

@implementation EliminarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    eliminarEmpleado =[[Empleado alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)eliminarButton:(id)sender {
    eliminarEmpleado.empCedula = _txtCedula.text;
    [eliminarEmpleado deleteFromDatabase];
    // ----------------------------
    _labelStatus.text=eliminarEmpleado.status;
    _txtCedula.text= @"";
}
@end
