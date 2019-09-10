CREATE SCHEMA IF NOT EXISTS agendamento;
CREATE TABLE IF NOT EXISTS agendamento.recurso(
id_recurso varchar (255) NOT NULL,
nu_estoque_recurso int4 NOT NULL,
tx_nome varchar (255) NOT NULL,
id_recurso_pai varchar (255)
);

CREATE TABLE IF NOT EXISTS agendamento.agendamento(
id_agendamento varchar (255) NOT NULL,
tx_documento varchar (255),
dt_fim timestamp NOT NULL,
dt_inicio timestamp NOT NULL,
tx_chamado_otrs varchar (255),
tx_objetivo varchar (255) NOT NULL,
tx_observacao varchar (255),
bo_status bool NOT NULL,
id_espaco_organizacional varchar (255) NOT NULL,
id_empregado varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS agendamento.responsavel_recurso(
id_responsavel_recurso varchar (255) NOT NULL,
id_recurso varchar (255) NOT NULL,
id_empregado_responsavel varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS agendamento.recurso_agendamento(
id_recurso_agendamento varchar (255) NOT NULL,
nu_qtd_recurso int4 NOT NULL,
id_agendamento varchar (255) NOT NULL,
id_recurso varchar (255) NOT NULL
);

CREATE SCHEMA IF NOT EXISTS coss;
CREATE TABLE IF NOT EXISTS coss.tipo_equipamento(
id_tipo_equipamento varchar (255) NOT NULL,
tx_nome varchar (40) NOT NULL,
bo_ativo bool NOT NULL
);

CREATE TABLE IF NOT EXISTS coss.tipo_servico(
id_tipo_servico varchar (255) NOT NULL,
tx_nome varchar (40) NOT NULL,
bo_ativo bool NOT NULL
);

CREATE TABLE IF NOT EXISTS coss.tipo_material(
id_tipo_material varchar (255) NOT NULL,
tx_nome varchar (80) NOT NULL,
bo_ativo bool NOT NULL,
id_tipo_servico varchar (255) NOT NULL,
id_unidade_medida varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS coss.movimentacao_tipo_material(
id_movimentacao_tipo_material varchar (255) NOT NULL,
dt_inclusao timestamp NOT NULL,
dt_movimentacao date NOT NULL,
nu_quantidade numeric NOT NULL,
en_tipo_movimentacao varchar (7) NOT NULL,
id_tipo_material varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS coss.solicitacao_servico(
id_solicitacao_servico varchar (255) NOT NULL,
dt_execucao timestamp,
dt_recebimento timestamp,
dt_solicitacao timestamp NOT NULL,
tx_descricao_servico varchar (2000) NOT NULL,
tx_descricao_servico_realizado varchar (2000),
tx_ordem_externa varchar (20) NOT NULL,
nu_ordem_interna int8 NOT NULL,
tx_patrimonio varchar (20),
en_tipo_status_solicitacao varchar (9) NOT NULL,
id_espaco_organizacional varchar (255) NOT NULL,
id_servidor_recebimento varchar (255),
id_pessoa_solicitante varchar (255) NOT NULL,
id_tecnico varchar (255) NOT NULL,
id_tipo_equipamento varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS coss.uso_material_solicitacao_servico(
id_uso_material_solicitacao_servico varchar (255) NOT NULL,
id_movimentacao_tipo_material varchar (255) NOT NULL,
id_solicitacao_servico varchar (255) NOT NULL
);

CREATE SCHEMA IF NOT EXISTS curriculum_vitae;
CREATE TABLE IF NOT EXISTS curriculum_vitae.tipo_producao_intelectual(
id_tipo_producao_intelectual varchar (255) NOT NULL,
tx_nome varchar (80) NOT NULL,
bo_ativo bool NOT NULL,
id_tipo_producao_intelectual_pai varchar (255)
);

CREATE TABLE IF NOT EXISTS curriculum_vitae.producao_intelectual(
id_producao_intelectual varchar (255) NOT NULL,
nu_ano_ultima_situacao_producao int4 NOT NULL,
tx_descricao varchar (2000) NOT NULL,
tx_ncep varchar (255),
tx_nceua varchar (255),
tx_nsisbio varchar (255),
en_ultima_situacao_producao varchar (12) NOT NULL,
bo_ativo bool NOT NULL,
tx_titulo varchar (500) NOT NULL,
nu_valor_financiamento numeric,
id_pessoa varchar (255) NOT NULL,
id_producao_intelectual_pai varchar (255),
id_tipo_producao_intelectual varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS curriculum_vitae.producao_intelectual_fonte_recurso(
id_producao_intelectual_fonte_recurso varchar (255) NOT NULL,
id_fonte_recurso varchar (255) NOT NULL,
id_producao_intelectual varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS curriculum_vitae.producao_intelectual_participante(
id_producao_intelectual_participante varchar (255) NOT NULL,
id_pessoa varchar (255) NOT NULL,
id_producao_intelectual varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS curriculum_vitae.tarefa_producao_intelectual(
id_tarefa_producao_intelectual varchar (255) NOT NULL,
en_classificacao_complexidade varchar (5) NOT NULL,
en_classificacao_prioridade varchar (5) NOT NULL,
dt_inicio_execucao date,
dt_inicio_planejamento date NOT NULL,
dt_termino_execucao date,
dt_termino_planejamento date NOT NULL,
tx_nome varchar (500) NOT NULL,
id_producao_intelectual varchar (255),
id_tarefa_producao_intelectual_pai varchar (255)
);

CREATE SCHEMA IF NOT EXISTS imunizacao;
CREATE TABLE IF NOT EXISTS imunizacao.local_vacinacao(
id_local_vacinacao varchar (255) NOT NULL,
tx_nome varchar (80) NOT NULL
);

CREATE TABLE IF NOT EXISTS imunizacao.tipo_vacina(
id_tipo_vacina varchar (255) NOT NULL,
tx_nome varchar (80) NOT NULL
);

CREATE TABLE IF NOT EXISTS imunizacao.codigo_vacina(
id_codigo_vacina varchar (255) NOT NULL,
tx_identificador varchar (40) NOT NULL,
tx_nome varchar (80) NOT NULL,
nu_dias_efeito int4 NOT NULL,
id_tipo_vacina varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS imunizacao.lote_vacina(
id_lote_vacina varchar (255) NOT NULL,
dt_aquisicao date NOT NULL,
dt_fabricacao date NOT NULL,
dt_validade date NOT NULL,
tx_identificador varchar (40) NOT NULL,
nu_numero_ampolas int4 NOT NULL,
nu_quantidade_doses_por_ampola int4 NOT NULL,
nu_quantidade_ml_por_dose numeric NOT NULL,
id_tipo_vacina varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS imunizacao.caderneta_vacinacao(
id_caderneta_vacinacao varchar (255) NOT NULL,
id_pessoa_fisica varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS imunizacao.vacina(
id_vacina varchar (255) NOT NULL,
dt_aplicacao date NOT NULL,
bo_imunidade bool NOT NULL,
id_caderneta_vacinacao varchar (255) NOT NULL,
id_codigo_vacina varchar (255) NOT NULL,
id_local_vacinacao varchar (255) NOT NULL,
id_lote_vacina varchar (255) NOT NULL,
id_empregado varchar (255) NOT NULL
);

CREATE SCHEMA IF NOT EXISTS inscricao;
CREATE TABLE IF NOT EXISTS inscricao.cadastro(
id_cadastro varchar (255) NOT NULL,
dt_cadastro date NOT NULL,
id_pessoa varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS inscricao.calendario_inscricao(
nu_carga_horaria int4 NOT NULL,
tx_conteudo_programatico varchar (5000),
tx_email_responsavel varchar (255) NOT NULL,
xml_formulario_inscricao varchar (255),
id_calendario varchar (255) NOT NULL,
id_curso varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS inscricao.inscricao(
id_inscricao varchar (255) NOT NULL,
dt_inscricao timestamp NOT NULL,
xml_formulario_inscricao_resposta varchar (255),
tx_codigo_inscricao varchar (80) NOT NULL,
id_cadastro varchar (255) NOT NULL,
id_calendario_inscricao varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS inscricao.certificado(
id_certificado varchar (255) NOT NULL,
dt_emissao timestamp NOT NULL,
nu_folha_livro int4 NOT NULL,
tx_livro varchar (20) NOT NULL,
nu_numero_registro int4 NOT NULL,
en_tipo_certificacao varchar (11) NOT NULL,
en_tipo_inscricao varchar (12) NOT NULL,
id_inscricao varchar (255) NOT NULL
);

CREATE SCHEMA IF NOT EXISTS pesquisa;
CREATE TABLE IF NOT EXISTS pesquisa.aparelho_coleta(
id_aparelho_coleta varchar (255) NOT NULL,
tx_nome varchar (80) NOT NULL,
bo_ativo bool NOT NULL
);

CREATE TABLE IF NOT EXISTS pesquisa.exame_taxonomico(
id_exame_taxonomico varchar (255) NOT NULL,
tx_nome varchar (80) NOT NULL,
bo_ativo bool NOT NULL,
en_tipo_exame_taxonomico varchar (11) NOT NULL,
id_exame_taxonomico_pai varchar (255)
);

CREATE TABLE IF NOT EXISTS pesquisa.ser_taxonomico(
id_ser_taxonomico varchar (255) NOT NULL,
tx_nome varchar (80) NOT NULL,
tx_sigla varchar (20),
bo_ativo bool NOT NULL,
id_ser_taxonomico_pai varchar (255)
);

CREATE TABLE IF NOT EXISTS pesquisa.taxonomia(
id_taxonomia varchar (255) NOT NULL,
tx_nome varchar (80) NOT NULL,
bo_ativo bool NOT NULL,
id_taxonomia_pai varchar (255)
);

CREATE TABLE IF NOT EXISTS pesquisa.tipo_atracao(
id_tipo_atracao varchar (255) NOT NULL,
tx_nome varchar (80) NOT NULL,
bo_ativo bool NOT NULL
);

CREATE TABLE IF NOT EXISTS pesquisa.tipo_coleta(
id_tipo_coleta varchar (255) NOT NULL,
tx_nome varchar (80) NOT NULL,
bo_ativo bool NOT NULL
);

CREATE TABLE IF NOT EXISTS pesquisa.classificacao_taxonomica(
id_classificacao_taxonomica varchar (255) NOT NULL,
id_ser_taxonomico varchar (255) NOT NULL,
id_taxonomia varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pesquisa.boletim_identificacao(
id_boletim_identificacao varchar (255) NOT NULL,
dt_inicio_registro date NOT NULL,
dt_termino_registro date NOT NULL,
tx_logradouro varchar (200) NOT NULL,
tx_numero_boletim varchar (10) NOT NULL,
tx_numero_oficio varchar (20),
id_aparelho_coleta varchar (255) NOT NULL,
id_espaco_geografico varchar (255) NOT NULL,
id_pessoa_fisica_registrador varchar (255) NOT NULL,
id_tipo_atracao varchar (255) NOT NULL,
id_tipo_coleta varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pesquisa.identificacao_taxonomica(
id_identificacao_taxonomica varchar (255) NOT NULL,
dt_captura date NOT NULL,
en_genero varchar (13) NOT NULL,
nu_quantidade numeric NOT NULL,
id_boletim_identificacao varchar (255) NOT NULL,
id_classificacao_taxonomica varchar (255) NOT NULL,
id_pessoa_fisica_registrador varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pesquisa.lote_taxonomico(
id_lote_taxonomico varchar (255) NOT NULL,
en_genero varchar (13) NOT NULL,
tx_numero_lote_taxonomico varchar (10) NOT NULL,
nu_quantidade numeric NOT NULL,
id_boletim_identificacao varchar (255) NOT NULL,
id_classificacao_taxonomica varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pesquisa.pesquisa_taxonomica(
id_pesquisa_taxonomica varchar (255) NOT NULL,
en_resultado_pesquisa_taxonomica varchar (12) NOT NULL,
id_exame_taxonomico varchar (255) NOT NULL,
id_lote_taxonomico varchar (255) NOT NULL,
id_pessoa_examinador varchar (255) NOT NULL
);

CREATE SCHEMA IF NOT EXISTS pibic;
CREATE TABLE IF NOT EXISTS pibic.tipo_documento_base_pibic(
id_tipo_documento_base_pibic varchar (255) NOT NULL,
bo_campo_obrigatorio bool NOT NULL,
tx_nome varchar (80) NOT NULL,
bo_ativo bool NOT NULL,
en_tipo_documento_base varchar (16) NOT NULL
);

CREATE TABLE IF NOT EXISTS pibic.calendario_submissao(
dt_inicio_avaliacao_projeto timestamp NOT NULL,
dt_inicio_relatorio_final timestamp NOT NULL,
dt_inicio_relatorio_parcial timestamp NOT NULL,
dt_inicio_submissao_poster timestamp NOT NULL,
dt_inicio_submissao_resumo timestamp NOT NULL,
dt_termino_avaliacao_projeto timestamp NOT NULL,
dt_termino_relatorio_final timestamp NOT NULL,
dt_termino_relatorio_parcial timestamp NOT NULL,
dt_termino_submissao_poster timestamp NOT NULL,
dt_termino_submissao_resumo timestamp NOT NULL,
id_calendario varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pibic.tipo_documento_calendario_pibic(
id_tipo_documento_calendario_pibic varchar (255) NOT NULL,
id_calendario_submissao varchar (255) NOT NULL,
id_tipo_documento_base_pibic varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pibic.orientador(
id_orientador varchar (255) NOT NULL,
bo_ativo bool NOT NULL,
id_empregado varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pibic.projeto_pibic(
id_projeto varchar (255) NOT NULL,
id_calendario_submissao varchar (255) NOT NULL,
id_orientador varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pibic.avaliador_projeto_pibic(
id_avaliador_projeto_pibic varchar (255) NOT NULL,
dt_notificacao_associacao_projeto timestamp,
id_empregado varchar (255) NOT NULL,
id_projeto varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pibic.avaliacao_projeto_pibic(
id_avaliacao_projeto_pibic varchar (255) NOT NULL,
tx_adequacoes varchar (255) NOT NULL,
tx_apresenta_parecer_comite varchar (255) NOT NULL,
tx_atividades_prevista_bolsista varchar (255) NOT NULL,
tx_consistencia_projeto varchar (255) NOT NULL,
tx_justificatica_apresenta_parecer_comite varchar (255) NOT NULL,
tx_justificatica_atividades_prevista_bolsista varchar (255) NOT NULL,
tx_justificativa_metodologia varchar (255) NOT NULL,
tx_justificativa_objetivo_compativel varchar (255) NOT NULL,
tx_justificativa_relevancia_regional varchar (255) NOT NULL,
tx_metodologia_descrita varchar (255) NOT NULL,
tx_objetivo_compativel varchar (255) NOT NULL,
tx_orcamento_compativel varchar (255) NOT NULL,
tx_relevancia_regional varchar (255) NOT NULL,
en_tipo_conclusao varchar (25) NOT NULL,
id_avaliador_projeto_pibic varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pibic.bolsista_projeto_pibic(
id_bolsista_projeto_pibic varchar (255) NOT NULL,
dt_notificacao_associacao_projeto timestamp,
id_bolsista varchar (255) NOT NULL,
id_projeto varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pibic.avaliacao_bolsista_pibic(
id_avaliacao_bolsista_pibic varchar (255) NOT NULL,
id_bolsista_projeto_pibic varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pibic.documento_bolsista_pibic(
tx_comente_aspectos_relevantes varchar (255) NOT NULL,
bo_houve_mudanca_projeto bool NOT NULL,
bo_metodologia_plano_trabalho bool NOT NULL,
bo_mudanca_justificadas bool NOT NULL,
tx_parecer_relatorio varchar (255) NOT NULL,
bo_projeto_desenvolvido_acordo_proposta_aprovada bool NOT NULL,
en_relacao_adequacao_metodologia varchar (12) NOT NULL,
en_relacao_adequacao_projeto_metodologia varchar (12) NOT NULL,
en_relacao_orientador varchar (12) NOT NULL,
bo_resultados_relevantes bool NOT NULL,
id_documento varchar (255) NOT NULL,
id_avaliacao_bolsista_pibic varchar (255) NOT NULL,
id_projeto varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pibic.documento_projeto_pibic(
tx_justificativa_ausencia_documento varchar (500),
id_documento varchar (255) NOT NULL,
id_avaliacao_bolsista_pibic varchar (255),
id_projeto varchar (255) NOT NULL,
id_tipo_documento_base_pibic varchar (255) NOT NULL
);

CREATE SCHEMA IF NOT EXISTS public;
CREATE TABLE IF NOT EXISTS public.calendario(
id_calendario varchar (255) NOT NULL,
dt_inicio timestamp NOT NULL,
dt_termino timestamp NOT NULL,
tx_nome varchar (200) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.cor(
id_cor varchar (255) NOT NULL,
tx_nome varchar (80) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.documento(
id_documento varchar (255) NOT NULL,
dt_cadastro date NOT NULL,
tx_nome varchar (120) NOT NULL,
tx_tipo_conteudo varchar (40) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.espaco_geografico(
id_espaco_geografico varchar (255) NOT NULL,
tx_nome varchar (80) NOT NULL,
tx_sigla varchar (20),
bo_ativo bool NOT NULL,
en_tipo_espaco_geografico varchar (13) NOT NULL,
id_espaco_geografico_pai varchar (255)
);

CREATE TABLE IF NOT EXISTS public.espaco_organizacional(
id_espaco_organizacional varchar (255) NOT NULL,
tx_email varchar (120),
tx_nome varchar (200) NOT NULL,
tx_sigla varchar (20) NOT NULL,
bo_ativo bool NOT NULL,
en_tipo_espaco_organizacional varchar (13) NOT NULL,
id_espaco_organizacional_pai varchar (255)
);

CREATE TABLE IF NOT EXISTS public.fonte_recurso(
id_fonte_recurso varchar (255) NOT NULL,
tx_nome varchar (200) NOT NULL,
tx_sigla varchar (20) NOT NULL,
tx_url varchar (80)
);

CREATE TABLE IF NOT EXISTS public.instituicao_financeira(
id_instituicao_financeira varchar (255) NOT NULL,
tx_identificador varchar (10) NOT NULL,
bo_ativo bool NOT NULL
);

CREATE TABLE IF NOT EXISTS public.projeto(
id_projeto varchar (255) NOT NULL,
tx_objetivo_geral varchar (500) NOT NULL,
tx_subtitulo varchar (120),
tx_titulo varchar (80) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.unidade_medida(
id_unidade_medida varchar (255) NOT NULL,
tx_abreviatura varchar (20) NOT NULL,
en_categoria varchar (18) NOT NULL,
tx_nome varchar (40) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.arquivo(
id_arquivo varchar (255) NOT NULL,
bi_conteudo oid NOT NULL,
id_documento varchar (255)
);

CREATE TABLE IF NOT EXISTS public.pessoa(
id_pessoa varchar (255) NOT NULL,
tx_bairro varchar (80) NOT NULL,
tx_cep varchar (15),
tx_complemento varchar (500),
tx_email varchar (120),
tx_endereco varchar (200) NOT NULL,
tx_nome varchar (120) NOT NULL,
en_tipo_pessoa varchar (8) NOT NULL,
id_espaco_geografico varchar (255) NOT NULL,
id_documento varchar (255)
);

CREATE TABLE IF NOT EXISTS public.pessoa_documento_identificacao(
id_pessoa_documento_identificacao varchar (255) NOT NULL,
dt_expedicao date,
dt_validade date,
tx_numero_identificacao varchar (20) NOT NULL,
tx_observacao varchar (200),
tx_orgao_emissor varchar (80),
tx_tipo_documento_identificacao varchar (20) NOT NULL,
id_espaco_geografico varchar (255),
id_pessoa varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.pessoa_fisica(
dt_nascimento date NOT NULL,
en_estado_civil varchar (13) NOT NULL,
en_genero varchar (13) NOT NULL,
tx_login varchar (80),
tx_nome_mae varchar (120),
tx_nome_social varchar (120),
en_tipo_sanguineo varchar (13) NOT NULL,
id_pessoa varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.pessoa_juridica(
dt_fundacao date NOT NULL,
tx_sigla varchar (40),
tx_web_site varchar (80),
id_pessoa varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.pessoa_telefone(
id_pessoa_telefone varchar (255) NOT NULL,
tx_numero varchar (20) NOT NULL,
en_tipo_telefone varchar (7) NOT NULL,
id_pessoa varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.cargo(
id_cargo varchar (255) NOT NULL,
en_nivel_ensino varchar (14) NOT NULL,
tx_nome varchar (80) NOT NULL,
bo_ativo bool NOT NULL,
id_pessoa varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.instituicao_ensino(
id_instituicao_ensino varchar (255) NOT NULL,
dt_inicio_concessao date,
dt_inicio_cooperacao date,
dt_termino_concessao date,
dt_termino_cooperacao date,
bo_ativo bool NOT NULL,
id_empresa varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.curso(
id_curso varchar (255) NOT NULL,
en_nivel_ensino varchar (14) NOT NULL,
tx_nome varchar (80) NOT NULL,
tx_sigla varchar (20) NOT NULL,
bo_ativo bool NOT NULL,
id_instituicao_ensino varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.empregado(
id_empregado varchar (255) NOT NULL,
nu_ano_formacao_academica int4,
bo_cracha_impresso bool NOT NULL,
dt_inicio date NOT NULL,
dt_termino date,
bo_ativo bool NOT NULL,
en_tipo_emprego varchar (16) NOT NULL,
en_turno varchar (15) NOT NULL,
id_cargo varchar (255) NOT NULL,
id_curso varchar (255),
id_espaco_organizacional varchar (255) NOT NULL,
id_pessoa varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.consultor_ad_hoc(
tx_especialidade varchar (120) NOT NULL,
id_empregado varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.documento_frequencia(
dt_referencia date NOT NULL,
id_documento varchar (255) NOT NULL,
id_empregado varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.servidor_publico(
tx_identificacao_unica varchar (15) NOT NULL,
id_empregado varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.terceirizado(
tx_descricao varchar (2000),
id_empregado varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.treinamento(
tx_nome_cracha varchar (40) NOT NULL,
id_empregado varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.bolsista(
tx_agencia varchar (20),
bo_assegurado bool NOT NULL,
tx_conta varchar (20),
bo_remunerado bool NOT NULL,
en_tipo_bolsa varchar (13) NOT NULL,
id_empregado varchar (255) NOT NULL,
id_pessoa_juridica_fomentadora varchar (255),
id_instituicao_financeira varchar (255),
id_orientador_externo varchar (255),
id_orientador_iec varchar (255) NOT NULL,
id_projeto varchar (255),
id_documento varchar (255)
);

CREATE SCHEMA IF NOT EXISTS transporte;
CREATE TABLE IF NOT EXISTS transporte.fabricante(
id_fabricante varchar (255) NOT NULL,
tx_nome varchar (80) NOT NULL
);

CREATE TABLE IF NOT EXISTS transporte.relatorio_veiculo_pj_mes(
tx_placa varchar (255) NOT NULL,
tx_nome varchar (255) NOT NULL,
tx_mes varchar (255) NOT NULL,
qt_combustivel numeric,
en_tipo_combustivel varchar (20),
nu_km_rodado numeric,
vl_combustivel numeric,
vl_pecas numeric,
vl_servico numeric
);

CREATE TABLE IF NOT EXISTS transporte.tipo_despesa_transporte(
id_tipo_despesa_transporte varchar (255) NOT NULL,
en_categoria_despesa varchar (11) NOT NULL,
tx_nome varchar (80) NOT NULL,
bo_ativo bool NOT NULL
);

CREATE TABLE IF NOT EXISTS transporte.modelo(
id_modelo varchar (255) NOT NULL,
en_categoria varchar (8) NOT NULL,
tx_nome varchar (80) NOT NULL,
id_fabricante varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS transporte.veiculo(
id_veiculo varchar (255) NOT NULL,
nu_ano int4 NOT NULL,
tx_observacao varchar (2000),
tx_placa varchar (20) NOT NULL,
en_tipo_combustivel varchar (20),
en_tipo_pessoa varchar (8) NOT NULL,
id_cor varchar (255) NOT NULL,
id_modelo varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS transporte.veiculo_pessoa_fisica(
id_veiculo varchar (255) NOT NULL,
id_pessoa varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS transporte.veiculo_pessoa_juridica(
id_veiculo varchar (255) NOT NULL,
id_pessoa varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS transporte.resumo_controle_diario(
id_resumo_controle_diario varchar (255) NOT NULL,
dt_chegada timestamp,
dt_saida timestamp NOT NULL,
nu_kilometragem_chegada numeric,
nu_kilometragem_saida numeric NOT NULL,
id_empregado_motorista varchar (255) NOT NULL,
id_veiculo_pessoa_juridica varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS transporte.nota_despesa_transporte(
id_nota_despesa_transporte varchar (255) NOT NULL,
dt_despesa date NOT NULL,
nu_kilometragem numeric NOT NULL,
tx_numero_requisicao varchar (20) NOT NULL,
tx_observacao varchar (2000),
en_tipo_pagamento varchar (16) NOT NULL,
tx_vendedor varchar (40),
id_pessoa_juridica varchar (255) NOT NULL,
id_empregado_motorista varchar (255) NOT NULL,
id_servidor_responsavel varchar (255) NOT NULL,
id_veiculo_pessoa_juridica varchar (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS transporte.item_despesa_transporte(
id_item_despesa_transporte varchar (255) NOT NULL,
nu_diferenca numeric NOT NULL,
nu_preco_unitario numeric NOT NULL,
nu_quantidade numeric NOT NULL,
nu_total numeric NOT NULL,
id_nota_despesa_transporte varchar (255) NOT NULL,
id_tipo_despesa_transporte varchar (255) NOT NULL
);

ALTER TABLE agendamento.recurso
ADD CONSTRAINT recurso_pkey PRIMARY KEY (id_recurso);
ALTER TABLE agendamento.agendamento
ADD CONSTRAINT agendamento_pkey PRIMARY KEY (id_agendamento);
ALTER TABLE agendamento.responsavel_recurso
ADD CONSTRAINT responsavel_recurso_pkey PRIMARY KEY (id_responsavel_recurso);
ALTER TABLE agendamento.recurso_agendamento
ADD CONSTRAINT recurso_agendamento_pkey PRIMARY KEY (id_recurso_agendamento);
ALTER TABLE coss.tipo_equipamento
ADD CONSTRAINT tipo_equipamento_pkey PRIMARY KEY (id_tipo_equipamento);
ALTER TABLE coss.tipo_servico
ADD CONSTRAINT tipo_servico_pkey PRIMARY KEY (id_tipo_servico);
ALTER TABLE coss.tipo_material
ADD CONSTRAINT tipo_material_pkey PRIMARY KEY (id_tipo_material);
ALTER TABLE coss.movimentacao_tipo_material
ADD CONSTRAINT movimentacao_tipo_material_pkey PRIMARY KEY (id_movimentacao_tipo_material);
ALTER TABLE coss.solicitacao_servico
ADD CONSTRAINT solicitacao_servico_pkey PRIMARY KEY (id_solicitacao_servico);
ALTER TABLE coss.uso_material_solicitacao_servico
ADD CONSTRAINT uso_material_solicitacao_servico_pkey PRIMARY KEY (id_uso_material_solicitacao_servico);
ALTER TABLE curriculum_vitae.tipo_producao_intelectual
ADD CONSTRAINT tipo_producao_intelectual_pkey PRIMARY KEY (id_tipo_producao_intelectual);
ALTER TABLE curriculum_vitae.producao_intelectual
ADD CONSTRAINT producao_intelectual_pkey PRIMARY KEY (id_producao_intelectual);
ALTER TABLE curriculum_vitae.producao_intelectual_fonte_recurso
ADD CONSTRAINT producao_intelectual_fonte_recurso_pkey PRIMARY KEY (id_producao_intelectual_fonte_recurso);
ALTER TABLE curriculum_vitae.producao_intelectual_participante
ADD CONSTRAINT producao_intelectual_participante_pkey PRIMARY KEY (id_producao_intelectual_participante);
ALTER TABLE curriculum_vitae.tarefa_producao_intelectual
ADD CONSTRAINT tarefa_producao_intelectual_pkey PRIMARY KEY (id_tarefa_producao_intelectual);
ALTER TABLE imunizacao.local_vacinacao
ADD CONSTRAINT local_vacinacao_pkey PRIMARY KEY (id_local_vacinacao);
ALTER TABLE imunizacao.tipo_vacina
ADD CONSTRAINT tipo_vacina_pkey PRIMARY KEY (id_tipo_vacina);
ALTER TABLE imunizacao.codigo_vacina
ADD CONSTRAINT codigo_vacina_pkey PRIMARY KEY (id_codigo_vacina);
ALTER TABLE imunizacao.lote_vacina
ADD CONSTRAINT lote_vacina_pkey PRIMARY KEY (id_lote_vacina);
ALTER TABLE imunizacao.caderneta_vacinacao
ADD CONSTRAINT caderneta_vacinacao_pkey PRIMARY KEY (id_caderneta_vacinacao);
ALTER TABLE imunizacao.vacina
ADD CONSTRAINT vacina_pkey PRIMARY KEY (id_vacina);
ALTER TABLE inscricao.cadastro
ADD CONSTRAINT cadastro_pkey PRIMARY KEY (id_cadastro);
ALTER TABLE inscricao.calendario_inscricao
ADD CONSTRAINT calendario_inscricao_pkey PRIMARY KEY (id_calendario);
ALTER TABLE inscricao.inscricao
ADD CONSTRAINT inscricao_pkey PRIMARY KEY (id_inscricao);
ALTER TABLE inscricao.certificado
ADD CONSTRAINT certificado_pkey PRIMARY KEY (id_certificado);
ALTER TABLE pesquisa.aparelho_coleta
ADD CONSTRAINT aparelho_coleta_pkey PRIMARY KEY (id_aparelho_coleta);
ALTER TABLE pesquisa.exame_taxonomico
ADD CONSTRAINT exame_taxonomico_pkey PRIMARY KEY (id_exame_taxonomico);
ALTER TABLE pesquisa.ser_taxonomico
ADD CONSTRAINT ser_taxonomico_pkey PRIMARY KEY (id_ser_taxonomico);
ALTER TABLE pesquisa.taxonomia
ADD CONSTRAINT taxonomia_pkey PRIMARY KEY (id_taxonomia);
ALTER TABLE pesquisa.tipo_atracao
ADD CONSTRAINT tipo_atracao_pkey PRIMARY KEY (id_tipo_atracao);
ALTER TABLE pesquisa.tipo_coleta
ADD CONSTRAINT tipo_coleta_pkey PRIMARY KEY (id_tipo_coleta);
ALTER TABLE pesquisa.classificacao_taxonomica
ADD CONSTRAINT classificacao_taxonomica_pkey PRIMARY KEY (id_classificacao_taxonomica);
ALTER TABLE pesquisa.boletim_identificacao
ADD CONSTRAINT boletim_identificacao_pkey PRIMARY KEY (id_boletim_identificacao);
ALTER TABLE pesquisa.identificacao_taxonomica
ADD CONSTRAINT identificacao_taxonomica_pkey PRIMARY KEY (id_identificacao_taxonomica);
ALTER TABLE pesquisa.lote_taxonomico
ADD CONSTRAINT lote_taxonomico_pkey PRIMARY KEY (id_lote_taxonomico);
ALTER TABLE pesquisa.pesquisa_taxonomica
ADD CONSTRAINT pesquisa_taxonomica_pkey PRIMARY KEY (id_pesquisa_taxonomica);
ALTER TABLE pibic.tipo_documento_base_pibic
ADD CONSTRAINT tipo_documento_base_pibic_pkey PRIMARY KEY (id_tipo_documento_base_pibic);
ALTER TABLE pibic.calendario_submissao
ADD CONSTRAINT calendario_submissao_pkey PRIMARY KEY (id_calendario);
ALTER TABLE pibic.tipo_documento_calendario_pibic
ADD CONSTRAINT tipo_documento_calendario_pibic_pkey PRIMARY KEY (id_tipo_documento_calendario_pibic);
ALTER TABLE pibic.orientador
ADD CONSTRAINT orientador_pkey PRIMARY KEY (id_orientador);
ALTER TABLE pibic.projeto_pibic
ADD CONSTRAINT projeto_pibic_pkey PRIMARY KEY (id_projeto);
ALTER TABLE pibic.avaliador_projeto_pibic
ADD CONSTRAINT avaliador_projeto_pibic_pkey PRIMARY KEY (id_avaliador_projeto_pibic);
ALTER TABLE pibic.avaliacao_projeto_pibic
ADD CONSTRAINT avaliacao_projeto_pibic_pkey PRIMARY KEY (id_avaliacao_projeto_pibic);
ALTER TABLE pibic.bolsista_projeto_pibic
ADD CONSTRAINT bolsista_projeto_pibic_pkey PRIMARY KEY (id_bolsista_projeto_pibic);
ALTER TABLE pibic.avaliacao_bolsista_pibic
ADD CONSTRAINT avaliacao_bolsista_pibic_pkey PRIMARY KEY (id_avaliacao_bolsista_pibic);
ALTER TABLE pibic.documento_bolsista_pibic
ADD CONSTRAINT documento_bolsista_pibic_pkey PRIMARY KEY (id_documento);
ALTER TABLE pibic.documento_projeto_pibic
ADD CONSTRAINT documento_projeto_pibic_pkey PRIMARY KEY (id_documento);
ALTER TABLE public.calendario
ADD CONSTRAINT calendario_pkey PRIMARY KEY (id_calendario);
ALTER TABLE public.cor
ADD CONSTRAINT cor_pkey PRIMARY KEY (id_cor);
ALTER TABLE public.documento
ADD CONSTRAINT documento_pkey PRIMARY KEY (id_documento);
ALTER TABLE public.espaco_geografico
ADD CONSTRAINT espaco_geografico_pkey PRIMARY KEY (id_espaco_geografico);
ALTER TABLE public.espaco_organizacional
ADD CONSTRAINT espaco_organizacional_pkey PRIMARY KEY (id_espaco_organizacional);
ALTER TABLE public.fonte_recurso
ADD CONSTRAINT fonte_recurso_pkey PRIMARY KEY (id_fonte_recurso);
ALTER TABLE public.instituicao_financeira
ADD CONSTRAINT instituicao_financeira_pkey PRIMARY KEY (id_instituicao_financeira);
ALTER TABLE public.projeto
ADD CONSTRAINT projeto_pkey PRIMARY KEY (id_projeto);
ALTER TABLE public.unidade_medida
ADD CONSTRAINT unidade_medida_pkey PRIMARY KEY (id_unidade_medida);
ALTER TABLE public.arquivo
ADD CONSTRAINT arquivo_pkey PRIMARY KEY (id_arquivo);
ALTER TABLE public.pessoa
ADD CONSTRAINT pessoa_pkey PRIMARY KEY (id_pessoa);
ALTER TABLE public.pessoa_documento_identificacao
ADD CONSTRAINT pessoa_documento_identificacao_pkey PRIMARY KEY (id_pessoa_documento_identificacao);
ALTER TABLE public.pessoa_fisica
ADD CONSTRAINT pessoa_fisica_pkey PRIMARY KEY (id_pessoa);
ALTER TABLE public.pessoa_juridica
ADD CONSTRAINT pessoa_juridica_pkey PRIMARY KEY (id_pessoa);
ALTER TABLE public.pessoa_telefone
ADD CONSTRAINT pessoa_telefone_pkey PRIMARY KEY (id_pessoa_telefone);
ALTER TABLE public.cargo
ADD CONSTRAINT cargo_pkey PRIMARY KEY (id_cargo);
ALTER TABLE public.instituicao_ensino
ADD CONSTRAINT instituicao_ensino_pkey PRIMARY KEY (id_instituicao_ensino);
ALTER TABLE public.curso
ADD CONSTRAINT curso_pkey PRIMARY KEY (id_curso);
ALTER TABLE public.empregado
ADD CONSTRAINT empregado_pkey PRIMARY KEY (id_empregado);
ALTER TABLE public.consultor_ad_hoc
ADD CONSTRAINT consultor_ad_hoc_pkey PRIMARY KEY (id_empregado);
ALTER TABLE public.documento_frequencia
ADD CONSTRAINT documento_frequencia_pkey PRIMARY KEY (id_documento);
ALTER TABLE public.servidor_publico
ADD CONSTRAINT servidor_publico_pkey PRIMARY KEY (id_empregado);
ALTER TABLE public.terceirizado
ADD CONSTRAINT terceirizado_pkey PRIMARY KEY (id_empregado);
ALTER TABLE public.treinamento
ADD CONSTRAINT treinamento_pkey PRIMARY KEY (id_empregado);
ALTER TABLE public.bolsista
ADD CONSTRAINT bolsista_pkey PRIMARY KEY (id_empregado);
ALTER TABLE transporte.fabricante
ADD CONSTRAINT fabricante_pkey PRIMARY KEY (id_fabricante);
ALTER TABLE transporte.relatorio_veiculo_pj_mes
ADD CONSTRAINT relatorio_veiculo_pj_mes_pkey PRIMARY KEY (tx_placa);
ALTER TABLE transporte.tipo_despesa_transporte
ADD CONSTRAINT tipo_despesa_transporte_pkey PRIMARY KEY (id_tipo_despesa_transporte);
ALTER TABLE transporte.modelo
ADD CONSTRAINT modelo_pkey PRIMARY KEY (id_modelo);
ALTER TABLE transporte.veiculo
ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id_veiculo);
ALTER TABLE transporte.veiculo_pessoa_fisica
ADD CONSTRAINT veiculo_pessoa_fisica_pkey PRIMARY KEY (id_veiculo);
ALTER TABLE transporte.veiculo_pessoa_juridica
ADD CONSTRAINT veiculo_pessoa_juridica_pkey PRIMARY KEY (id_veiculo);
ALTER TABLE transporte.resumo_controle_diario
ADD CONSTRAINT resumo_controle_diario_pkey PRIMARY KEY (id_resumo_controle_diario);
ALTER TABLE transporte.nota_despesa_transporte
ADD CONSTRAINT nota_despesa_transporte_pkey PRIMARY KEY (id_nota_despesa_transporte);
ALTER TABLE transporte.item_despesa_transporte
ADD CONSTRAINT item_despesa_transporte_pkey PRIMARY KEY (id_item_despesa_transporte);

ALTER TABLE agendamento.agendamento
ADD CONSTRAINT fkg4r95jyntk1s5h67lbw84pdg8 FOREIGN KEY (id_empregado)
REFERENCES public.empregado (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE agendamento.agendamento
ADD CONSTRAINT fkiqbyufpcnqdjiipbgv5o1bua6 FOREIGN KEY (id_espaco_organizacional)
REFERENCES public.espaco_organizacional (id_espaco_organizacional)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE agendamento.recurso
ADD CONSTRAINT fkr8bcvjdp3fet6sj0ixxoycx9l FOREIGN KEY (id_recurso_pai)
REFERENCES agendamento.recurso (id_recurso)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE agendamento.recurso_agendamento
ADD CONSTRAINT fkm8jpyqlrg4890y6g48x26nuks FOREIGN KEY (id_agendamento)
REFERENCES agendamento.agendamento (id_agendamento)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE agendamento.recurso_agendamento
ADD CONSTRAINT fkcr8dl46t55usk7rcgfjyk78nf FOREIGN KEY (id_recurso)
REFERENCES agendamento.recurso (id_recurso)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE agendamento.responsavel_recurso
ADD CONSTRAINT fkbtg0v20gteyo046226q5dj8d5 FOREIGN KEY (id_recurso)
REFERENCES agendamento.recurso (id_recurso)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE agendamento.responsavel_recurso
ADD CONSTRAINT fkali8j8epu61773gg3xn2fje8t FOREIGN KEY (id_empregado_responsavel)
REFERENCES public.empregado (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE coss.movimentacao_tipo_material
ADD CONSTRAINT fks4xpkc5904x44gthulvqonmab FOREIGN KEY (id_tipo_material)
REFERENCES coss.tipo_material (id_tipo_material)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE coss.solicitacao_servico
ADD CONSTRAINT fk7hjv7ckmjjmd2rqmp6awjj6mu FOREIGN KEY (id_tipo_equipamento)
REFERENCES coss.tipo_equipamento (id_tipo_equipamento)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE coss.solicitacao_servico
ADD CONSTRAINT fkbs78dojw4esnjjwf9upg8ri6l FOREIGN KEY (id_tecnico)
REFERENCES public.empregado (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE coss.solicitacao_servico
ADD CONSTRAINT fkplmwqnurpdb4bw3c90ltxm1fq FOREIGN KEY (id_espaco_organizacional)
REFERENCES public.espaco_organizacional (id_espaco_organizacional)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE coss.solicitacao_servico
ADD CONSTRAINT fkt99hyariyfqmra7iyrmrp30jk FOREIGN KEY (id_pessoa_solicitante)
REFERENCES public.pessoa_fisica (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE coss.solicitacao_servico
ADD CONSTRAINT fknrrj9aby90iy0xirgv2sllhlt FOREIGN KEY (id_servidor_recebimento)
REFERENCES public.servidor_publico (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE coss.tipo_material
ADD CONSTRAINT fk91oy5ma0hyoo0n4kq0mngp1yb FOREIGN KEY (id_tipo_servico)
REFERENCES coss.tipo_servico (id_tipo_servico)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE coss.tipo_material
ADD CONSTRAINT fklkui7lm8a9rg8eswsxw3916fp FOREIGN KEY (id_unidade_medida)
REFERENCES public.unidade_medida (id_unidade_medida)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE coss.uso_material_solicitacao_servico
ADD CONSTRAINT fkrcgdlm52x1bqis3i205nml88o FOREIGN KEY (id_movimentacao_tipo_material)
REFERENCES coss.movimentacao_tipo_material (id_movimentacao_tipo_material)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE coss.uso_material_solicitacao_servico
ADD CONSTRAINT fkju2ah6vvgjlon7mte526e3hu1 FOREIGN KEY (id_solicitacao_servico)
REFERENCES coss.solicitacao_servico (id_solicitacao_servico)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE curriculum_vitae.producao_intelectual
ADD CONSTRAINT fkn34tltqm793upmbfon0pclyvd FOREIGN KEY (id_producao_intelectual_pai)
REFERENCES curriculum_vitae.producao_intelectual (id_producao_intelectual)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE curriculum_vitae.producao_intelectual
ADD CONSTRAINT fk4ie2n655k2ow7s8ph6xqapt45 FOREIGN KEY (id_tipo_producao_intelectual)
REFERENCES curriculum_vitae.tipo_producao_intelectual (id_tipo_producao_intelectual)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE curriculum_vitae.producao_intelectual
ADD CONSTRAINT fkcx7rnoia9t9b3eb2hhirfhkpt FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa_fisica (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE curriculum_vitae.producao_intelectual_fonte_recurso
ADD CONSTRAINT fk64gxv89x1oq9qlav5fgdtx1hm FOREIGN KEY (id_producao_intelectual)
REFERENCES curriculum_vitae.producao_intelectual (id_producao_intelectual)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE curriculum_vitae.producao_intelectual_fonte_recurso
ADD CONSTRAINT fkt8pvlnirxqwkekhsvj9qtsqmb FOREIGN KEY (id_fonte_recurso)
REFERENCES public.fonte_recurso (id_fonte_recurso)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE curriculum_vitae.producao_intelectual_participante
ADD CONSTRAINT fk11l9hv9lqmaga4jgkmun0mhsm FOREIGN KEY (id_producao_intelectual)
REFERENCES curriculum_vitae.producao_intelectual (id_producao_intelectual)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE curriculum_vitae.producao_intelectual_participante
ADD CONSTRAINT fkcmpc1ufagskkcp5ll6r2fix79 FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa_fisica (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE curriculum_vitae.tarefa_producao_intelectual
ADD CONSTRAINT fk71ssusysbqe9llw6fpyiv7mja FOREIGN KEY (id_producao_intelectual)
REFERENCES curriculum_vitae.producao_intelectual (id_producao_intelectual)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE curriculum_vitae.tarefa_producao_intelectual
ADD CONSTRAINT fkc44fe92cr9w9dy8p74jsrjji0 FOREIGN KEY (id_tarefa_producao_intelectual_pai)
REFERENCES curriculum_vitae.tarefa_producao_intelectual (id_tarefa_producao_intelectual)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE curriculum_vitae.tipo_producao_intelectual
ADD CONSTRAINT fk5q62uoeqvsjy1q1wr2mers3a8 FOREIGN KEY (id_tipo_producao_intelectual_pai)
REFERENCES curriculum_vitae.tipo_producao_intelectual (id_tipo_producao_intelectual)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE imunizacao.caderneta_vacinacao
ADD CONSTRAINT fk4leraawfb1d5er9ji7miwlbf1 FOREIGN KEY (id_pessoa_fisica)
REFERENCES public.pessoa_fisica (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE imunizacao.codigo_vacina
ADD CONSTRAINT fkkqe3dqq14be0x8g3lw2b4y4pq FOREIGN KEY (id_tipo_vacina)
REFERENCES imunizacao.tipo_vacina (id_tipo_vacina)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE imunizacao.lote_vacina
ADD CONSTRAINT fk7dfkvnnuithb89b82j6f26uf3 FOREIGN KEY (id_tipo_vacina)
REFERENCES imunizacao.tipo_vacina (id_tipo_vacina)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE imunizacao.vacina
ADD CONSTRAINT fk1jpd4jyn7krj9jbgblp76748u FOREIGN KEY (id_caderneta_vacinacao)
REFERENCES imunizacao.caderneta_vacinacao (id_caderneta_vacinacao)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE imunizacao.vacina
ADD CONSTRAINT fkirlqmuml7lk4a070utnygcucw FOREIGN KEY (id_codigo_vacina)
REFERENCES imunizacao.codigo_vacina (id_codigo_vacina)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE imunizacao.vacina
ADD CONSTRAINT fk2twvnu2o570i4ewnt87u4r9yx FOREIGN KEY (id_local_vacinacao)
REFERENCES imunizacao.local_vacinacao (id_local_vacinacao)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE imunizacao.vacina
ADD CONSTRAINT fkh6auq1hf8ystecm8bjc84cyik FOREIGN KEY (id_lote_vacina)
REFERENCES imunizacao.lote_vacina (id_lote_vacina)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE imunizacao.vacina
ADD CONSTRAINT fkhtusndn2v35rq4pbr4lcyg9o6 FOREIGN KEY (id_empregado)
REFERENCES public.empregado (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE inscricao.cadastro
ADD CONSTRAINT fkrg4fjbw850sm5t5q89rqcw0e7 FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa_fisica (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE inscricao.calendario_inscricao
ADD CONSTRAINT fkfc2bybgt2seyt55dtfa9uenky FOREIGN KEY (id_calendario)
REFERENCES public.calendario (id_calendario)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE inscricao.calendario_inscricao
ADD CONSTRAINT fk9pej2vqchv6kii71wl9beg2ry FOREIGN KEY (id_curso)
REFERENCES public.curso (id_curso)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE inscricao.certificado
ADD CONSTRAINT fkavir6id4rjvt6r1pbwt91219m FOREIGN KEY (id_inscricao)
REFERENCES inscricao.inscricao (id_inscricao)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE inscricao.inscricao
ADD CONSTRAINT fkb6o3o08y12rb6ylsxaar86fke FOREIGN KEY (id_cadastro)
REFERENCES inscricao.cadastro (id_cadastro)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE inscricao.inscricao
ADD CONSTRAINT fkdsb6i0wrhsrlhqa720ts2189k FOREIGN KEY (id_calendario_inscricao)
REFERENCES inscricao.calendario_inscricao (id_calendario)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.boletim_identificacao
ADD CONSTRAINT fkefanejyam8ablepea5im1c062 FOREIGN KEY (id_aparelho_coleta)
REFERENCES pesquisa.aparelho_coleta (id_aparelho_coleta)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.boletim_identificacao
ADD CONSTRAINT fk8ynq5vss3r84werv1wjqn9chx FOREIGN KEY (id_tipo_atracao)
REFERENCES pesquisa.tipo_atracao (id_tipo_atracao)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.boletim_identificacao
ADD CONSTRAINT fkdlerf7jjq2eta1std4m4ydfrc FOREIGN KEY (id_tipo_coleta)
REFERENCES pesquisa.tipo_coleta (id_tipo_coleta)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.boletim_identificacao
ADD CONSTRAINT fk599ptith23ki104r4j2st7p5a FOREIGN KEY (id_espaco_geografico)
REFERENCES public.espaco_geografico (id_espaco_geografico)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.boletim_identificacao
ADD CONSTRAINT fka3nhyhe5pt46ahqets0u7v140 FOREIGN KEY (id_pessoa_fisica_registrador)
REFERENCES public.pessoa_fisica (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.classificacao_taxonomica
ADD CONSTRAINT fka6sifcks1375cbk51wkblorxf FOREIGN KEY (id_ser_taxonomico)
REFERENCES pesquisa.ser_taxonomico (id_ser_taxonomico)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.classificacao_taxonomica
ADD CONSTRAINT fknhwa3sfuyg40l0mwkqtc3pdbl FOREIGN KEY (id_taxonomia)
REFERENCES pesquisa.taxonomia (id_taxonomia)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.exame_taxonomico
ADD CONSTRAINT fkof3uvfeweyhe89vkpnp4rxesc FOREIGN KEY (id_exame_taxonomico_pai)
REFERENCES pesquisa.exame_taxonomico (id_exame_taxonomico)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.identificacao_taxonomica
ADD CONSTRAINT fkquj8wt9mf1f5d7uso9l7f6kpa FOREIGN KEY (id_boletim_identificacao)
REFERENCES pesquisa.boletim_identificacao (id_boletim_identificacao)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.identificacao_taxonomica
ADD CONSTRAINT fkfbf1t44m9uhja4u8wg40txsco FOREIGN KEY (id_classificacao_taxonomica)
REFERENCES pesquisa.classificacao_taxonomica (id_classificacao_taxonomica)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.identificacao_taxonomica
ADD CONSTRAINT fka2rtrs4c1lx9bn5hgol0wfqaw FOREIGN KEY (id_pessoa_fisica_registrador)
REFERENCES public.pessoa_fisica (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.lote_taxonomico
ADD CONSTRAINT fke3aql5ja1ul8n38c2ee9l4ls1 FOREIGN KEY (id_boletim_identificacao)
REFERENCES pesquisa.boletim_identificacao (id_boletim_identificacao)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.lote_taxonomico
ADD CONSTRAINT fk3gcwfsi5ajhhvj76fjifxhpy7 FOREIGN KEY (id_classificacao_taxonomica)
REFERENCES pesquisa.classificacao_taxonomica (id_classificacao_taxonomica)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.pesquisa_taxonomica
ADD CONSTRAINT fke3t03x3qtixowfak1mmvq903n FOREIGN KEY (id_exame_taxonomico)
REFERENCES pesquisa.exame_taxonomico (id_exame_taxonomico)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.pesquisa_taxonomica
ADD CONSTRAINT fkr0p5ccqcogxxjsglc12l529ll FOREIGN KEY (id_lote_taxonomico)
REFERENCES pesquisa.lote_taxonomico (id_lote_taxonomico)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.pesquisa_taxonomica
ADD CONSTRAINT fk2edmb6mvhbdnx8k2gkho9oo0 FOREIGN KEY (id_pessoa_examinador)
REFERENCES public.pessoa_fisica (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.ser_taxonomico
ADD CONSTRAINT fkknd6b1m08yvh90ivj0ws8b311 FOREIGN KEY (id_ser_taxonomico_pai)
REFERENCES pesquisa.ser_taxonomico (id_ser_taxonomico)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pesquisa.taxonomia
ADD CONSTRAINT fkpcm3pa6f8hm5pk7qeb1lhellj FOREIGN KEY (id_taxonomia_pai)
REFERENCES pesquisa.taxonomia (id_taxonomia)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.avaliacao_bolsista_pibic
ADD CONSTRAINT fkct8ymcija0c8qf23jo98gdpx3 FOREIGN KEY (id_bolsista_projeto_pibic)
REFERENCES pibic.bolsista_projeto_pibic (id_bolsista_projeto_pibic)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.avaliacao_projeto_pibic
ADD CONSTRAINT fk2uit1trkdrc2os05pearr4d06 FOREIGN KEY (id_avaliador_projeto_pibic)
REFERENCES pibic.avaliador_projeto_pibic (id_avaliador_projeto_pibic)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.avaliador_projeto_pibic
ADD CONSTRAINT fkajcag3ajnalfooffmgi647oc6 FOREIGN KEY (id_projeto)
REFERENCES pibic.projeto_pibic (id_projeto)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.avaliador_projeto_pibic
ADD CONSTRAINT fkmq3hf2lct48e163gvliy5wifl FOREIGN KEY (id_empregado)
REFERENCES public.empregado (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.bolsista_projeto_pibic
ADD CONSTRAINT fkh29sb0i9nvy2besbft07e9lj7 FOREIGN KEY (id_projeto)
REFERENCES pibic.projeto_pibic (id_projeto)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.bolsista_projeto_pibic
ADD CONSTRAINT fkjpk2yevhfdxb1sjbm6v7bk455 FOREIGN KEY (id_bolsista)
REFERENCES public.bolsista (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.calendario_submissao
ADD CONSTRAINT fk3ih38654skv1ahwt88xvmpfji FOREIGN KEY (id_calendario)
REFERENCES public.calendario (id_calendario)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.documento_bolsista_pibic
ADD CONSTRAINT fkjyg4drs9abxvx8ok4rpnylo13 FOREIGN KEY (id_avaliacao_bolsista_pibic)
REFERENCES pibic.avaliacao_bolsista_pibic (id_avaliacao_bolsista_pibic)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.documento_bolsista_pibic
ADD CONSTRAINT fk9hg5lurxw2ua8rqegemr1dxcg FOREIGN KEY (id_projeto)
REFERENCES pibic.projeto_pibic (id_projeto)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.documento_bolsista_pibic
ADD CONSTRAINT fkjsvy5xrgw46wigtu4np0yjvop FOREIGN KEY (id_documento)
REFERENCES public.documento (id_documento)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.documento_projeto_pibic
ADD CONSTRAINT fku9c20h8e2q3jncofd71vwyv FOREIGN KEY (id_avaliacao_bolsista_pibic)
REFERENCES pibic.avaliacao_bolsista_pibic (id_avaliacao_bolsista_pibic)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.documento_projeto_pibic
ADD CONSTRAINT fk71a0dvmal6f3q3n3prg8w63ax FOREIGN KEY (id_projeto)
REFERENCES pibic.projeto_pibic (id_projeto)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.documento_projeto_pibic
ADD CONSTRAINT fkyfqocrlatpbj53mxj6vdf2sy FOREIGN KEY (id_tipo_documento_base_pibic)
REFERENCES pibic.tipo_documento_base_pibic (id_tipo_documento_base_pibic)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.documento_projeto_pibic
ADD CONSTRAINT fkhpijiwjjhl6eh0xjl33pj6c9u FOREIGN KEY (id_documento)
REFERENCES public.documento (id_documento)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.orientador
ADD CONSTRAINT fk6pd4yl4pxb6y1owm41gp53yf5 FOREIGN KEY (id_empregado)
REFERENCES public.empregado (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.projeto_pibic
ADD CONSTRAINT fkqyq09vajaoihmwhenqgf1efgx FOREIGN KEY (id_calendario_submissao)
REFERENCES pibic.calendario_submissao (id_calendario)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.projeto_pibic
ADD CONSTRAINT fk418rx29nyav2gkj1biqta7vyk FOREIGN KEY (id_orientador)
REFERENCES pibic.orientador (id_orientador)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.projeto_pibic
ADD CONSTRAINT fk76tpn5k9lja60t4xwpghqkua3 FOREIGN KEY (id_projeto)
REFERENCES public.projeto (id_projeto)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.tipo_documento_calendario_pibic
ADD CONSTRAINT fk2jnapg22w2nyuhoxe50q8yrwm FOREIGN KEY (id_calendario_submissao)
REFERENCES pibic.calendario_submissao (id_calendario)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE pibic.tipo_documento_calendario_pibic
ADD CONSTRAINT fkl0p45y7bdk37ljplnwa14ht5d FOREIGN KEY (id_tipo_documento_base_pibic)
REFERENCES pibic.tipo_documento_base_pibic (id_tipo_documento_base_pibic)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.arquivo
ADD CONSTRAINT fk9vbhh2yb355iwf2xjqxrgxr0f FOREIGN KEY (id_documento)
REFERENCES public.documento (id_documento)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.bolsista
ADD CONSTRAINT fk7aljxx5t1ewgbv2woi2dmr082 FOREIGN KEY (id_orientador_externo)
REFERENCES pibic.orientador (id_orientador)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.bolsista
ADD CONSTRAINT fk1vcnsw0rsf0gj9h6ltf9pd6em FOREIGN KEY (id_orientador_iec)
REFERENCES pibic.orientador (id_orientador)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.bolsista
ADD CONSTRAINT fkjsm9rs6utr9s8proxw5botkjq FOREIGN KEY (id_projeto)
REFERENCES pibic.projeto_pibic (id_projeto)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.bolsista
ADD CONSTRAINT fkt3wv42ws38du0h02a7n39titv FOREIGN KEY (id_documento)
REFERENCES public.documento (id_documento)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.bolsista
ADD CONSTRAINT fk3ibg0aibfsk61b54u0k28r7kv FOREIGN KEY (id_empregado)
REFERENCES public.empregado (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.bolsista
ADD CONSTRAINT fkgg9y7yxyjv5l6livhm9ciiwrs FOREIGN KEY (id_instituicao_financeira)
REFERENCES public.instituicao_financeira (id_instituicao_financeira)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.bolsista
ADD CONSTRAINT fk8eos46vi7x5h5g0nbqymajn8c FOREIGN KEY (id_pessoa_juridica_fomentadora)
REFERENCES public.pessoa_juridica (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.cargo
ADD CONSTRAINT fkcfq2f0mgvc18vr3xxhr7t61m0 FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa_juridica (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.consultor_ad_hoc
ADD CONSTRAINT fk4fgdofebs752aaikxe8w97pv5 FOREIGN KEY (id_empregado)
REFERENCES public.empregado (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.curso
ADD CONSTRAINT fkfoglu0g3sab1iodfpodis4j5u FOREIGN KEY (id_instituicao_ensino)
REFERENCES public.instituicao_ensino (id_instituicao_ensino)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.documento_frequencia
ADD CONSTRAINT fktiqfsvglxdwyds8bkl7finfyo FOREIGN KEY (id_documento)
REFERENCES public.documento (id_documento)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.documento_frequencia
ADD CONSTRAINT fkrtmda12qa1elec6dca7htjavt FOREIGN KEY (id_empregado)
REFERENCES public.empregado (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.empregado
ADD CONSTRAINT fkjfax7ximdwfg4gq52gjy5ubt5 FOREIGN KEY (id_cargo)
REFERENCES public.cargo (id_cargo)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.empregado
ADD CONSTRAINT fkpa21pt2fde0snqc6p5pbq7gq8 FOREIGN KEY (id_curso)
REFERENCES public.curso (id_curso)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.empregado
ADD CONSTRAINT fkehp4lnc10c9t7mws8x4m2l7va FOREIGN KEY (id_espaco_organizacional)
REFERENCES public.espaco_organizacional (id_espaco_organizacional)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.empregado
ADD CONSTRAINT fkab799qft60n8ovyqmdpu6msff FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa_fisica (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.espaco_geografico
ADD CONSTRAINT fkkkqsenhjpy0kjpd232hxb498r FOREIGN KEY (id_espaco_geografico_pai)
REFERENCES public.espaco_geografico (id_espaco_geografico)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.espaco_organizacional
ADD CONSTRAINT fkmfevwit3ihoyp8xba3p2xo992 FOREIGN KEY (id_espaco_organizacional_pai)
REFERENCES public.espaco_organizacional (id_espaco_organizacional)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.instituicao_ensino
ADD CONSTRAINT fkt0n93ajhfltlf6paqnh8tx2h0 FOREIGN KEY (id_empresa)
REFERENCES public.pessoa_juridica (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.pessoa
ADD CONSTRAINT fkrjook905oak6beufbgtlgbwbq FOREIGN KEY (id_documento)
REFERENCES public.documento (id_documento)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.pessoa
ADD CONSTRAINT fkb2q7p6dh2vtk2yok7h4x9seu5 FOREIGN KEY (id_espaco_geografico)
REFERENCES public.espaco_geografico (id_espaco_geografico)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.pessoa_documento_identificacao
ADD CONSTRAINT fk69fycgc3s8tx52yqhxcmsinj1 FOREIGN KEY (id_espaco_geografico)
REFERENCES public.espaco_geografico (id_espaco_geografico)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.pessoa_documento_identificacao
ADD CONSTRAINT fki43jishragsolnq0r3f1q7pi4 FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.pessoa_fisica
ADD CONSTRAINT fkea9gij1um6foxnlxl0mmp6sgl FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.pessoa_juridica
ADD CONSTRAINT fkj4ky983kqonia200wrcm1n8eb FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.pessoa_telefone
ADD CONSTRAINT fkolionf6sgxcxlofm1m4u9tm8f FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.servidor_publico
ADD CONSTRAINT fkso1nyd0y0y2tuoor0lpbo9678 FOREIGN KEY (id_empregado)
REFERENCES public.empregado (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.terceirizado
ADD CONSTRAINT fkfqv6co66661882fi4e2v4nb0u FOREIGN KEY (id_empregado)
REFERENCES public.empregado (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE public.treinamento
ADD CONSTRAINT fk507aua2wd4p5lunfu6099cnqb FOREIGN KEY (id_empregado)
REFERENCES public.empregado (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE transporte.item_despesa_transporte
ADD CONSTRAINT fk7e7gg50cmrfpkm5elddqmrfuh FOREIGN KEY (id_nota_despesa_transporte)
REFERENCES transporte.nota_despesa_transporte (id_nota_despesa_transporte)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE transporte.item_despesa_transporte
ADD CONSTRAINT fkag75kj97bai8q3rk8hr0n9pdt FOREIGN KEY (id_tipo_despesa_transporte)
REFERENCES transporte.tipo_despesa_transporte (id_tipo_despesa_transporte)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE transporte.modelo
ADD CONSTRAINT fk6g24j4c5kgxvbarylavew9vbj FOREIGN KEY (id_fabricante)
REFERENCES transporte.fabricante (id_fabricante)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE transporte.nota_despesa_transporte
ADD CONSTRAINT fki7vhflo2sjscsmruwrskyxu89 FOREIGN KEY (id_empregado_motorista)
REFERENCES public.empregado (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE transporte.nota_despesa_transporte
ADD CONSTRAINT fkao4jequbg6eqrtg4b9a0ke8j FOREIGN KEY (id_pessoa_juridica)
REFERENCES public.pessoa_juridica (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE transporte.nota_despesa_transporte
ADD CONSTRAINT fkxafk3083igym1sehg4hvlo3d FOREIGN KEY (id_servidor_responsavel)
REFERENCES public.servidor_publico (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE transporte.nota_despesa_transporte
ADD CONSTRAINT fk7com73wtpdlu8v8yh9w4yg2tj FOREIGN KEY (id_veiculo_pessoa_juridica)
REFERENCES transporte.veiculo_pessoa_juridica (id_veiculo)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE transporte.resumo_controle_diario
ADD CONSTRAINT fkj8h4ecnqge3oyfthvifjuwfy6 FOREIGN KEY (id_empregado_motorista)
REFERENCES public.empregado (id_empregado)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE transporte.resumo_controle_diario
ADD CONSTRAINT fk4dnd1ufokxswbfeu3ylfkx1cx FOREIGN KEY (id_veiculo_pessoa_juridica)
REFERENCES transporte.veiculo_pessoa_juridica (id_veiculo)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE transporte.veiculo
ADD CONSTRAINT fkagcoir8ewmck549kmxwhw1771 FOREIGN KEY (id_cor)
REFERENCES public.cor (id_cor)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE transporte.veiculo
ADD CONSTRAINT fke6rho6v2mrugiexqhwuec5hde FOREIGN KEY (id_modelo)
REFERENCES transporte.modelo (id_modelo)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE transporte.veiculo_pessoa_fisica
ADD CONSTRAINT fk2kfl2pmqch4dx2c5ab2h6m55 FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa_fisica (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE transporte.veiculo_pessoa_fisica
ADD CONSTRAINT fkllpi6nw2qvqqp8ppkqj3sy86q FOREIGN KEY (id_veiculo)
REFERENCES transporte.veiculo (id_veiculo)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE transporte.veiculo_pessoa_juridica
ADD CONSTRAINT fkb1te91saosr6xoc3cyl4olglg FOREIGN KEY (id_pessoa)
REFERENCES public.pessoa_juridica (id_pessoa)
ON UPDATE no action
ON DELETE no action
;
ALTER TABLE transporte.veiculo_pessoa_juridica
ADD CONSTRAINT fk3owj04k5r2kj0ialrco42t33r FOREIGN KEY (id_veiculo)
REFERENCES transporte.veiculo (id_veiculo)
ON UPDATE no action
ON DELETE no action
;
