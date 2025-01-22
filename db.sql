-- Crear base de datos
CREATE DATABASE gymapp;

-- Tabla de administradores
CREATE TABLE admins (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido_paterno VARCHAR(255) NOT NULL,
    apellido_materno VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    password VARCHAR(255) NOT NULL,
    token VARCHAR(255) DEFAULT NULL,
    confirmado BOOLEAN DEFAULT FALSE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de clientes
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido_paterno VARCHAR(255) NOT NULL,
    apellido_materno VARCHAR(255) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    nacimiento DATE NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    matricula VARCHAR(50) NOT NULL UNIQUE,
    img_public_id VARCHAR(255),
    img_secure_url VARCHAR(255),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    eliminado BOOLEAN DEFAULT FALSE
);

-- Tabla de visitas
CREATE TABLE visitas_compras (
    id SERIAL PRIMARY KEY,
    cliente_id INT,
    nombre_invitado VARCHAR(255),
    fecha_visita TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tipo VARCHAR(20) NOT NULL DEFAULT 'cliente', -- o "externo" en caso de no tener un id
    precio NUMERIC(10, 2) NOT NULL, 
    CONSTRAINT fk_cliente_visita FOREIGN KEY (cliente_id) REFERENCES clientes (id) ON DELETE SET NULL
);

-- SELECT precio_visita FROM configuracion_gym LIMIT 1

-- Tabla de categorias de productos
CREATE TABLE categorias_productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    eliminado BOOLEAN DEFAULT FALSE
);

CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    marca VARCHAR(255) NOT NULL,
    categoria_id INT DEFAULT 0, -- 0 DEFAULT PARA CUANDO SE ELIMINE ALGUNA CATEGORIA SE LE PASE 0  AQUI
    stock INTEGER NOT NULL,
    precio NUMERIC(10, 2) NOT NULL,
    descuento NUMERIC(5, 2) DEFAULT 0.00,
    total NUMERIC(10, 2) NOT NULL,
    img_public_id VARCHAR(255),
    img_secure_url VARCHAR(255),
    disponible BOOLEAN DEFAULT TRUE,
    eliminado BOOLEAN DEFAULT FALSE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) 
    REFERENCES categorias_productos (id) ON DELETE SET DEFAULT
);

-- Tabla de membresías
CREATE TABLE membresias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    beneficios VARCHAR[] NOT NULL,  -- Usamos un array de VARCHAR para los beneficios despues mostrarse como lista
    duracion_dias INT NOT NULL,
    precio NUMERIC(10, 2) NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    eliminado BOOLEAN DEFAULT FALSE
);

-- Tabla de compras de membresías
CREATE TABLE compras_membresias (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    membresia_id INT NOT NULL,
    fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_expiracion TIMESTAMP NOT NULL,
    fecha_renovacion TIMESTAMP NULL DEFAULT NULL, 
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes (id) ON DELETE CASCADE,
    CONSTRAINT fk_membresia FOREIGN KEY (membresia_id) REFERENCES membresias (id) ON DELETE CASCADE
);

-- Tabla de ventas
CREATE TABLE ventas (
    id SERIAL PRIMARY KEY,
    cliente_id INT NULL, -- Puede ser NULL para clientes no registrados
    cliente_externo VARCHAR(255) NULL, -- Nombre del cliente externo
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total NUMERIC(10, 2) NOT NULL,
    CONSTRAINT fk_cliente_venta FOREIGN KEY (cliente_id) REFERENCES clientes (id) ON DELETE SET NULL,
    CONSTRAINT chk_cliente CHECK (
        -- Valida que solo uno de los dos campos tenga valor
        (cliente_id IS NOT NULL AND cliente_externo IS NULL) OR
        (cliente_id IS NULL AND cliente_externo IS NOT NULL)
    )
);


-- Tabla de detalles de ventas
CREATE TABLE detalles_ventas (
    id SERIAL PRIMARY KEY,
    venta_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario NUMERIC(10, 2) NOT NULL,
    subtotal NUMERIC(10, 2) NOT NULL,
    CONSTRAINT fk_venta FOREIGN KEY (venta_id) REFERENCES ventas (id) ON DELETE CASCADE,
    CONSTRAINT fk_producto FOREIGN KEY (producto_id) REFERENCES productos (id) ON DELETE CASCADE
);

