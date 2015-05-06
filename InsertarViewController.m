//
//  InsertarViewController.m
//  Empleados
//
//  Created by centro docente de computos on 29/04/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "InsertarViewController.h"

@interface InsertarViewController ()

@end

@implementation InsertarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    nuevoEmpleado = [[Empleado alloc] init];
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UIView * view in self.view.subviews){
        [view resignFirstResponder];
    }
    
}

- (IBAction)guardarEmpleado:(id)sender {
    nuevoEmpleado.empCedula = _txtCedula.text;
    nuevoEmpleado.empName = _txtNombre.text;
    nuevoEmpleado.empAdress = _txtDireccion.text;
    nuevoEmpleado.empAge = _txtEdad.text;
    
    [nuevoEmpleado createEmployedInDataBase];
    
    _lblEstado.text = nuevoEmpleado.status;
    
}
@end
