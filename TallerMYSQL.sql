USE Tienda;

CREATE TABLE Categorias (
id INT PRIMARY KEY,
nombre TEXT
);
CREATE TABLE Productos (
    id INT PRIMARY KEY,       -- Identificador único para cada producto
    nombre TEXT,              -- Nombre del producto
    precio DECIMAL(10, 2)     -- Precio con decimales (ej: 10.50)
);
CREATE TABLE Productos_Categorias (
    producto_id INT,          -- Referencia al producto
    categoria_id INT,         -- Referencia a la categoría
    FOREIGN KEY (producto_id) REFERENCES Productos(id),
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);
INSERT INTO Categorias (id, nombre) VALUES (1, 'Bebidas');
INSERT INTO Categorias (id, nombre) VALUES (2, 'Dulces');
INSERT INTO Productos (id, nombre, precio) VALUES (1, 'Coca-Cola', 8.50);
INSERT INTO Productos (id, nombre, precio) VALUES (2, 'Chocolate', 12.00);
INSERT INTO Productos (id, nombre, precio) VALUES (3, 'Galletas', 9.00);
INSERT INTO Productos_Categorias (producto_id, categoria_id) VALUES (1, 1);
INSERT INTO Productos_Categorias (producto_id, categoria_id) VALUES (2, 2);
INSERT INTO Productos_Categorias (producto_id, categoria_id) VALUES (3, 2);
SELECT nombre, precio FROM Productos;
SELECT nombre, precio FROM Productos WHERE precio > 10;
SELECT p.nombre AS producto, c.nombre AS categoria
FROM Productos p
JOIN Productos_Categorias pc ON p.id = pc.producto_id
JOIN Categorias c ON pc.categoria_id = c.id;
SELECT c.nombre AS categoria, p.nombre AS producto
FROM Categorias c
LEFT JOIN Productos_Categorias pc ON c.id = pc.categoria_id
LEFT JOIN Productos p ON p.id = pc.producto_id;