CREATE SCHEMA IF NOT EXISTS consultorio;
CREATE TABLE IF NOT EXISTS consultorio.medico(
id INT AUTO_INCREMENT NOT NULL,
nome VARCHAR (45),
endereco VARCHAR (45),
telefone VARCHAR (45),
crm VARCHAR (45)
);

CREATE TABLE IF NOT EXISTS consultorio.paciente(
id INT AUTO_INCREMENT NOT NULL,
nome VARCHAR (45),
endereco VARCHAR (45),
tel VARCHAR (45),
cpf VARCHAR (45)
);

CREATE TABLE IF NOT EXISTS consultorio.secretaria(
id INT AUTO_INCREMENT NOT NULL,
nome VARCHAR (45),
endereco VARCHAR (45),
telefone VARCHAR (45),
cpf VARCHAR (45)
);

CREATE TABLE IF NOT EXISTS consultorio.consulta(
id INT AUTO_INCREMENT NOT NULL,
data_cons DATE,
medico_id INT,
paciente_id INT,
secretaria_id INT,
valor DECIMAL,
pago BIT
);


ALTER TABLE consultorio.medico
ADD CONSTRAINT medico_pkey PRIMARY KEY (id);
ALTER TABLE consultorio.paciente
ADD CONSTRAINT paciente_pkey PRIMARY KEY (id);
ALTER TABLE consultorio.secretaria
ADD CONSTRAINT secretaria_pkey PRIMARY KEY (id);
ALTER TABLE consultorio.consulta
ADD CONSTRAINT consulta_pkey PRIMARY KEY (id);

ALTER TABLE consultorio.consulta
ADD CONSTRAINT consulta_ibfk_1 FOREIGN KEY (medico_id)
REFERENCES consultorio.medico (id)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE consultorio.consulta
ADD CONSTRAINT consulta_ibfk_2 FOREIGN KEY (paciente_id)
REFERENCES consultorio.paciente (id)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE consultorio.consulta
ADD CONSTRAINT consulta_ibfk_3 FOREIGN KEY (secretaria_id)
REFERENCES consultorio.secretaria (id)
ON UPDATE no action
ON DELETE no action
;

INSERT INTO consultorio.medico (id, nome, endereco, telefone, crm) VALUES
(1, 'Silas', 'Av AAAA', '99999-9999', '0002'),
(2, 'Mario', 'Av bbb', '99999-9999', '0003'),
(3, 'Antonio', 'Av cccc', '99999-9999', '0010'),
(4, 'Campos', 'Av ddd', '99999-9999', '0015'),
(5, 'Jose', 'Av www', '99999-9999', '0020')
;
INSERT INTO consultorio.paciente (id, nome, endereco, tel, cpf) VALUES
(1, 'AAAA', 'Av AAAA', '00000-0000', '11111111111'),
(2, 'BBBB', 'Av BBBB', '00000-0000', '22222222222'),
(3, 'CCCC', 'Av CCCC', '00000-0000', '33333333333'),
(4, 'DDDD', 'Av DDDD', '00000-0000', '44444444444'),
(5, 'EEEE', 'Av EEEE', '00000-0000', '55555555555')
;
INSERT INTO consultorio.secretaria (id, nome, endereco, telefone, cpf) VALUES
(1, 'sec1', 'Av AAAA', '00000-0000', '11111111111'),
(2, 'sec2', 'Av BBBB', '00000-0000', '22222222222'),
(3, 'sec3', 'Av CCCC', '00000-0000', '33333333333'),
(4, 'sec4', 'Av DDDD', '00000-0000', '44444444444'),
(5, 'sec5', 'Av EEEE', '00000-0000', '55555555555')
;
INSERT INTO consultorio.consulta (id, data_cons, medico_id, paciente_id, secretaria_id, valor, pago) VALUES
(1, '2017-03-13', 1, 2, 3, 100.00, 'true'),
(2, '2017-03-14', 5, 3, 4, 120.00, 'true'),
(3, '2017-03-15', 2, 4, 5, 150.00, 'true'),
(4, '2017-03-16', 4, 5, 2, 180.00, 'true'),
(5, '2017-03-19', 3, 1, 1, 200.00, 'true')
;
