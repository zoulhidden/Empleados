//
//  Empleado.m
//  Empleados
//
//  Created by centro docente de computos on 29/04/15.
//  Copyright (c) 2015 UdeM. All rights reserved.
//

#import "Empleado.h"

@interface Empleado()

@property (nonatomic, strong) NSString * databasePath;
@property (nonatomic, assign) NSInteger e_Id;

@end

@implementation Empleado

-(void)searchPathDatabase{
    NSString * rutaDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _databasePath = [[NSString alloc] initWithString:[rutaDoc stringByAppendingPathComponent:@"empleados.db"]];
}

-(void)createDatabaseInDocuments{
    [self searchPathDatabase];
    
    NSFileManager *fm = [[NSFileManager alloc] init];
    NSLog(@"%@", _databasePath);
    
    if([fm fileExistsAtPath:_databasePath] == NO){
        NSLog(@"El archivo no existe.");
        const char * dbpath = [_databasePath UTF8String];
        if(sqlite3_open(dbpath, &empleadosdb)==SQLITE_OK){
            NSLog(@"El archivo fue creado.");
            
            char * errMsg;
            const char * sql_stmt = "CREATE TABLE IF NOT EXISTS EMPLOYESS (ID INTEGER PRIMARY KEY AUTOINCREMENT, EMP_CEDULA TEXT, EMP_NAME TEXT, EMP_AGE TEXT, EMP_ADRESS TEXT)";
            if(sqlite3_exec(empleadosdb, sql_stmt, NULL, NULL, &errMsg)==SQLITE_OK){
                NSLog(@"Tabla Creada Exitosamente!!..");
            }else{
                NSLog(@"Error en crear Tabla!!..:%s", errMsg);
            }
        }else{
            NSLog(@"Error en crear la base de datos.");
        }
    }else{
        NSLog(@"El archivo ya existe, no se reemplazo.");
    }
}


-(BOOL)searchEmployedInDataBasebyId{
    
    
    
    [self searchPathDatabase];
    const char * db = [_databasePath UTF8String];
    sqlite3_stmt * query;
    if(sqlite3_open(db, &empleadosdb) == SQLITE_OK){
        NSString * select = [NSString stringWithFormat:@"SELECT * FROM EMPLOYESS WHERE EMP_CEDULA = \"%@\"", _empCedula];
        const char * select_sql = [select UTF8String];
        
        if(sqlite3_prepare_v2(empleadosdb, select_sql, -1, &query, NULL) == SQLITE_OK){
            if(sqlite3_step(query) == SQLITE_ROW){
                _status = @"Registro Encontrado.";
                _empId = [NSString  stringWithFormat:@"%s", sqlite3_column_text(query, 0)];
                _empCedula = [NSString  stringWithFormat:@"%s", sqlite3_column_text(query, 1)];
                _empName = [NSString  stringWithFormat:@"%s", sqlite3_column_text(query, 2)];
                _empAge = [NSString  stringWithFormat:@"%s", sqlite3_column_text(query, 3)];
                _empAdress = [NSString  stringWithFormat:@"%s", sqlite3_column_text(query, 4)];
                
                
            }else{
                _status = @"Registro no encontrado.";
                return NO;
            }
        }else{
            _status = @"Error en el query.";
            return NO;
        }
        sqlite3_finalize(query);
        sqlite3_close(empleadosdb);
        
    }else{
        _status = @"No se pudo abrir la base de datos.";
        return NO;
    }
    return YES;
}

-(void)createEmployedInDataBase{
    [self searchPathDatabase];
    sqlite3_stmt * query;
    const char * db = [_databasePath UTF8String];
    if(sqlite3_open(db, &empleadosdb) == SQLITE_OK){
        NSString * insert = [NSString stringWithFormat:@"INSERT INTO EMPLOYESS (EMP_CEDULA, EMP_NAME, EMP_AGE, EMP_ADRESS) VALUES(\"%@\", \"%@\", \"%@\", \"%@\")", _empCedula, _empName, _empAge, _empAdress];
        
        const char * insert_sql = [insert UTF8String];
        sqlite3_prepare_v2(empleadosdb, insert_sql, -1, &query, NULL);
        if(sqlite3_step(query) == SQLITE_DONE){
            _status = @"Resgistro Almacenado.";
        }else{
            _status = @"Resgistro No Almacenado.";
        }
        sqlite3_finalize(query);
        sqlite3_close(empleadosdb);
    }else{
        _status = @"No se pudo abrir la base de datos.";
    }
}

-(void) updateInDatabase{
    
    [self searchPathDatabase];
    sqlite3_stmt *query;
    const char * db = [_databasePath UTF8String];
    if (sqlite3_open(db, &empleadosdb)==SQLITE_OK) {
        NSString * update =[NSString stringWithFormat:@"UPDATE EMPLOYESS SET EMP_NAME= \"%@\", EMP_AGE= \"%@\", EMP_ADRESS= \"%@\"  WHERE EMP_CEDULA = \"%@\"", _empName,_empAge,_empAdress, _empCedula];
        const char * update_sql =[update UTF8String];
        sqlite3_prepare_v2(empleadosdb, update_sql, -1, &query, NULL);
        if (sqlite3_step(query)==SQLITE_DONE) {
            _status = @"Registro Actualizado con exito";
        }else{
            _status =@"Fallo al actualizar registro";
        }
        sqlite3_finalize(query);
        sqlite3_close(empleadosdb);
    }else{
        _status =@"Fallo al acceder a la base de datos";
    }
}

-(void) deleteFromDatabase{
    
    
    [self searchPathDatabase];
    sqlite3_stmt * query;
    const char * db = [_databasePath UTF8String];
    if (sqlite3_open(db, &empleadosdb)==SQLITE_OK) {
        NSString *selectDelete =[NSString stringWithFormat:@"delete FROM EMPLOYESS WHERE EMP_CEDULA = \"%@\"", _empCedula];
        const char * delete_sql =[selectDelete UTF8String];
        sqlite3_prepare_v2(empleadosdb, delete_sql, -1, &query, NULL);
        if (sqlite3_step(query)==SQLITE_DONE) {
            _status =@"Registro eliminado!";
        }else{
            _status =@"Registro no existe";
            
        }
        sqlite3_finalize(query);
        sqlite3_close(empleadosdb);
    }else{
        _status=@"Fallo al acceder a la base de datos";
    }
    
    
}


@end
