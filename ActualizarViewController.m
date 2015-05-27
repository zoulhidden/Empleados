//
//  ActualizarViewController.m
//  Empleados
//
//  Created by centro docente de computos on 15/05/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "ActualizarViewController.h"
#import "Empleado.h"

@interface ActualizarViewController (){
    
    Empleado *actualizarEmpleado;
    Empleado *buscarEmpleado;
    
}

@end

@implementation ActualizarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    actualizarEmpleado = [[Empleado alloc]init];
    buscarEmpleado = [[Empleado alloc]init];
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

- (IBAction)buscarButton:(id)sender {
    buscarEmpleado.empCedula = _cedulaTxt.text;
    [buscarEmpleado searchEmployedInDataBasebyId];
    // ----------------------------------
    _cedulaTxt.text=buscarEmpleado.empCedula;
    _nombreTxt.text=buscarEmpleado.empName;
    _direccionTxt.text=buscarEmpleado.empAdress;
    _edadTxt.text=buscarEmpleado.empAge;
    
    _lblStatus.text=buscarEmpleado.status;
}

- (IBAction)actualizarButton:(id)sender {
    actualizarEmpleado.empName = _nombreTxt.text;
    actualizarEmpleado.empCedula=_cedulaTxt.text;
    actualizarEmpleado.empAdress= _direccionTxt.text;
    actualizarEmpleado.empAge=_edadTxt.text;
    
    [actualizarEmpleado updateInDatabase];
    
    _lblStatus.text = actualizarEmpleado.status;
}
@end
