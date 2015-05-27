//
//  EliminarViewController.h
//  Empleados
//
//  Created by centro docente de computos on 20/05/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "ViewController.h"

@interface EliminarViewController : ViewController
@property (strong, nonatomic) IBOutlet UITextField *txtCedula;
@property (strong, nonatomic) IBOutlet UILabel *labelStatus;
//------------------------
- (IBAction)eliminarButton:(id)sender;

@end
