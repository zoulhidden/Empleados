//
//  Empleado.h
//  Empleados
//
//  Created by centro docente de computos on 29/04/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Empleado : NSObject{
    sqlite3 * empleadosdb;
}

@property NSString *empId;
@property NSString *empName;
@property NSString *empAdress;
@property NSString *empAge;
@property NSString *empCedula;

@property NSString *status;

-(void)createDatabaseInDocuments;
-(void)searchEmployedInDataBasebyId:(NSString *)cedula;
-(void)createEmployedInDataBase;

@end
