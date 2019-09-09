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

ALTER TABLE agendamento.recurso ADD PRIMARY KEY (id_recurso);
ALTER TABLE agendamento.agendamento ADD PRIMARY KEY (id_agendamento);
ALTER TABLE agendamento.responsavel_recurso ADD PRIMARY KEY (id_responsavel_recurso);
ALTER TABLE agendamento.recurso_agendamento ADD PRIMARY KEY (id_recurso_agendamento);
ALTER TABLE coss.tipo_equipamento ADD PRIMARY KEY (id_tipo_equipamento);
ALTER TABLE coss.tipo_servico ADD PRIMARY KEY (id_tipo_servico);
ALTER TABLE coss.tipo_material ADD PRIMARY KEY (id_tipo_material);
ALTER TABLE coss.movimentacao_tipo_material ADD PRIMARY KEY (id_movimentacao_tipo_material);
ALTER TABLE coss.solicitacao_servico ADD PRIMARY KEY (id_solicitacao_servico);
ALTER TABLE coss.uso_material_solicitacao_servico ADD PRIMARY KEY (id_uso_material_solicitacao_servico);
ALTER TABLE curriculum_vitae.tipo_producao_intelectual ADD PRIMARY KEY (id_tipo_producao_intelectual);
ALTER TABLE curriculum_vitae.producao_intelectual ADD PRIMARY KEY (id_producao_intelectual);
ALTER TABLE curriculum_vitae.producao_intelectual_fonte_recurso ADD PRIMARY KEY (id_producao_intelectual_fonte_recurso);
ALTER TABLE curriculum_vitae.producao_intelectual_participante ADD PRIMARY KEY (id_producao_intelectual_participante);
ALTER TABLE curriculum_vitae.tarefa_producao_intelectual ADD PRIMARY KEY (id_tarefa_producao_intelectual);
ALTER TABLE imunizacao.local_vacinacao ADD PRIMARY KEY (id_local_vacinacao);
ALTER TABLE imunizacao.tipo_vacina ADD PRIMARY KEY (id_tipo_vacina);
ALTER TABLE imunizacao.codigo_vacina ADD PRIMARY KEY (id_codigo_vacina);
ALTER TABLE imunizacao.lote_vacina ADD PRIMARY KEY (id_lote_vacina);
ALTER TABLE imunizacao.caderneta_vacinacao ADD PRIMARY KEY (id_caderneta_vacinacao);
ALTER TABLE imunizacao.vacina ADD PRIMARY KEY (id_vacina);
ALTER TABLE inscricao.cadastro ADD PRIMARY KEY (id_cadastro);
ALTER TABLE inscricao.calendario_inscricao ADD PRIMARY KEY (id_calendario);
ALTER TABLE inscricao.inscricao ADD PRIMARY KEY (id_inscricao);
ALTER TABLE inscricao.certificado ADD PRIMARY KEY (id_certificado);
ALTER TABLE pesquisa.aparelho_coleta ADD PRIMARY KEY (id_aparelho_coleta);
ALTER TABLE pesquisa.exame_taxonomico ADD PRIMARY KEY (id_exame_taxonomico);
ALTER TABLE pesquisa.ser_taxonomico ADD PRIMARY KEY (id_ser_taxonomico);
ALTER TABLE pesquisa.taxonomia ADD PRIMARY KEY (id_taxonomia);
ALTER TABLE pesquisa.tipo_atracao ADD PRIMARY KEY (id_tipo_atracao);
ALTER TABLE pesquisa.tipo_coleta ADD PRIMARY KEY (id_tipo_coleta);
ALTER TABLE pesquisa.classificacao_taxonomica ADD PRIMARY KEY (id_classificacao_taxonomica);
ALTER TABLE pesquisa.boletim_identificacao ADD PRIMARY KEY (id_boletim_identificacao);
ALTER TABLE pesquisa.identificacao_taxonomica ADD PRIMARY KEY (id_identificacao_taxonomica);
ALTER TABLE pesquisa.lote_taxonomico ADD PRIMARY KEY (id_lote_taxonomico);
ALTER TABLE pesquisa.pesquisa_taxonomica ADD PRIMARY KEY (id_pesquisa_taxonomica);
ALTER TABLE pibic.tipo_documento_base_pibic ADD PRIMARY KEY (id_tipo_documento_base_pibic);
ALTER TABLE pibic.calendario_submissao ADD PRIMARY KEY (id_calendario);
ALTER TABLE pibic.tipo_documento_calendario_pibic ADD PRIMARY KEY (id_tipo_documento_calendario_pibic);
ALTER TABLE pibic.orientador ADD PRIMARY KEY (id_orientador);
ALTER TABLE pibic.projeto_pibic ADD PRIMARY KEY (id_projeto);
ALTER TABLE pibic.avaliador_projeto_pibic ADD PRIMARY KEY (id_avaliador_projeto_pibic);
ALTER TABLE pibic.avaliacao_projeto_pibic ADD PRIMARY KEY (id_avaliacao_projeto_pibic);
ALTER TABLE pibic.bolsista_projeto_pibic ADD PRIMARY KEY (id_bolsista_projeto_pibic);
ALTER TABLE pibic.avaliacao_bolsista_pibic ADD PRIMARY KEY (id_avaliacao_bolsista_pibic);
ALTER TABLE pibic.documento_bolsista_pibic ADD PRIMARY KEY (id_documento);
ALTER TABLE pibic.documento_projeto_pibic ADD PRIMARY KEY (id_documento);
ALTER TABLE public.calendario ADD PRIMARY KEY (id_calendario);
ALTER TABLE public.cor ADD PRIMARY KEY (id_cor);
ALTER TABLE public.documento ADD PRIMARY KEY (id_documento);
ALTER TABLE public.espaco_geografico ADD PRIMARY KEY (id_espaco_geografico);
ALTER TABLE public.espaco_organizacional ADD PRIMARY KEY (id_espaco_organizacional);
ALTER TABLE public.fonte_recurso ADD PRIMARY KEY (id_fonte_recurso);
ALTER TABLE public.instituicao_financeira ADD PRIMARY KEY (id_instituicao_financeira);
ALTER TABLE public.projeto ADD PRIMARY KEY (id_projeto);
ALTER TABLE public.unidade_medida ADD PRIMARY KEY (id_unidade_medida);
ALTER TABLE public.arquivo ADD PRIMARY KEY (id_arquivo);
ALTER TABLE public.pessoa ADD PRIMARY KEY (id_pessoa);
ALTER TABLE public.pessoa_documento_identificacao ADD PRIMARY KEY (id_pessoa_documento_identificacao);
ALTER TABLE public.pessoa_fisica ADD PRIMARY KEY (id_pessoa);
ALTER TABLE public.pessoa_juridica ADD PRIMARY KEY (id_pessoa);
ALTER TABLE public.pessoa_telefone ADD PRIMARY KEY (id_pessoa_telefone);
ALTER TABLE public.cargo ADD PRIMARY KEY (id_cargo);
ALTER TABLE public.instituicao_ensino ADD PRIMARY KEY (id_instituicao_ensino);
ALTER TABLE public.curso ADD PRIMARY KEY (id_curso);
ALTER TABLE public.empregado ADD PRIMARY KEY (id_empregado);
ALTER TABLE public.consultor_ad_hoc ADD PRIMARY KEY (id_empregado);
ALTER TABLE public.documento_frequencia ADD PRIMARY KEY (id_documento);
ALTER TABLE public.servidor_publico ADD PRIMARY KEY (id_empregado);
ALTER TABLE public.terceirizado ADD PRIMARY KEY (id_empregado);
ALTER TABLE public.treinamento ADD PRIMARY KEY (id_empregado);
ALTER TABLE public.bolsista ADD PRIMARY KEY (id_empregado);
ALTER TABLE transporte.fabricante ADD PRIMARY KEY (id_fabricante);
ALTER TABLE transporte.relatorio_veiculo_pj_mes ADD PRIMARY KEY (tx_placa);
ALTER TABLE transporte.tipo_despesa_transporte ADD PRIMARY KEY (id_tipo_despesa_transporte);
ALTER TABLE transporte.modelo ADD PRIMARY KEY (id_modelo);
ALTER TABLE transporte.veiculo ADD PRIMARY KEY (id_veiculo);
ALTER TABLE transporte.veiculo_pessoa_fisica ADD PRIMARY KEY (id_veiculo);
ALTER TABLE transporte.veiculo_pessoa_juridica ADD PRIMARY KEY (id_veiculo);
ALTER TABLE transporte.resumo_controle_diario ADD PRIMARY KEY (id_resumo_controle_diario);
ALTER TABLE transporte.nota_despesa_transporte ADD PRIMARY KEY (id_nota_despesa_transporte);
ALTER TABLE transporte.item_despesa_transporte ADD PRIMARY KEY (id_item_despesa_transporte);
