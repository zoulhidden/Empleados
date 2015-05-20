//
//  BuscarViewController.h
//  Empleados
//
//  Created by centro docente de computos on 29/04/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuscarViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *cedulaText;
@property (strong, nonatomic) IBOutlet UILabel *labelRegistro;
@property (strong, nonatomic) IBOutlet UILabel *labelCedula;
@property (strong, nonatomic) IBOutlet UILabel *labelNombre;
@property (strong, nonatomic) IBOutlet UILabel *labelDireccion;
@property (strong, nonatomic) IBOutlet UILabel *labelEdad;
@property (strong, nonatomic) IBOutlet UILabel *statusTxt;

- (IBAction)searchButton:(id)sender;

@end
