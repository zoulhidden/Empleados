//
//  InsertarViewController.h
//  Empleados
//
//  Created by centro docente de computos on 29/04/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empleado.h"

@interface InsertarViewController : UIViewController
{
    Empleado * nuevoEmpleado;
}

@property (strong, nonatomic) IBOutlet UITextField *txtCedula;
@property (strong, nonatomic) IBOutlet UITextField *txtNombre;
@property (strong, nonatomic) IBOutlet UITextField *txtDireccion;
@property (strong, nonatomic) IBOutlet UITextField *txtEdad;
@property (strong, nonatomic) IBOutlet UILabel *lblEstado;

- (IBAction)guardarEmpleado:(id)sender;

@end
