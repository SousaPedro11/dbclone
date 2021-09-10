CREATE SCHEMA IF NOT EXISTS academia;
CREATE TABLE IF NOT EXISTS academia.aparelho(
cod SMALLINT AUTO_INCREMENT NOT NULL,
fabricante VARCHAR (20) NOT NULL,
modelo VARCHAR (20) NOT NULL
);

CREATE TABLE IF NOT EXISTS academia.cargo(
cod SMALLINT AUTO_INCREMENT NOT NULL,
nome VARCHAR (20) NOT NULL
);

CREATE TABLE IF NOT EXISTS academia.endereco(
cod SMALLINT AUTO_INCREMENT NOT NULL,
rua VARCHAR (80) NOT NULL,
numero VARCHAR (5) NOT NULL,
cep VARCHAR (10) NOT NULL,
complemento TEXT,
cidade VARCHAR (30),
bairro VARCHAR (20),
telefone VARCHAR (15)
);

CREATE TABLE IF NOT EXISTS academia.plano(
cod SMALLINT AUTO_INCREMENT NOT NULL,
valor DECIMAL NOT NULL
);

CREATE TABLE IF NOT EXISTS academia.sala(
cod SMALLINT AUTO_INCREMENT NOT NULL
);

CREATE TABLE IF NOT EXISTS academia.unidade(
cod SMALLINT AUTO_INCREMENT NOT NULL,
nome VARCHAR (120) NOT NULL,
fk_endereco SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS academia.aluno(
matricula VARCHAR (12) NOT NULL,
nome VARCHAR (120) NOT NULL,
nome_mae VARCHAR (120) NOT NULL,
documento_tipo ENUM,
documento_num VARCHAR (20) NOT NULL,
ativado BIT,
fk_endereco SMALLINT NOT NULL,
fk_plano SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS academia.funcionario(
registro VARCHAR (10) NOT NULL,
nome VARCHAR (120) NOT NULL,
nome_mae VARCHAR (120) NOT NULL,
documento_tipo ENUM,
documento VARCHAR (20) NOT NULL,
ativado BIT,
fk_endereco SMALLINT NOT NULL,
cargo SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS academia.modalidade(
cod SMALLINT AUTO_INCREMENT NOT NULL,
categoria VARCHAR (100) NOT NULL,
nivel VARCHAR (20),
fk_categoria_pai SMALLINT,
fk_unidade SMALLINT NOT NULL,
fk_professor VARCHAR (10)
);

CREATE TABLE IF NOT EXISTS academia.avaliacaofisica(
cod SMALLINT AUTO_INCREMENT NOT NULL,
avaliador VARCHAR (120) NOT NULL,
data_avaliacao DATE NOT NULL,
abdominal SMALLINT,
flexoes_braco SMALLINT,
altura DECIMAL NOT NULL,
peso DECIMAL NOT NULL,
busto DECIMAL NOT NULL,
braco_esq DECIMAL NOT NULL,
braco_dir DECIMAL NOT NULL,
abdomen DECIMAL NOT NULL,
cintura DECIMAL NOT NULL,
quadril DECIMAL NOT NULL,
culote DECIMAL NOT NULL,
coxa_esq DECIMAL NOT NULL,
coxa_dir DECIMAL NOT NULL,
panturrilha_esq DECIMAL NOT NULL,
panturrilha_dir DECIMAL NOT NULL,
fk_aluno VARCHAR (12)
);

CREATE TABLE IF NOT EXISTS academia.ficha(
cod SMALLINT AUTO_INCREMENT NOT NULL,
data_elaboracao DATE NOT NULL,
fk_aluno VARCHAR (12) NOT NULL
);

CREATE TABLE IF NOT EXISTS academia.funcionario_modalidade(
cod SMALLINT AUTO_INCREMENT NOT NULL,
fk_funcionario VARCHAR (12),
fk_modalidade SMALLINT
);

CREATE TABLE IF NOT EXISTS academia.modalidade_sala(
cod SMALLINT AUTO_INCREMENT NOT NULL,
fk_modalidade SMALLINT,
fk_sala SMALLINT
);

CREATE TABLE IF NOT EXISTS academia.pagamento(
cod SMALLINT AUTO_INCREMENT NOT NULL,
tipo VARCHAR (10) NOT NULL,
vencimento DATE NOT NULL,
periodo DATE NOT NULL,
status_pagamento ENUM,
fk_aluno VARCHAR (12) NOT NULL,
fk_valor_plano SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS academia.plano_aluno(
cod SMALLINT AUTO_INCREMENT NOT NULL,
fk_plano SMALLINT,
fk_aluno VARCHAR (12)
);

CREATE TABLE IF NOT EXISTS academia.plano_modalidade(
cod SMALLINT AUTO_INCREMENT NOT NULL,
fk_modalidade SMALLINT,
fk_plano SMALLINT
);

CREATE TABLE IF NOT EXISTS academia.turma(
cod SMALLINT AUTO_INCREMENT NOT NULL,
horario TIME NOT NULL,
fk_modalidade SMALLINT
);

CREATE TABLE IF NOT EXISTS academia.linha_ficha(
cod SMALLINT AUTO_INCREMENT NOT NULL,
fk_aparelho SMALLINT,
fk_ficha SMALLINT,
ciclo1 DECIMAL,
ciclo2 DECIMAL,
ciclo3 DECIMAL,
ciclo4 DECIMAL
);

CREATE TABLE IF NOT EXISTS academia.plano_turma(
cod SMALLINT AUTO_INCREMENT NOT NULL,
fk_plano SMALLINT,
fk_turma SMALLINT
);

CREATE TABLE IF NOT EXISTS academia.turma_sala(
cod SMALLINT AUTO_INCREMENT NOT NULL,
fk_turma SMALLINT,
fk_sala SMALLINT
);

CREATE SCHEMA IF NOT EXISTS aula;
CREATE TABLE IF NOT EXISTS aula.funcionarios(
id INT AUTO_INCREMENT NOT NULL,
nome VARCHAR (50),
telefone VARCHAR (15),
endereco VARCHAR (50),
bairro VARCHAR (20),
cep VARCHAR (8),
salario DOUBLE,
cidade VARCHAR (20)
);

CREATE SCHEMA IF NOT EXISTS cadastro;
CREATE TABLE IF NOT EXISTS cadastro.curso(
id INT NOT NULL,
nome VARCHAR (30) NOT NULL,
descricao TEXT,
carga INT UNSIGNED,
totaulas INT,
ano YEAR
);

CREATE TABLE IF NOT EXISTS cadastro.pessoa(
nome VARCHAR (30) NOT NULL,
nascimento DATE,
sexo ENUM,
peso DECIMAL,
altura DECIMAL,
nacionalidade VARCHAR (20),
id INT AUTO_INCREMENT NOT NULL
);

CREATE SCHEMA IF NOT EXISTS evento;
CREATE TABLE IF NOT EXISTS evento.evento(
codigo BIGINT AUTO_INCREMENT NOT NULL,
data VARCHAR (255) NOT NULL,
horario VARCHAR (255) NOT NULL,
local VARCHAR (255) NOT NULL,
nome VARCHAR (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS evento.role(
nome_role VARCHAR (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS evento.users(
nome VARCHAR (255) NOT NULL,
senha VARCHAR (255)
);

CREATE TABLE IF NOT EXISTS evento.users_roles(
users_nome VARCHAR (255) NOT NULL,
roles_nome_role VARCHAR (255) NOT NULL
);

CREATE SCHEMA IF NOT EXISTS hospital;
CREATE TABLE IF NOT EXISTS hospital.medico(
id INT AUTO_INCREMENT NOT NULL,
nome VARCHAR (45) NOT NULL,
endereco VARCHAR (80) NOT NULL,
telefone VARCHAR (45) NOT NULL,
crm VARCHAR (45) NOT NULL
);

CREATE TABLE IF NOT EXISTS hospital.paciente(
id INT AUTO_INCREMENT NOT NULL,
nome VARCHAR (45) NOT NULL,
endereco VARCHAR (80) NOT NULL,
telefone VARCHAR (45) NOT NULL,
cpf VARCHAR (45) NOT NULL
);

CREATE TABLE IF NOT EXISTS hospital.secretaria(
id INT AUTO_INCREMENT NOT NULL,
nome VARCHAR (45) NOT NULL,
endereco VARCHAR (80) NOT NULL,
telefone VARCHAR (45) NOT NULL,
cpf VARCHAR (45) NOT NULL
);

CREATE TABLE IF NOT EXISTS hospital.consulta(
id INT AUTO_INCREMENT NOT NULL,
data_consulta DATE NOT NULL,
medico_id INT NOT NULL,
paciente_id INT NOT NULL,
secretaria_id INT NOT NULL,
valor DECIMAL NOT NULL,
pago BIT
);

CREATE SCHEMA IF NOT EXISTS joins;
CREATE TABLE IF NOT EXISTS joins.departamentos(
id INT AUTO_INCREMENT NOT NULL,
nome VARCHAR (45),
sigla VARCHAR (5)
);

CREATE TABLE IF NOT EXISTS joins.funcionarios(
id INT AUTO_INCREMENT NOT NULL,
nome VARCHAR (50),
telefone VARCHAR (15),
endereco VARCHAR (50),
bairro VARCHAR (20),
cep VARCHAR (8),
salario DOUBLE,
cidade VARCHAR (20),
departamento_id INT
);


ALTER TABLE academia.aparelho
ADD CONSTRAINT aparelho_pkey PRIMARY KEY (cod);
ALTER TABLE academia.cargo
ADD CONSTRAINT cargo_pkey PRIMARY KEY (cod);
ALTER TABLE academia.endereco
ADD CONSTRAINT endereco_pkey PRIMARY KEY (cod);
ALTER TABLE academia.plano
ADD CONSTRAINT plano_pkey PRIMARY KEY (cod);
ALTER TABLE academia.sala
ADD CONSTRAINT sala_pkey PRIMARY KEY (cod);
ALTER TABLE academia.unidade
ADD CONSTRAINT unidade_pkey PRIMARY KEY (cod);
ALTER TABLE academia.aluno
ADD CONSTRAINT aluno_pkey PRIMARY KEY (matricula);
ALTER TABLE academia.funcionario
ADD CONSTRAINT funcionario_pkey PRIMARY KEY (registro);
ALTER TABLE academia.modalidade
ADD CONSTRAINT modalidade_pkey PRIMARY KEY (cod);
ALTER TABLE academia.avaliacaofisica
ADD CONSTRAINT avaliacaofisica_pkey PRIMARY KEY (cod);
ALTER TABLE academia.ficha
ADD CONSTRAINT ficha_pkey PRIMARY KEY (cod);
ALTER TABLE academia.funcionario_modalidade
ADD CONSTRAINT funcionario_modalidade_pkey PRIMARY KEY (cod);
ALTER TABLE academia.modalidade_sala
ADD CONSTRAINT modalidade_sala_pkey PRIMARY KEY (cod);
ALTER TABLE academia.pagamento
ADD CONSTRAINT pagamento_pkey PRIMARY KEY (cod);
ALTER TABLE academia.plano_aluno
ADD CONSTRAINT plano_aluno_pkey PRIMARY KEY (cod);
ALTER TABLE academia.plano_modalidade
ADD CONSTRAINT plano_modalidade_pkey PRIMARY KEY (cod);
ALTER TABLE academia.turma
ADD CONSTRAINT turma_pkey PRIMARY KEY (cod);
ALTER TABLE academia.linha_ficha
ADD CONSTRAINT linha_ficha_pkey PRIMARY KEY (cod);
ALTER TABLE academia.plano_turma
ADD CONSTRAINT plano_turma_pkey PRIMARY KEY (cod);
ALTER TABLE academia.turma_sala
ADD CONSTRAINT turma_sala_pkey PRIMARY KEY (cod);
ALTER TABLE aula.funcionarios
ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (id);
ALTER TABLE cadastro.curso
ADD CONSTRAINT curso_pkey PRIMARY KEY (id);
ALTER TABLE cadastro.pessoa
ADD CONSTRAINT pessoa_pkey PRIMARY KEY (id);
ALTER TABLE evento.evento
ADD CONSTRAINT evento_pkey PRIMARY KEY (codigo);
ALTER TABLE evento.role
ADD CONSTRAINT role_pkey PRIMARY KEY (nome_role);
ALTER TABLE evento.users
ADD CONSTRAINT users_pkey PRIMARY KEY (nome);
ALTER TABLE hospital.medico
ADD CONSTRAINT medico_pkey PRIMARY KEY (id);
ALTER TABLE hospital.paciente
ADD CONSTRAINT paciente_pkey PRIMARY KEY (id);
ALTER TABLE hospital.secretaria
ADD CONSTRAINT secretaria_pkey PRIMARY KEY (id);
ALTER TABLE hospital.consulta
ADD CONSTRAINT consulta_pkey PRIMARY KEY (id);
ALTER TABLE joins.departamentos
ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id);
ALTER TABLE joins.funcionarios
ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (id);

ALTER TABLE academia.aluno
ADD CONSTRAINT FK_aluno_endereco FOREIGN KEY (fk_endereco)
REFERENCES academia.endereco (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.aluno
ADD CONSTRAINT FK_aluno_plano FOREIGN KEY (fk_plano)
REFERENCES academia.plano (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.avaliacaofisica
ADD CONSTRAINT FK_avaliacaofisica_aluno FOREIGN KEY (fk_aluno)
REFERENCES academia.aluno (matricula)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.ficha
ADD CONSTRAINT FK_ficha_aluno FOREIGN KEY (fk_aluno)
REFERENCES academia.aluno (matricula)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.funcionario
ADD CONSTRAINT FK_funcionario_endereco FOREIGN KEY (fk_endereco)
REFERENCES academia.endereco (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.funcionario_modalidade
ADD CONSTRAINT FK_funcionario_modalidade_funcionario FOREIGN KEY (fk_funcionario)
REFERENCES academia.funcionario (registro)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.funcionario_modalidade
ADD CONSTRAINT FK_funcionario_modalidade_modalidade FOREIGN KEY (fk_modalidade)
REFERENCES academia.modalidade (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.linha_ficha
ADD CONSTRAINT FK_linha_ficha_aparelho FOREIGN KEY (fk_aparelho)
REFERENCES academia.aparelho (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.linha_ficha
ADD CONSTRAINT FK_linha_ficha_ficha FOREIGN KEY (fk_ficha)
REFERENCES academia.ficha (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.modalidade
ADD CONSTRAINT FK_modalidade_categoria FOREIGN KEY (fk_categoria_pai)
REFERENCES academia.modalidade (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.modalidade
ADD CONSTRAINT FK_modalidade_unidade FOREIGN KEY (fk_unidade)
REFERENCES academia.unidade (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.modalidade_sala
ADD CONSTRAINT FK_modalidade_sala_mod FOREIGN KEY (fk_modalidade)
REFERENCES academia.modalidade (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.modalidade_sala
ADD CONSTRAINT FK_modalidade_sala_sala FOREIGN KEY (fk_sala)
REFERENCES academia.sala (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.pagamento
ADD CONSTRAINT FK_pagamento_aluno FOREIGN KEY (fk_aluno)
REFERENCES academia.aluno (matricula)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.pagamento
ADD CONSTRAINT FK_pagamento_plano FOREIGN KEY (fk_valor_plano)
REFERENCES academia.plano (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.plano_aluno
ADD CONSTRAINT FK_plano_aluno_aluno FOREIGN KEY (fk_aluno)
REFERENCES academia.aluno (matricula)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.plano_aluno
ADD CONSTRAINT FK_plano_aluno_plano FOREIGN KEY (fk_plano)
REFERENCES academia.plano (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.plano_modalidade
ADD CONSTRAINT FK_plano_modalidade_modalidade FOREIGN KEY (fk_modalidade)
REFERENCES academia.modalidade (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.plano_modalidade
ADD CONSTRAINT FK_plano_modalidade_plano FOREIGN KEY (fk_plano)
REFERENCES academia.plano (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.plano_turma
ADD CONSTRAINT FK_plano_turma_plano FOREIGN KEY (fk_plano)
REFERENCES academia.plano (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.plano_turma
ADD CONSTRAINT FK_plano_turma_turma FOREIGN KEY (fk_turma)
REFERENCES academia.turma (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.turma
ADD CONSTRAINT FK_turma_modalidade FOREIGN KEY (fk_modalidade)
REFERENCES academia.modalidade (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.turma_sala
ADD CONSTRAINT FK_turma_sala_sala FOREIGN KEY (fk_sala)
REFERENCES academia.sala (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE academia.turma_sala
ADD CONSTRAINT FK_turma_sala_turma FOREIGN KEY (fk_turma)
REFERENCES academia.turma (cod)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE evento.users_roles
ADD CONSTRAINT FKgv8ypr50e3c06yjjkx76pxupr FOREIGN KEY (roles_nome_role)
REFERENCES evento.role (nome_role)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE evento.users_roles
ADD CONSTRAINT FKbnb14iywotdt02cbj0pj14hu2 FOREIGN KEY (users_nome)
REFERENCES evento.users (nome)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE hospital.consulta
ADD CONSTRAINT FK_consulta_medico FOREIGN KEY (medico_id)
REFERENCES hospital.medico (id)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE hospital.consulta
ADD CONSTRAINT FK_consulta_paciente FOREIGN KEY (paciente_id)
REFERENCES hospital.paciente (id)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE hospital.consulta
ADD CONSTRAINT FK_consulta_secretaria FOREIGN KEY (secretaria_id)
REFERENCES hospital.secretaria (id)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE joins.funcionarios
ADD CONSTRAINT funcionarios_ibfk_1 FOREIGN KEY (departamento_id)
REFERENCES joins.departamentos (id)
ON UPDATE no action
ON DELETE no action
;

INSERT INTO aula.funcionarios (id, nome, telefone, endereco, bairro, cep, salario, cidade) VALUES
(1, 'Maria João', '99070012', 'Av. Gov José Malcher, 2460', 'São Braz', '66060281', 1500.8, 'Belém'),
(2, 'Pedro Zamora', '99989988', 'Av. Magalhães Barata, 1360', 'Nazaré', '66055090', 2300.12, 'Belem'),
(3, 'Andrea Pinho', '99989988', 'Boaventura da Silva, 678, ap 304', 'Umarizal', '66075080', 4080.5, 'BELEM'),
(4, 'Mario Silva', '2223234', 'Cidade Nova IV, 3456', 'São Braz', '66060281', 1200.8, 'Ananindeua'),
(6, 'Rafael Bezerra', '99345688', 'Passagem Maxima, 678, ap 304', 'Marco', '66075080', 4080.5, 'BELEM'),
(7, 'Katia Santos', '98760012', 'Trav Mauriti, 2460', 'Marco', '66060281', 700.8, 'Belém'),
(8, 'Gustavo Pinto', '22389988', 'Passagem Barata, 1360', 'Cidade Nova IV', '66055090', 2300.12, 'Ananindeua'),
(10, 'Renato Hudson', '34553234', 'Passagem Tereza, 3456', 'Cidade Nova V', '66060281', 1450.8, 'Ananindeua'),
(11, 'Tiago Alves', '78889988', 'Av. Magalhães Barata, 1360', 'Nazaré', '66055090', 2990.62, 'Belem'),
(12, 'Mario Antonio', '23489988', 'Boaventura da Silva, 678, ap 304', 'Umarizal', '66075080', 4080.5, 'BELEM'),
(13, 'Maria Silva', '32470012', 'Av. Gov José Malcher, 2460', 'São Braz', '66060281', 1500.8, 'Belém'),
(14, 'Jean Zorat', '88789988', 'Av. Magalhães Barata, 1360', 'Nazaré', '66055090', 2823.99, 'Belem'),
(15, 'Andre Ribeiro', '76589988', 'Boaventura da Silva, 678, ap 304', 'Umarizal', '66075080', 3567.5, 'BELEM'),
(16, 'Matheus Carmo', '87893234', 'Cidade Nova IV, 3456', 'São Braz', '66060281', 1689.9, 'Ananindeua'),
(17, 'Daniel Dantes', '22989988', 'Av. Magalhães Barata, 1360', 'Nazaré', '66055090', 2800.12, 'Belem')
;
INSERT INTO cadastro.pessoa (nome, nascimento, sexo, peso, altura, nacionalidade, id) VALUES
('Godofredo', '1984-01-01', 'M', 78.50, 1.83, 'Brasil', 1),
('Maria', '1999-12-02', 'F', 55.20, 1.65, 'Portugal', 2),
('Adalgiza', '1930-11-02', 'F', 63.20, 1.75, 'Irlanda', 3),
('Marilia', '1988-11-06', 'F', 88.20, 1.65, 'Irlanda', 4)
;
INSERT INTO hospital.medico (id, nome, endereco, telefone, crm) VALUES
(1, 'NILZA EMILIA SEABRA OLIVEIRA', 'TRAVESSA BARAO DO TRIUNFO 3260 - CLINICA PARICUIA', '32424829', '4773 - PA'),
(2, 'SERGIO LUIZ DOS SANTOS BRITO FILHO', 'TRAVESSA TRES DE MAIO 1218 - SALA 206 E 207', '32497988', '10010 - PA'),
(3, 'JOSE SILVERIO NUNES DA FONSECA', 'RUA DOS MUNDURUCUS 3100 - 1º ANDAR', '32897755', '4775 - PA'),
(4, 'JOSE SILVERIO NUNES DA FONSECA', 'TRAVESSA DOM ROMUALDO DE SEIXAS 1812', '32154522', '4775 - PA'),
(5, 'ANA PAULA DA SILVA LESSA', 'AVENIDA GOVERNADOR JOSE MALCHER 937 - SALA 704', '32237674', '9273 - PA')
;
INSERT INTO hospital.paciente (id, nome, endereco, telefone, cpf) VALUES
(1, 'MIGUEL SOUSA', 'ORQUIDEA 89', '32530000', '01234567890'),
(2, 'ALVARO BARROS', 'MAUTITI 245', '32450000', '23456789012'),
(3, 'PEDRO SOUSA', 'ORQUIDEA 89', '32530000', '52731312345'),
(4, 'PEDRO SOUSA', 'ORQUIDEA 89', '32530000', '23645012345'),
(5, 'ANTONIO BRAZAO', 'JUVENAL 245', '32530102', '01545012345')
;
INSERT INTO hospital.secretaria (id, nome, endereco, telefone, cpf) VALUES
(1, 'CLAUDIA MONTEIRO', 'RUA 1 80', '32490000', '78945612300'),
(2, 'CARLA PAIXAO', 'RUA 2 854', '32980000', '56123078945'),
(3, 'GLEICE OLIVEIRA', 'RUA 3 78', '32530506', '45612307894'),
(4, 'CAROL COELHO', 'ALAMEDA D COELHO 45', '32530607', '2307894561'),
(5, 'CARLA BREZZA', 'PASSAGEM VEMTIMBORA 157', '32538954', '89456123078')
;
INSERT INTO hospital.consulta (id, data_consulta, medico_id, paciente_id, secretaria_id, valor, pago) VALUES
(1, '2019-09-08', 1, 1, 1, 150.50, 'true'),
(2, '2019-10-15', 5, 1, 2, 450.65, 'true'),
(3, '2019-12-11', 4, 2, 5, 120.00, 'false'),
(4, '2019-09-10', 3, 3, 3, 150.30, 'true'),
(5, '2019-11-02', 4, 5, 4, 130.00, 'true'),
(6, '2019-11-02', 2, 4, 3, 480.65, 'true')
;
INSERT INTO joins.departamentos (id, nome, sigla) VALUES
(1, 'Compras', 'COMPR'),
(2, 'Comercial', 'COMER'),
(3, 'Financeiro', 'FINAN'),
(4, 'Marketing', 'MARKE'),
(5, 'Diretoria', 'DIRET')
;
INSERT INTO joins.funcionarios (id, nome, telefone, endereco, bairro, cep, salario, cidade, departamento_id) VALUES
(1, 'Maria João', '99070012', 'Av. Gov José Malcher, 2460', 'São Bras', '66060281', 1500.8, 'Belém', 1),
(2, 'Pedro Zamora', '99989988', 'Av. Magalhães Barata, 1360', 'Nazaré', '66055090', 2300.12, 'Belem', 2),
(3, 'Andrea Pinho', '99989988', 'Boaventura da Silva, 678, ap 304', 'Umarizal', '66075080', 4080.5, 'BELEM', 2),
(4, 'Mario Silva', '2223234', 'Cidade Nova IV, 3456', 'São Bras', '66060281', 1200.8, 'Ananindeua', 5),
(5, 'Felipe Almeida', '99980088', 'Av. Roberto Camelier, 2360', 'Jurunas', '66055090', 9300.72, 'Belem', 4),
(6, 'Rafael Bezerra', '99345688', 'Passagem Maxima, 678, ap 304', 'Marco', '66075080', 4080.5, 'BELEM', 3),
(7, 'Katia Santos', '98760012', 'Trav Mauriti, 2460', 'Marco', '66060281', 700.8, 'Belém', 4),
(8, 'Gustavo Pinto', '22389988', 'Passagem Barata, 1360', 'Cidade Nova IV', '66055090', 2300.12, 'Ananindeua', 2),
(9, 'Anderson Marques', '32289988', '40 horas, 678', 'Coqueiro', '66075080', 8900.5, 'Ananindeua', 1),
(10, 'Renato Hudson', '34553234', 'Passagem Tereza, 3456', 'Cidade Nova V', '66060281', 1450.8, 'Ananindeua', 5),
(11, 'Tiago Alves', '78889988', 'Av. Magalhães Barata, 1360', 'Nazaré', '66055090', 2990.62, 'Belem', 4),
(12, 'Mario Antonio', '23489988', 'Boaventura da Silva, 678, ap 304', 'Umarizal', '66075080', 4080.5, 'BELEM', 3),
(13, 'Maria Silva', '32470012', 'Av. Gov José Malcher, 2460', 'São Bras', '66060281', 1500.8, 'Belém', 2),
(14, 'Jean Zorat', '88789988', 'Av. Magalhães Barata, 1360', 'Nazaré', '66055090', 2823.99, 'Belem', 1),
(15, 'Andre Ribeiro', '76589988', 'Boaventura da Silva, 678, ap 304', 'Umarizal', '66075080', 3567.5, 'BELEM', 2),
(16, 'Matheus Carmo', '87893234', 'Cidade Nova IV, 3456', 'São Bras', '66060281', 1689.9, 'Ananindeua', 4),
(17, 'Daniel Dantes', '22989988', 'Av. Magalhães Barata, 1360', 'Nazaré', '66055090', 2800.12, 'Belem', 3),
(18, 'Zumira Castro', '99989988', 'Boaventura da Silva, 678, ap 304', 'Umarizal', '66075080', 8080.0, 'BELEM', 4)
;
