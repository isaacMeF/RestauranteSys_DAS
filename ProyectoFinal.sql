create database if not exists restaurante;

use restaurante;

create table if not exists Meseros(
	MES_id int auto_increment,
    MES_Nombre varchar(50) not null,
    MES_ApeMat varchar(50) not null,
    MES_ApePat varchar(50) not null,
    
    primary key(MES_id)
);

create table if not exists ComidaXBebida(
	MENU_id int auto_increment not null,
	Entradas SET( 'Pan Dulce','Papas a la Francesa','Totopos','Churros de masa','Empanadas','Cremas' ),
	Bebidas_Alcoholicas SET( 'Corona','Indio','Jose Cuervo','Caribe','Buchanans','Heineken' ),
    Bebidas_Jugos SET( 'Naranja','Piña','Limom','Toronja','Jamaica','Mandarina' ),
    Bebidas_Malteadas SET( 'Fresa','Chocolate','Vainilla','Choco-Menta','Platano','Oreo' ),
    Comida_CarnesRojas SET( 'Carne de res con salsa roja y papas','Champiñones con carne de puerco en salsa roja','Bisteck con nopales en salsa roja con arroz','Estofado de ternera con verduras','Costillas a la BBQ','Arrechera surtido' ),
    Comida_CanesBlancas SET( 'Albondigas de pollo en salsa roja con arroz','Alitas a la BBQ con habanero','Coctel de Camarones/Pulpo','Sopa de mariscos','Langosta a la plancha con ensalada de mango','Camarones a la diabla' ),
	Postres SET( 'Pastel','Helados','Pay','Flan Napolitano','Moussse de fresa','Brownies' ),
    
    primary key(MENU_id)
);

create table if not exists Mesa(
	MESA_id int not null,
    MESA_NumPersonas int not null,
    MESA_Mesero int not null,
    
    primary key( MESA_id ),
    
    constraint MesasXMeseros
		foreign key ( MESA_Mesero )
        references Meseros( MES_id )
        on update cascade
        on delete cascade
);

create table if not exists Orden(
	ORD_id int auto_increment not null,
    ORD_Mesa int,
    
    primary key( ORD_id ),
    
    constraint MesasXOrden
		foreign key ( ORD_Mesa )
        references Mesa( MESA_id )
        on update cascade
        on delete cascade
);

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
        references ComidaXBebida( MENU_id )
        on update cascade
        on delete cascade
);