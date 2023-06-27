-- se crea tabla medico
CREATE TABLE medico (
  rut varchar(8) PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  direccion VARCHAR(200) NOT NULL,
  especialidad INTEGER NOT NULL
);

SELECT*FROM medico;

-- Se crea tabla especialidad
CREATE TABLE especialidad (
  codigo SERIAL PRIMARY KEY,
  descripcion VARCHAR(50) NOT NULL
);

SELECT*FROM especialidad;

--se crea tabla paciente
CREATE TABLE paciente (
  rut varchar(8) PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  direccion VARCHAR(200) NOT NULL
);

SELECT*FROM paciente;

-- Se crea tabla consulta
CREATE TABLE consulta (
  codigo SERIAL PRIMARY KEY,
  rut_paciente VARCHAR(8) NOT NULL,
  rut_medico VARCHAR(8) NOT NULL,
  fecha TIMESTAMP NOT NULL,
  numero_box INTEGER NOT NULL,
  FOREIGN KEY (rut_paciente) REFERENCES paciente(rut),
  FOREIGN KEY (rut_medico) REFERENCES medico(rut)
);

SELECT*FROM consulta;

-- Se crea tabla licencia
CREATE TABLE licencia (
  codigo SERIAL,
  diagnostico VARCHAR(255) NOT NULL,
  rut_paciente VARCHAR(8) NOT NULL,
  rut_medico VARCHAR(8) NOT NULL,
  consulta_id INTEGER NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_termino DATE NOT NULL,
  FOREIGN KEY (rut_paciente) REFERENCES paciente(rut),
  FOREIGN KEY (consulta_id) REFERENCES consulta(codigo),
  FOREIGN KEY (rut_medico) REFERENCES medico(rut),
  PRIMARY KEY (consulta_id, codigo)
);

SELECT*FROM licencia;