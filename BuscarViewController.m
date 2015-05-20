//
//  BuscarViewController.m
//  Empleados
//
//  Created by centro docente de computos on 29/04/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "BuscarViewController.h"
#import "Empleado.h"

@interface BuscarViewController (){
    Empleado *buscarEmpleado;
}

@end

@implementation BuscarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)searchButton:(id)sender {
    buscarEmpleado.empCedula = _cedulaText.text;
    if([buscarEmpleado searchEmployedInDataBasebyId]){
        _labelRegistro.text= buscarEmpleado.empId;
        _labelCedula.text = buscarEmpleado.empCedula;
        _labelNombre.text = buscarEmpleado.empName;
        _labelDireccion.text = buscarEmpleado.empAdress;
        _labelEdad.text=buscarEmpleado.empAge;
        
    }
    _statusTxt.text=buscarEmpleado.status;
}
@end
