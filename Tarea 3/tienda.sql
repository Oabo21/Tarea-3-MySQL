CREATE DATABASE tienda;

USE tienda;

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    descripcion TEXT,
    cantidad INT NOT NULL
);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT NOT NULL,
    cliente_id INT NOT NULL,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

INSERT INTO productos (nombre, precio, descripcion, cantidad)
VALUES ('Camiseta', 20.50, 'Camiseta de algodón para hombre', 50),
       ('Pantalón', 35.99, 'Pantalón vaquero para mujer', 30),
       ('Zapatos', 60.00, 'Zapatos de cuero para niños', 20);

INSERT INTO clientes (nombre, direccion, telefono)
VALUES ('Juan Pérez', 'Calle 123, Ciudad', '123-456-7890'),
       ('María García', 'Avenida 456, Pueblo', '456-789-0123'),
       ('Pedro Martínez', 'Carretera 789, Villa', '789-012-3456');

INSERT INTO ventas (producto_id, cliente_id, cantidad, precio)
VALUES (1, 2, 2, 41.00),
       (2, 1, 1, 35.99),
       (3, 3, 3, 180.00);

UPDATE productos
SET precio = 25.99
WHERE id = 1;

DELETE FROM ventas
WHERE id = 2;

