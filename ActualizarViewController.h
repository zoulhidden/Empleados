//
//  ActualizarViewController.h
//  Empleados
//
//  Created by centro docente de computos on 15/05/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "ViewController.h"

@interface ActualizarViewController : ViewController
@property (strong, nonatomic) IBOutlet UITextField *cedulaTxt;
@property (strong, nonatomic) IBOutlet UITextField *nombreTxt;
@property (strong, nonatomic) IBOutlet UITextField *direccionTxt;
@property (strong, nonatomic) IBOutlet UITextField *edadTxt;
@property (strong, nonatomic) IBOutlet UILabel *lblStatus;
- (IBAction)buscarButton:(id)sender;
- (IBAction)actualizarButton:(id)sender;

@end