-- Tabla de entrenadores
CREATE TABLE entrenadores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido_paterno VARCHAR(255) NOT NULL,
    apellido_materno VARCHAR(255) NOT NULL,
    especialidad VARCHAR(255) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(255) UNIQUE,
    activo BOOLEAN DEFAULT TRUE,
    img_public_id VARCHAR(255),
    img_secure_url VARCHAR(255)
);

-- Tabla de asistencias
CREATE TABLE asistencias (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha_asistencia TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_cliente_asistencia FOREIGN KEY (cliente_id) REFERENCES clientes (id) ON DELETE CASCADE
);

-- Tabla de configuración del gimnasio
CREATE TABLE configuracion_gym (
    id SERIAL PRIMARY KEY,
    nombre_gimnasio VARCHAR(255) NOT NULL,
    horario_apertura TIME NOT NULL,
    horario_cierre TIME NOT NULL,
    precio_visita NUMERIC(10, 2) NOT NULL,
    reportes_hora_generacion TIME NOT NULL,
    email_envio_reportes VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);  

-- Vista para compras membresias y cliente 
-- vista_ultima_compra_membresia
SELECT cm.id,
    c.nombre AS cliente_nombre,
    c.id AS cliente_id
    c.apellido_paterno AS cliente_apellido_paterno,
    c.apellido_materno AS cliente_apellido_materno,
    c.img_public_id AS cliente_img_id,
    m.nombre AS membresia,
    cm.fecha_compra,
    cm.fecha_expiracion,
    GREATEST(0::numeric, EXTRACT(day FROM cm.fecha_expiracion::timestamp with time zone - now())) AS dias_restantes,
        CASE
            WHEN cm.fecha_expiracion = CURRENT_DATE THEN 'Vence hoy'::text
            WHEN cm.fecha_expiracion > CURRENT_DATE THEN
            CASE
                WHEN cm.fecha_expiracion <= (CURRENT_DATE + '7 days'::interval) THEN 'Por vencer'::text
                ELSE 'Activa'::text
            END
            ELSE 'Vencida'::text
        END AS estado
   FROM compras_membresias cm
     JOIN clientes c ON cm.cliente_id = c.id
     JOIN membresias m ON cm.membresia_id = m.id;


-- Crear vista para el inventario de productos con nombre de categoría y nivel de stock
CREATE OR REPLACE VIEW vista_nivel_stock AS
SELECT 
    p.id,
    p.nombre,
    p.marca,
    p.categoria_id,
    c.nombre AS categoria, -- Nombre de la categoría
    p.stock,
    p.precio,
    p.descuento,
    p.total,
    p.img_public_id,
    p.img_secure_url,
    p.fecha_creacion,
    p.disponible,
    CASE
        WHEN p.stock > 20 THEN 'Suficiente'
        WHEN p.stock >= 10 AND p.stock <= 20 THEN 'Medio'
        WHEN p.stock < 10 THEN 'Bajo'
        ELSE 'Sin definir'
    END AS nivel_stock
FROM 
    productos p
LEFT JOIN 
    categorias_productos c
ON 
    p.categoria_id = c.id
WHERE 
    p.eliminado = FALSE; 


-- Vista para consultar la ultima membresia adquirida por el usuario
-- vista_ultima_compra_membresia
SELECT cm.id AS compra_id,
    cm.cliente_id,
    c.nombre AS cliente_nombre,
    m.nombre AS membresia_nombre,
    cm.fecha_compra,
    cm.fecha_expiracion,
        CASE
            WHEN cm.fecha_expiracion = CURRENT_DATE THEN 'vence hoy'::text
            WHEN cm.fecha_expiracion > CURRENT_DATE THEN
            CASE
                WHEN cm.fecha_expiracion <= (CURRENT_DATE + '7 days'::interval) THEN 'por vencer'::text
                ELSE 'activa'::text
            END
            ELSE 'vencida'::text
        END AS estado
   FROM compras_membresias cm
     JOIN clientes c ON cm.cliente_id = c.id
     JOIN membresias m ON cm.membresia_id = m.id;