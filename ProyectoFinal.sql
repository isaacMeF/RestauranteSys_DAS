create database if not exists restaurante;

use restaurante;

# Tabla Meseros
# Tipo de tabla: Independiente
# Normalizacion:
#		NF1: Cumple con esta forma normal, no se tubieron que hacer cambios
#		NF2: Cumple con esta forma normal, no se tubieron que hacer cambios
#		NF3: Cumple con esta forma normal, no se tubieron que hacer cambios
create table if not exists Meseros(
	MES_id int auto_increment,
    MES_Nombre varchar(50) not null,
    MES_ApeMat varchar(50) not null,
    MES_ApePat varchar(50) not null,
    
    primary key(MES_id), # Se uso una llave artificial para poder llevar un control mas acertado de los trabajadores
    
    index Mesero( MES_id, MES_Nombre, MES_ApeMat, MES_ApePat )
);

# Tabla ComidaxBebidas
# Tipo de tabla: Independiente
# Normalizacion:
#		NF1: Cumple con esta forma normal, no se tubieron que hacer cambios
#		NF2: Cumple con esta forma normal, no se tubieron que hacer cambios
#		NF3: Cumple con esta forma normal, no se tubieron que hacer cambios
create table if not exists ComidaxBebidas(
	CXM_ID int auto_increment,
	CXM_Nombre varchar(50) not null,
    CXM_Categoria  ENUM( 'Alcoholicas','Jugos','Refrescos','Té','Malteadas','Aguas','Carnes Rojas','Carnes Blancas','Sopas','Estofados','Pan','Cremas' ),
    CXM_Precio decimal(5,2) not null,
    
    primary key(CXM_ID), # Se uso una llave artificial para poder llevar un control mas acertado de las comidas y bebidas
    
    index ID( CXM_ID )
);

# Tabla Mesa
# Tipo de tabla: Dependiente
# Normalizacion:
#		NF1: Cumple con esta forma normal, no se tubieron que hacer cambios
#		NF2: Cumple con esta forma normal, no se tubieron que hacer cambios
#		NF3: Cumple con esta forma normal, no se tubieron que hacer cambios
create table if not exists Mesa(
	MESA_id int not null,
    MESA_NumPersonas int not null,
    MESA_Mesero int not null,
    
    primary key( MESA_id ), # Se uso una llave artificial para poder llevar un control mas acertado de las mesas
    
    index Mesa( MESA_id ),
    
    constraint MesasXMeseros
		foreign key ( MESA_Mesero )
        references Meseros( MES_id )
        on update cascade
        on delete cascade
);

# Tabla Orden
# Tipo de tabla: Dependiente
# Normalizacion:
#		NF1: Cumple con esta forma normal, no se tubieron que hacer cambios
#		NF2: Cumple con esta forma normal, no se tubieron que hacer cambios
#		NF3: Cumple con esta forma normal, no se tubieron que hacer cambios
create table if not exists Orden(
	ORD_id int auto_increment not null,
    ORD_Mesa int,
    ORD_Fecha datetime not null,
    ORD_CostoTotal int,
    
    primary key( ORD_id ), # Se uso una llave artificial para poder llevar un control mas acertado de las ordenes
    
    index Orden( ORD_id ),
    
    constraint MesasXOrden
		foreign key ( ORD_Mesa )
        references Mesa( MESA_id )
        on update cascade
        on delete cascade
);

# Tabla OrdenESPEC
# Tipo de tabla: Dependiente
# Normalizacion:
#		NF1: No cumple con esta forma normal, no se realizaran cambios, no necesita una llave primaria ya que es solo un intermediario para evitar una relacion muchos a muchos.
#		NF2: No cumple con la NF1.
#		NF3: No cumple con la NF2.
create table if not exists OrdenESPEC(
	ORDs_id int,
    ORDs_Detalles int not null,
        
	constraint OrdenDEP
		foreign key ( ORDs_ID )
        references Orden( ORD_id )
        on update cascade
        on delete cascade,
        
	constraint ComidaXOrden
		foreign key ( ORDs_Detalles )
        references ComidaxBebidas( CXM_ID )
        on update cascade
        on delete cascade
);