-- El objetivo es realizar una base de datos de un local de venta de productos de cerámica.
-- El negocio compra productos al proveedor para luego sus empleados realizar ventas a los clientes.


CREATE DATABASE ceramicAna;

use ceramicAna;

CREATE TABLE Negocio(
    id_negocio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(20)
)
COMMENT "Contiene información básica del negocio que compra productos al proveedor"
;


CREATE TABLE Proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(20)
)
COMMENT "Contiene información del Proveedor que le vende productos al negocio"
;



CREATE TABLE Producto(
	id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2)
)
COMMENT "Contiene información de los productos que se utilizan en las ventas"
;


CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(20)
)
COMMENT "Contiene información de los clientes que compran los productos del negocio"
    ;

CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    cargo VARCHAR(100),
    fecha_contratacion DATE,
    salario DECIMAL(10, 2)
)
COMMENT "Contiene información de los empleados que realizan ventas de productos a los clientes"
;
CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATETIME,
    total DECIMAL(10, 2)
)

COMMENT "Contiene información de las ventas de Productos que son realizadas por los Empleados a los Clientes "
;


-- Se agregan las FK
-- FK Proveedor
ALTER TABLE Proveedor
ADD COLUMN id_negocio INT,
ADD FOREIGN KEY (id_negocio) REFERENCES Negocio(id_negocio);
-- FK Producto
ALTER TABLE Producto
ADD COLUMN id_negocio INT,
ADD COLUMN id_proveedor INT,
ADD FOREIGN KEY (id_negocio) REFERENCES Negocio(id_negocio),
ADD FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor);
-- FK Clientes
ALTER TABLE Clientes
ADD COLUMN id_producto INT,
ADD FOREIGN KEY (id_producto) REFERENCES Producto(id_producto);

-- FK Empleados
ALTER TABLE Empleados
ADD COLUMN id_negocio INT,
ADD FOREIGN KEY (id_negocio) REFERENCES Negocio(id_negocio);

-- FK Ventas
ALTER TABLE Ventas
ADD COLUMN id_negocio INT,
ADD FOREIGN KEY (id_negocio) REFERENCES Negocio(id_negocio);
ALTER TABLE Ventas
ADD COLUMN id_cliente INT,
ADD FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente);
ALTER TABLE Ventas
ADD COLUMN id_empleado INT,
ADD FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado);
ALTER TABLE Ventas
ADD COLUMN id_producto INT,
ADD FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)

