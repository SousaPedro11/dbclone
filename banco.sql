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

CREATE SCHEMA IF NOT EXISTS hospital;
CREATE TABLE IF NOT EXISTS hospital.medico(
id INT AUTO_INCREMENT NOT NULL,
nome VARCHAR (45) NOT NULL,
endereco VARCHAR (45) NOT NULL,
telefone VARCHAR (45) NOT NULL,
crm VARCHAR (45) NOT NULL
);

CREATE TABLE IF NOT EXISTS hospital.paciente(
id INT AUTO_INCREMENT NOT NULL,
nome VARCHAR (45) NOT NULL,
endereco VARCHAR (45) NOT NULL,
telefone VARCHAR (45) NOT NULL,
cpf VARCHAR (45) NOT NULL
);

CREATE TABLE IF NOT EXISTS hospital.secretaria(
id INT AUTO_INCREMENT NOT NULL,
nome VARCHAR (45) NOT NULL,
endereco VARCHAR (45) NOT NULL,
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

CREATE SCHEMA IF NOT EXISTS sys;
CREATE TABLE IF NOT EXISTS sys.sys_config(
variable VARCHAR (128) NOT NULL,
value VARCHAR (128),
set_time TIMESTAMP,
set_by VARCHAR (128)
);

CREATE TABLE IF NOT EXISTS sys.host_summary(
host VARCHAR (255),
statements DECIMAL,
statement_latency TEXT,
statement_avg_latency TEXT,
table_scans DECIMAL,
file_ios DECIMAL,
file_io_latency TEXT,
current_connections DECIMAL,
total_connections DECIMAL,
unique_users BIGINT NOT NULL,
current_memory TEXT,
total_memory_allocated TEXT
);

CREATE TABLE IF NOT EXISTS sys.host_summary_by_file_io(
host VARCHAR (255),
ios DECIMAL,
io_latency TEXT
);

CREATE TABLE IF NOT EXISTS sys.host_summary_by_file_io_type(
host VARCHAR (255),
event_name VARCHAR (128) NOT NULL,
total BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
max_latency TEXT
);

CREATE TABLE IF NOT EXISTS sys.host_summary_by_stages(
host VARCHAR (255),
event_name VARCHAR (128) NOT NULL,
total BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
avg_latency TEXT
);

CREATE TABLE IF NOT EXISTS sys.host_summary_by_statement_latency(
host VARCHAR (255),
total DECIMAL,
total_latency TEXT,
max_latency TEXT,
lock_latency TEXT,
rows_sent DECIMAL,
rows_examined DECIMAL,
rows_affected DECIMAL,
full_scans DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.host_summary_by_statement_type(
host VARCHAR (255),
statement VARCHAR (128),
total BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
max_latency TEXT,
lock_latency TEXT,
rows_sent BIGINT UNSIGNED NOT NULL,
rows_examined BIGINT UNSIGNED NOT NULL,
rows_affected BIGINT UNSIGNED NOT NULL,
full_scans BIGINT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.innodb_buffer_stats_by_schema(
object_schema TEXT,
allocated TEXT,
data TEXT,
pages BIGINT NOT NULL,
pages_hashed BIGINT NOT NULL,
pages_old BIGINT NOT NULL,
rows_cached DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.innodb_buffer_stats_by_table(
object_schema TEXT,
object_name TEXT,
allocated TEXT,
data TEXT,
pages BIGINT NOT NULL,
pages_hashed BIGINT NOT NULL,
pages_old BIGINT NOT NULL,
rows_cached DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.innodb_lock_waits(
wait_started DATETIME,
wait_age TIME,
wait_age_secs BIGINT,
locked_table MEDIUMTEXT,
locked_table_schema VARCHAR (64),
locked_table_name VARCHAR (64),
locked_table_partition VARCHAR (64),
locked_table_subpartition VARCHAR (64),
locked_index VARCHAR (64),
locked_type VARCHAR (32) NOT NULL,
waiting_trx_id VARCHAR (18) NOT NULL,
waiting_trx_started DATETIME NOT NULL,
waiting_trx_age TIME,
waiting_trx_rows_locked BIGINT UNSIGNED NOT NULL,
waiting_trx_rows_modified BIGINT UNSIGNED NOT NULL,
waiting_pid BIGINT UNSIGNED NOT NULL,
waiting_query LONGTEXT,
waiting_lock_id VARCHAR (128) NOT NULL,
waiting_lock_mode VARCHAR (32) NOT NULL,
blocking_trx_id VARCHAR (18) NOT NULL,
blocking_pid BIGINT UNSIGNED NOT NULL,
blocking_query LONGTEXT,
blocking_lock_id VARCHAR (128) NOT NULL,
blocking_lock_mode VARCHAR (32) NOT NULL,
blocking_trx_started DATETIME NOT NULL,
blocking_trx_age TIME,
blocking_trx_rows_locked BIGINT UNSIGNED NOT NULL,
blocking_trx_rows_modified BIGINT UNSIGNED NOT NULL,
sql_kill_blocking_query VARCHAR (32),
sql_kill_blocking_connection VARCHAR (26)
);

CREATE TABLE IF NOT EXISTS sys.io_by_thread_by_latency(
user VARCHAR (288),
total DECIMAL,
total_latency TEXT,
min_latency TEXT,
avg_latency TEXT,
max_latency TEXT,
thread_id BIGINT UNSIGNED NOT NULL,
processlist_id BIGINT UNSIGNED
);

CREATE TABLE IF NOT EXISTS sys.io_global_by_file_by_bytes(
file VARCHAR (512),
count_read BIGINT UNSIGNED NOT NULL,
total_read TEXT,
avg_read TEXT,
count_write BIGINT UNSIGNED NOT NULL,
total_written TEXT,
avg_write TEXT,
total TEXT,
write_pct DECIMAL NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.io_global_by_file_by_latency(
file VARCHAR (512),
total BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
count_read BIGINT UNSIGNED NOT NULL,
read_latency TEXT,
count_write BIGINT UNSIGNED NOT NULL,
write_latency TEXT,
count_misc BIGINT UNSIGNED NOT NULL,
misc_latency TEXT
);

CREATE TABLE IF NOT EXISTS sys.io_global_by_wait_by_bytes(
event_name VARCHAR (128),
total BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
min_latency TEXT,
avg_latency TEXT,
max_latency TEXT,
count_read BIGINT UNSIGNED NOT NULL,
total_read TEXT,
avg_read TEXT,
count_write BIGINT UNSIGNED NOT NULL,
total_written TEXT,
avg_written TEXT,
total_requested TEXT
);

CREATE TABLE IF NOT EXISTS sys.io_global_by_wait_by_latency(
event_name VARCHAR (128),
total BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
avg_latency TEXT,
max_latency TEXT,
read_latency TEXT,
write_latency TEXT,
misc_latency TEXT,
count_read BIGINT UNSIGNED NOT NULL,
total_read TEXT,
avg_read TEXT,
count_write BIGINT UNSIGNED NOT NULL,
total_written TEXT,
avg_written TEXT
);

CREATE TABLE IF NOT EXISTS sys.latest_file_io(
thread VARCHAR (316),
file VARCHAR (512),
latency TEXT,
operation VARCHAR (32) NOT NULL,
requested TEXT
);

CREATE TABLE IF NOT EXISTS sys.memory_by_host_by_current_bytes(
host VARCHAR (255),
current_count_used DECIMAL,
current_allocated TEXT,
current_avg_alloc TEXT,
current_max_alloc TEXT,
total_allocated TEXT
);

CREATE TABLE IF NOT EXISTS sys.memory_by_thread_by_current_bytes(
thread_id BIGINT UNSIGNED NOT NULL,
user VARCHAR (288),
current_count_used DECIMAL,
current_allocated TEXT,
current_avg_alloc TEXT,
current_max_alloc TEXT,
total_allocated TEXT
);

CREATE TABLE IF NOT EXISTS sys.memory_by_user_by_current_bytes(
user VARCHAR (32),
current_count_used DECIMAL,
current_allocated TEXT,
current_avg_alloc TEXT,
current_max_alloc TEXT,
total_allocated TEXT
);

CREATE TABLE IF NOT EXISTS sys.memory_global_by_current_bytes(
event_name VARCHAR (128) NOT NULL,
current_count BIGINT NOT NULL,
current_alloc TEXT,
current_avg_alloc TEXT,
high_count BIGINT NOT NULL,
high_alloc TEXT,
high_avg_alloc TEXT
);

CREATE TABLE IF NOT EXISTS sys.memory_global_total(
total_allocated TEXT
);

CREATE TABLE IF NOT EXISTS sys.metrics(
Variable_name VARCHAR (64),
Variable_value VARCHAR (1024),
Type VARCHAR (13) NOT NULL,
Enabled VARCHAR (3) NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.processlist(
thd_id BIGINT UNSIGNED NOT NULL,
conn_id BIGINT UNSIGNED,
user VARCHAR (288),
db VARCHAR (64),
command VARCHAR (16),
state VARCHAR (64),
time BIGINT,
current_statement LONGTEXT,
statement_latency TEXT,
progress DECIMAL,
lock_latency TEXT,
rows_examined BIGINT UNSIGNED,
rows_sent BIGINT UNSIGNED,
rows_affected BIGINT UNSIGNED,
tmp_tables BIGINT UNSIGNED,
tmp_disk_tables BIGINT UNSIGNED,
full_scan VARCHAR (3) NOT NULL,
last_statement LONGTEXT,
last_statement_latency TEXT,
current_memory TEXT,
last_wait VARCHAR (128),
last_wait_latency TEXT,
source VARCHAR (64),
trx_latency TEXT,
trx_state ENUM,
trx_autocommit ENUM,
pid VARCHAR (1024),
program_name VARCHAR (1024)
);

CREATE TABLE IF NOT EXISTS sys.ps_check_lost_instrumentation(
variable_name VARCHAR (64) NOT NULL,
variable_value VARCHAR (1024)
);

CREATE TABLE IF NOT EXISTS sys.schema_auto_increment_columns(
table_schema VARCHAR (64) NOT NULL,
table_name VARCHAR (64) NOT NULL,
column_name VARCHAR (64),
data_type LONGTEXT,
column_type MEDIUMTEXT NOT NULL,
is_signed INT NOT NULL,
is_unsigned INT NOT NULL,
max_value BIGINT UNSIGNED,
auto_increment BIGINT UNSIGNED,
auto_increment_ratio sys."DECIMAL UNSIGNED"
);

CREATE TABLE IF NOT EXISTS sys.schema_index_statistics(
table_schema VARCHAR (64),
table_name VARCHAR (64),
index_name VARCHAR (64),
rows_selected BIGINT UNSIGNED NOT NULL,
select_latency TEXT,
rows_inserted BIGINT UNSIGNED NOT NULL,
insert_latency TEXT,
rows_updated BIGINT UNSIGNED NOT NULL,
update_latency TEXT,
rows_deleted BIGINT UNSIGNED NOT NULL,
delete_latency TEXT
);

CREATE TABLE IF NOT EXISTS sys.schema_object_overview(
db VARCHAR (64) NOT NULL,
object_type ENUM NOT NULL,
count BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.schema_redundant_indexes(
table_schema VARCHAR (64) NOT NULL,
table_name VARCHAR (64) NOT NULL,
redundant_index_name VARCHAR (64),
redundant_index_columns TEXT,
redundant_index_non_unique INT,
dominant_index_name VARCHAR (64),
dominant_index_columns TEXT,
dominant_index_non_unique INT,
subpart_exists INT NOT NULL,
sql_drop_index VARCHAR (223)
);

CREATE TABLE IF NOT EXISTS sys.schema_table_lock_waits(
object_schema VARCHAR (64),
object_name VARCHAR (64),
waiting_thread_id BIGINT UNSIGNED NOT NULL,
waiting_pid BIGINT UNSIGNED,
waiting_account TEXT,
waiting_lock_type VARCHAR (32) NOT NULL,
waiting_lock_duration VARCHAR (32) NOT NULL,
waiting_query LONGTEXT,
waiting_query_secs BIGINT,
waiting_query_rows_affected BIGINT UNSIGNED,
waiting_query_rows_examined BIGINT UNSIGNED,
blocking_thread_id BIGINT UNSIGNED NOT NULL,
blocking_pid BIGINT UNSIGNED,
blocking_account TEXT,
blocking_lock_type VARCHAR (32) NOT NULL,
blocking_lock_duration VARCHAR (32) NOT NULL,
sql_kill_blocking_query VARCHAR (31),
sql_kill_blocking_connection VARCHAR (25)
);

CREATE TABLE IF NOT EXISTS sys.schema_table_statistics(
table_schema VARCHAR (64),
table_name VARCHAR (64),
total_latency TEXT,
rows_fetched BIGINT UNSIGNED NOT NULL,
fetch_latency TEXT,
rows_inserted BIGINT UNSIGNED NOT NULL,
insert_latency TEXT,
rows_updated BIGINT UNSIGNED NOT NULL,
update_latency TEXT,
rows_deleted BIGINT UNSIGNED NOT NULL,
delete_latency TEXT,
io_read_requests DECIMAL,
io_read TEXT,
io_read_latency TEXT,
io_write_requests DECIMAL,
io_write TEXT,
io_write_latency TEXT,
io_misc_requests DECIMAL,
io_misc_latency TEXT
);

CREATE TABLE IF NOT EXISTS sys.schema_table_statistics_with_buffer(
table_schema VARCHAR (64),
table_name VARCHAR (64),
rows_fetched BIGINT UNSIGNED NOT NULL,
fetch_latency TEXT,
rows_inserted BIGINT UNSIGNED NOT NULL,
insert_latency TEXT,
rows_updated BIGINT UNSIGNED NOT NULL,
update_latency TEXT,
rows_deleted BIGINT UNSIGNED NOT NULL,
delete_latency TEXT,
io_read_requests DECIMAL,
io_read TEXT,
io_read_latency TEXT,
io_write_requests DECIMAL,
io_write TEXT,
io_write_latency TEXT,
io_misc_requests DECIMAL,
io_misc_latency TEXT,
innodb_buffer_allocated TEXT,
innodb_buffer_data TEXT,
innodb_buffer_free TEXT,
innodb_buffer_pages BIGINT,
innodb_buffer_pages_hashed BIGINT,
innodb_buffer_pages_old BIGINT,
innodb_buffer_rows_cached DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.schema_tables_with_full_table_scans(
object_schema VARCHAR (64),
object_name VARCHAR (64),
rows_full_scanned BIGINT UNSIGNED NOT NULL,
latency TEXT
);

CREATE TABLE IF NOT EXISTS sys.schema_unused_indexes(
object_schema VARCHAR (64),
object_name VARCHAR (64),
index_name VARCHAR (64)
);

CREATE TABLE IF NOT EXISTS sys.session(
thd_id BIGINT UNSIGNED NOT NULL,
conn_id BIGINT UNSIGNED,
user VARCHAR (288),
db VARCHAR (64),
command VARCHAR (16),
state VARCHAR (64),
time BIGINT,
current_statement LONGTEXT,
statement_latency TEXT,
progress DECIMAL,
lock_latency TEXT,
rows_examined BIGINT UNSIGNED,
rows_sent BIGINT UNSIGNED,
rows_affected BIGINT UNSIGNED,
tmp_tables BIGINT UNSIGNED,
tmp_disk_tables BIGINT UNSIGNED,
full_scan VARCHAR (3) NOT NULL,
last_statement LONGTEXT,
last_statement_latency TEXT,
current_memory TEXT,
last_wait VARCHAR (128),
last_wait_latency TEXT,
source VARCHAR (64),
trx_latency TEXT,
trx_state ENUM,
trx_autocommit ENUM,
pid VARCHAR (1024),
program_name VARCHAR (1024)
);

CREATE TABLE IF NOT EXISTS sys.session_ssl_status(
thread_id BIGINT UNSIGNED NOT NULL,
ssl_version VARCHAR (1024),
ssl_cipher VARCHAR (1024),
ssl_sessions_reused VARCHAR (1024)
);

CREATE TABLE IF NOT EXISTS sys.statement_analysis(
query LONGTEXT,
db VARCHAR (64),
full_scan VARCHAR (1) NOT NULL,
exec_count BIGINT UNSIGNED NOT NULL,
err_count BIGINT UNSIGNED NOT NULL,
warn_count BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
max_latency TEXT,
avg_latency TEXT,
lock_latency TEXT,
rows_sent BIGINT UNSIGNED NOT NULL,
rows_sent_avg DECIMAL NOT NULL,
rows_examined BIGINT UNSIGNED NOT NULL,
rows_examined_avg DECIMAL NOT NULL,
rows_affected BIGINT UNSIGNED NOT NULL,
rows_affected_avg DECIMAL NOT NULL,
tmp_tables BIGINT UNSIGNED NOT NULL,
tmp_disk_tables BIGINT UNSIGNED NOT NULL,
rows_sorted BIGINT UNSIGNED NOT NULL,
sort_merge_passes BIGINT UNSIGNED NOT NULL,
digest VARCHAR (64),
first_seen TIMESTAMP NOT NULL,
last_seen TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.statements_with_errors_or_warnings(
query LONGTEXT,
db VARCHAR (64),
exec_count BIGINT UNSIGNED NOT NULL,
errors BIGINT UNSIGNED NOT NULL,
error_pct DECIMAL NOT NULL,
warnings BIGINT UNSIGNED NOT NULL,
warning_pct DECIMAL NOT NULL,
first_seen TIMESTAMP NOT NULL,
last_seen TIMESTAMP NOT NULL,
digest VARCHAR (64)
);

CREATE TABLE IF NOT EXISTS sys.statements_with_full_table_scans(
query LONGTEXT,
db VARCHAR (64),
exec_count BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
no_index_used_count BIGINT UNSIGNED NOT NULL,
no_good_index_used_count BIGINT UNSIGNED NOT NULL,
no_index_used_pct DECIMAL NOT NULL,
rows_sent BIGINT UNSIGNED NOT NULL,
rows_examined BIGINT UNSIGNED NOT NULL,
rows_sent_avg sys."DECIMAL UNSIGNED",
rows_examined_avg sys."DECIMAL UNSIGNED",
first_seen TIMESTAMP NOT NULL,
last_seen TIMESTAMP NOT NULL,
digest VARCHAR (64)
);

CREATE TABLE IF NOT EXISTS sys.statements_with_runtimes_in_95th_percentile(
query LONGTEXT,
db VARCHAR (64),
full_scan VARCHAR (1) NOT NULL,
exec_count BIGINT UNSIGNED NOT NULL,
err_count BIGINT UNSIGNED NOT NULL,
warn_count BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
max_latency TEXT,
avg_latency TEXT,
rows_sent BIGINT UNSIGNED NOT NULL,
rows_sent_avg DECIMAL NOT NULL,
rows_examined BIGINT UNSIGNED NOT NULL,
rows_examined_avg DECIMAL NOT NULL,
first_seen TIMESTAMP NOT NULL,
last_seen TIMESTAMP NOT NULL,
digest VARCHAR (64)
);

CREATE TABLE IF NOT EXISTS sys.statements_with_sorting(
query LONGTEXT,
db VARCHAR (64),
exec_count BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
sort_merge_passes BIGINT UNSIGNED NOT NULL,
avg_sort_merges DECIMAL NOT NULL,
sorts_using_scans BIGINT UNSIGNED NOT NULL,
sort_using_range BIGINT UNSIGNED NOT NULL,
rows_sorted BIGINT UNSIGNED NOT NULL,
avg_rows_sorted DECIMAL NOT NULL,
first_seen TIMESTAMP NOT NULL,
last_seen TIMESTAMP NOT NULL,
digest VARCHAR (64)
);

CREATE TABLE IF NOT EXISTS sys.statements_with_temp_tables(
query LONGTEXT,
db VARCHAR (64),
exec_count BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
memory_tmp_tables BIGINT UNSIGNED NOT NULL,
disk_tmp_tables BIGINT UNSIGNED NOT NULL,
avg_tmp_tables_per_query DECIMAL NOT NULL,
tmp_tables_to_disk_pct DECIMAL NOT NULL,
first_seen TIMESTAMP NOT NULL,
last_seen TIMESTAMP NOT NULL,
digest VARCHAR (64)
);

CREATE TABLE IF NOT EXISTS sys.user_summary(
user VARCHAR (32),
statements DECIMAL,
statement_latency TEXT,
statement_avg_latency TEXT,
table_scans DECIMAL,
file_ios DECIMAL,
file_io_latency TEXT,
current_connections DECIMAL,
total_connections DECIMAL,
unique_hosts BIGINT NOT NULL,
current_memory TEXT,
total_memory_allocated TEXT
);

CREATE TABLE IF NOT EXISTS sys.user_summary_by_file_io(
user VARCHAR (32),
ios DECIMAL,
io_latency TEXT
);

CREATE TABLE IF NOT EXISTS sys.user_summary_by_file_io_type(
user VARCHAR (32),
event_name VARCHAR (128) NOT NULL,
total BIGINT UNSIGNED NOT NULL,
latency TEXT,
max_latency TEXT
);

CREATE TABLE IF NOT EXISTS sys.user_summary_by_stages(
user VARCHAR (32),
event_name VARCHAR (128) NOT NULL,
total BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
avg_latency TEXT
);

CREATE TABLE IF NOT EXISTS sys.user_summary_by_statement_latency(
user VARCHAR (32),
total DECIMAL,
total_latency TEXT,
max_latency TEXT,
lock_latency TEXT,
rows_sent DECIMAL,
rows_examined DECIMAL,
rows_affected DECIMAL,
full_scans DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.user_summary_by_statement_type(
user VARCHAR (32),
statement VARCHAR (128),
total BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
max_latency TEXT,
lock_latency TEXT,
rows_sent BIGINT UNSIGNED NOT NULL,
rows_examined BIGINT UNSIGNED NOT NULL,
rows_affected BIGINT UNSIGNED NOT NULL,
full_scans BIGINT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.version(
sys_version VARCHAR (5) NOT NULL,
mysql_version VARCHAR (6) NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.wait_classes_global_by_avg_latency(
event_class VARCHAR (128),
total DECIMAL,
total_latency TEXT,
min_latency TEXT,
avg_latency TEXT,
max_latency TEXT
);

CREATE TABLE IF NOT EXISTS sys.wait_classes_global_by_latency(
event_class VARCHAR (128),
total DECIMAL,
total_latency TEXT,
min_latency TEXT,
avg_latency TEXT,
max_latency TEXT
);

CREATE TABLE IF NOT EXISTS sys.waits_by_host_by_latency(
host VARCHAR (255),
event VARCHAR (128) NOT NULL,
total BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
avg_latency TEXT,
max_latency TEXT
);

CREATE TABLE IF NOT EXISTS sys.waits_by_user_by_latency(
user VARCHAR (32),
event VARCHAR (128) NOT NULL,
total BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
avg_latency TEXT,
max_latency TEXT
);

CREATE TABLE IF NOT EXISTS sys.waits_global_by_latency(
events VARCHAR (128) NOT NULL,
total BIGINT UNSIGNED NOT NULL,
total_latency TEXT,
avg_latency TEXT,
max_latency TEXT
);

CREATE TABLE IF NOT EXISTS sys.x$host_summary(
host VARCHAR (255),
statements DECIMAL,
statement_latency DECIMAL,
statement_avg_latency DECIMAL,
table_scans DECIMAL,
file_ios DECIMAL,
file_io_latency DECIMAL,
current_connections DECIMAL,
total_connections DECIMAL,
unique_users BIGINT NOT NULL,
current_memory DECIMAL,
total_memory_allocated DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.x$host_summary_by_file_io(
host VARCHAR (255),
ios DECIMAL,
io_latency DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.x$host_summary_by_file_io_type(
host VARCHAR (255),
event_name VARCHAR (128) NOT NULL,
total BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
max_latency BIGINT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$host_summary_by_stages(
host VARCHAR (255),
event_name VARCHAR (128) NOT NULL,
total BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
avg_latency BIGINT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$host_summary_by_statement_latency(
host VARCHAR (255),
total DECIMAL,
total_latency DECIMAL,
max_latency BIGINT UNSIGNED,
lock_latency DECIMAL,
rows_sent DECIMAL,
rows_examined DECIMAL,
rows_affected DECIMAL,
full_scans DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.x$host_summary_by_statement_type(
host VARCHAR (255),
statement VARCHAR (128),
total BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
max_latency BIGINT UNSIGNED NOT NULL,
lock_latency BIGINT UNSIGNED NOT NULL,
rows_sent BIGINT UNSIGNED NOT NULL,
rows_examined BIGINT UNSIGNED NOT NULL,
rows_affected BIGINT UNSIGNED NOT NULL,
full_scans BIGINT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$innodb_buffer_stats_by_schema(
object_schema TEXT,
allocated DECIMAL,
data DECIMAL,
pages BIGINT NOT NULL,
pages_hashed BIGINT NOT NULL,
pages_old BIGINT NOT NULL,
rows_cached DECIMAL NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$innodb_buffer_stats_by_table(
object_schema TEXT,
object_name TEXT,
allocated DECIMAL,
data DECIMAL,
pages BIGINT NOT NULL,
pages_hashed BIGINT NOT NULL,
pages_old BIGINT NOT NULL,
rows_cached DECIMAL NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$innodb_lock_waits(
wait_started DATETIME,
wait_age TIME,
wait_age_secs BIGINT,
locked_table MEDIUMTEXT,
locked_table_schema VARCHAR (64),
locked_table_name VARCHAR (64),
locked_table_partition VARCHAR (64),
locked_table_subpartition VARCHAR (64),
locked_index VARCHAR (64),
locked_type VARCHAR (32) NOT NULL,
waiting_trx_id VARCHAR (18) NOT NULL,
waiting_trx_started DATETIME NOT NULL,
waiting_trx_age TIME,
waiting_trx_rows_locked BIGINT UNSIGNED NOT NULL,
waiting_trx_rows_modified BIGINT UNSIGNED NOT NULL,
waiting_pid BIGINT UNSIGNED NOT NULL,
waiting_query VARCHAR (1024),
waiting_lock_id VARCHAR (128) NOT NULL,
waiting_lock_mode VARCHAR (32) NOT NULL,
blocking_trx_id VARCHAR (18) NOT NULL,
blocking_pid BIGINT UNSIGNED NOT NULL,
blocking_query VARCHAR (1024),
blocking_lock_id VARCHAR (128) NOT NULL,
blocking_lock_mode VARCHAR (32) NOT NULL,
blocking_trx_started DATETIME NOT NULL,
blocking_trx_age TIME,
blocking_trx_rows_locked BIGINT UNSIGNED NOT NULL,
blocking_trx_rows_modified BIGINT UNSIGNED NOT NULL,
sql_kill_blocking_query VARCHAR (32),
sql_kill_blocking_connection VARCHAR (26)
);

CREATE TABLE IF NOT EXISTS sys.x$io_by_thread_by_latency(
user VARCHAR (288),
total DECIMAL,
total_latency DECIMAL,
min_latency BIGINT UNSIGNED,
avg_latency DECIMAL,
max_latency BIGINT UNSIGNED,
thread_id BIGINT UNSIGNED NOT NULL,
processlist_id BIGINT UNSIGNED
);

CREATE TABLE IF NOT EXISTS sys.x$io_global_by_file_by_bytes(
file VARCHAR (512) NOT NULL,
count_read BIGINT UNSIGNED NOT NULL,
total_read BIGINT NOT NULL,
avg_read DECIMAL NOT NULL,
count_write BIGINT UNSIGNED NOT NULL,
total_written BIGINT NOT NULL,
avg_write DECIMAL NOT NULL,
total BIGINT NOT NULL,
write_pct DECIMAL NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$io_global_by_file_by_latency(
file VARCHAR (512) NOT NULL,
total BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
count_read BIGINT UNSIGNED NOT NULL,
read_latency BIGINT UNSIGNED NOT NULL,
count_write BIGINT UNSIGNED NOT NULL,
write_latency BIGINT UNSIGNED NOT NULL,
count_misc BIGINT UNSIGNED NOT NULL,
misc_latency BIGINT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$io_global_by_wait_by_bytes(
event_name VARCHAR (128),
total BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
min_latency BIGINT UNSIGNED NOT NULL,
avg_latency BIGINT UNSIGNED NOT NULL,
max_latency BIGINT UNSIGNED NOT NULL,
count_read BIGINT UNSIGNED NOT NULL,
total_read BIGINT NOT NULL,
avg_read DECIMAL NOT NULL,
count_write BIGINT UNSIGNED NOT NULL,
total_written BIGINT NOT NULL,
avg_written DECIMAL NOT NULL,
total_requested BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$io_global_by_wait_by_latency(
event_name VARCHAR (128),
total BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
avg_latency BIGINT UNSIGNED NOT NULL,
max_latency BIGINT UNSIGNED NOT NULL,
read_latency BIGINT UNSIGNED NOT NULL,
write_latency BIGINT UNSIGNED NOT NULL,
misc_latency BIGINT UNSIGNED NOT NULL,
count_read BIGINT UNSIGNED NOT NULL,
total_read BIGINT NOT NULL,
avg_read DECIMAL NOT NULL,
count_write BIGINT UNSIGNED NOT NULL,
total_written BIGINT NOT NULL,
avg_written DECIMAL NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$latest_file_io(
thread VARCHAR (316),
file VARCHAR (512),
latency BIGINT UNSIGNED,
operation VARCHAR (32) NOT NULL,
requested BIGINT
);

CREATE TABLE IF NOT EXISTS sys.x$memory_by_host_by_current_bytes(
host VARCHAR (255),
current_count_used DECIMAL,
current_allocated DECIMAL,
current_avg_alloc DECIMAL NOT NULL,
current_max_alloc BIGINT,
total_allocated DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.x$memory_by_thread_by_current_bytes(
thread_id BIGINT UNSIGNED NOT NULL,
user VARCHAR (288),
current_count_used DECIMAL,
current_allocated DECIMAL,
current_avg_alloc DECIMAL NOT NULL,
current_max_alloc BIGINT,
total_allocated DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.x$memory_by_user_by_current_bytes(
user VARCHAR (32),
current_count_used DECIMAL,
current_allocated DECIMAL,
current_avg_alloc DECIMAL NOT NULL,
current_max_alloc BIGINT,
total_allocated DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.x$memory_global_by_current_bytes(
event_name VARCHAR (128) NOT NULL,
current_count BIGINT NOT NULL,
current_alloc BIGINT NOT NULL,
current_avg_alloc DECIMAL NOT NULL,
high_count BIGINT NOT NULL,
high_alloc BIGINT NOT NULL,
high_avg_alloc DECIMAL NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$memory_global_total(
total_allocated DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.x$processlist(
thd_id BIGINT UNSIGNED NOT NULL,
conn_id BIGINT UNSIGNED,
user VARCHAR (288),
db VARCHAR (64),
command VARCHAR (16),
state VARCHAR (64),
time BIGINT,
current_statement LONGTEXT,
statement_latency BIGINT UNSIGNED,
progress DECIMAL,
lock_latency BIGINT UNSIGNED,
rows_examined BIGINT UNSIGNED,
rows_sent BIGINT UNSIGNED,
rows_affected BIGINT UNSIGNED,
tmp_tables BIGINT UNSIGNED,
tmp_disk_tables BIGINT UNSIGNED,
full_scan VARCHAR (3) NOT NULL,
last_statement LONGTEXT,
last_statement_latency BIGINT UNSIGNED,
current_memory DECIMAL,
last_wait VARCHAR (128),
last_wait_latency VARCHAR (20),
source VARCHAR (64),
trx_latency BIGINT UNSIGNED,
trx_state ENUM,
trx_autocommit ENUM,
pid VARCHAR (1024),
program_name VARCHAR (1024)
);

CREATE TABLE IF NOT EXISTS sys.x$ps_digest_95th_percentile_by_avg_us(
avg_us DECIMAL,
percentile DECIMAL NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$ps_digest_avg_latency_distribution(
cnt BIGINT NOT NULL,
avg_us DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.x$ps_schema_table_statistics_io(
table_schema VARCHAR (64),
table_name VARCHAR (64),
count_read DECIMAL,
sum_number_of_bytes_read DECIMAL,
sum_timer_read DECIMAL,
count_write DECIMAL,
sum_number_of_bytes_write DECIMAL,
sum_timer_write DECIMAL,
count_misc DECIMAL,
sum_timer_misc DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.x$schema_flattened_keys(
table_schema VARCHAR (64) NOT NULL,
table_name VARCHAR (64) NOT NULL,
index_name VARCHAR (64),
non_unique INT,
subpart_exists BIGINT,
index_columns TEXT
);

CREATE TABLE IF NOT EXISTS sys.x$schema_index_statistics(
table_schema VARCHAR (64),
table_name VARCHAR (64),
index_name VARCHAR (64),
rows_selected BIGINT UNSIGNED NOT NULL,
select_latency BIGINT UNSIGNED NOT NULL,
rows_inserted BIGINT UNSIGNED NOT NULL,
insert_latency BIGINT UNSIGNED NOT NULL,
rows_updated BIGINT UNSIGNED NOT NULL,
update_latency BIGINT UNSIGNED NOT NULL,
rows_deleted BIGINT UNSIGNED NOT NULL,
delete_latency BIGINT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$schema_table_lock_waits(
object_schema VARCHAR (64),
object_name VARCHAR (64),
waiting_thread_id BIGINT UNSIGNED NOT NULL,
waiting_pid BIGINT UNSIGNED,
waiting_account TEXT,
waiting_lock_type VARCHAR (32) NOT NULL,
waiting_lock_duration VARCHAR (32) NOT NULL,
waiting_query LONGTEXT,
waiting_query_secs BIGINT,
waiting_query_rows_affected BIGINT UNSIGNED,
waiting_query_rows_examined BIGINT UNSIGNED,
blocking_thread_id BIGINT UNSIGNED NOT NULL,
blocking_pid BIGINT UNSIGNED,
blocking_account TEXT,
blocking_lock_type VARCHAR (32) NOT NULL,
blocking_lock_duration VARCHAR (32) NOT NULL,
sql_kill_blocking_query VARCHAR (31),
sql_kill_blocking_connection VARCHAR (25)
);

CREATE TABLE IF NOT EXISTS sys.x$schema_table_statistics(
table_schema VARCHAR (64),
table_name VARCHAR (64),
total_latency BIGINT UNSIGNED NOT NULL,
rows_fetched BIGINT UNSIGNED NOT NULL,
fetch_latency BIGINT UNSIGNED NOT NULL,
rows_inserted BIGINT UNSIGNED NOT NULL,
insert_latency BIGINT UNSIGNED NOT NULL,
rows_updated BIGINT UNSIGNED NOT NULL,
update_latency BIGINT UNSIGNED NOT NULL,
rows_deleted BIGINT UNSIGNED NOT NULL,
delete_latency BIGINT UNSIGNED NOT NULL,
io_read_requests DECIMAL,
io_read DECIMAL,
io_read_latency DECIMAL,
io_write_requests DECIMAL,
io_write DECIMAL,
io_write_latency DECIMAL,
io_misc_requests DECIMAL,
io_misc_latency DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.x$schema_table_statistics_with_buffer(
table_schema VARCHAR (64),
table_name VARCHAR (64),
rows_fetched BIGINT UNSIGNED NOT NULL,
fetch_latency BIGINT UNSIGNED NOT NULL,
rows_inserted BIGINT UNSIGNED NOT NULL,
insert_latency BIGINT UNSIGNED NOT NULL,
rows_updated BIGINT UNSIGNED NOT NULL,
update_latency BIGINT UNSIGNED NOT NULL,
rows_deleted BIGINT UNSIGNED NOT NULL,
delete_latency BIGINT UNSIGNED NOT NULL,
io_read_requests DECIMAL,
io_read DECIMAL,
io_read_latency DECIMAL,
io_write_requests DECIMAL,
io_write DECIMAL,
io_write_latency DECIMAL,
io_misc_requests DECIMAL,
io_misc_latency DECIMAL,
innodb_buffer_allocated DECIMAL,
innodb_buffer_data DECIMAL,
innodb_buffer_free DECIMAL,
innodb_buffer_pages BIGINT,
innodb_buffer_pages_hashed BIGINT,
innodb_buffer_pages_old BIGINT,
innodb_buffer_rows_cached DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.x$schema_tables_with_full_table_scans(
object_schema VARCHAR (64),
object_name VARCHAR (64),
rows_full_scanned BIGINT UNSIGNED NOT NULL,
latency BIGINT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$session(
thd_id BIGINT UNSIGNED NOT NULL,
conn_id BIGINT UNSIGNED,
user VARCHAR (288),
db VARCHAR (64),
command VARCHAR (16),
state VARCHAR (64),
time BIGINT,
current_statement LONGTEXT,
statement_latency BIGINT UNSIGNED,
progress DECIMAL,
lock_latency BIGINT UNSIGNED,
rows_examined BIGINT UNSIGNED,
rows_sent BIGINT UNSIGNED,
rows_affected BIGINT UNSIGNED,
tmp_tables BIGINT UNSIGNED,
tmp_disk_tables BIGINT UNSIGNED,
full_scan VARCHAR (3) NOT NULL,
last_statement LONGTEXT,
last_statement_latency BIGINT UNSIGNED,
current_memory DECIMAL,
last_wait VARCHAR (128),
last_wait_latency VARCHAR (20),
source VARCHAR (64),
trx_latency BIGINT UNSIGNED,
trx_state ENUM,
trx_autocommit ENUM,
pid VARCHAR (1024),
program_name VARCHAR (1024)
);

CREATE TABLE IF NOT EXISTS sys.x$statement_analysis(
query LONGTEXT,
db VARCHAR (64),
full_scan VARCHAR (1) NOT NULL,
exec_count BIGINT UNSIGNED NOT NULL,
err_count BIGINT UNSIGNED NOT NULL,
warn_count BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
max_latency BIGINT UNSIGNED NOT NULL,
avg_latency BIGINT UNSIGNED NOT NULL,
lock_latency BIGINT UNSIGNED NOT NULL,
rows_sent BIGINT UNSIGNED NOT NULL,
rows_sent_avg DECIMAL NOT NULL,
rows_examined BIGINT UNSIGNED NOT NULL,
rows_examined_avg DECIMAL NOT NULL,
rows_affected BIGINT UNSIGNED NOT NULL,
rows_affected_avg DECIMAL NOT NULL,
tmp_tables BIGINT UNSIGNED NOT NULL,
tmp_disk_tables BIGINT UNSIGNED NOT NULL,
rows_sorted BIGINT UNSIGNED NOT NULL,
sort_merge_passes BIGINT UNSIGNED NOT NULL,
digest VARCHAR (64),
first_seen TIMESTAMP NOT NULL,
last_seen TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$statements_with_errors_or_warnings(
query LONGTEXT,
db VARCHAR (64),
exec_count BIGINT UNSIGNED NOT NULL,
errors BIGINT UNSIGNED NOT NULL,
error_pct DECIMAL NOT NULL,
warnings BIGINT UNSIGNED NOT NULL,
warning_pct DECIMAL NOT NULL,
first_seen TIMESTAMP NOT NULL,
last_seen TIMESTAMP NOT NULL,
digest VARCHAR (64)
);

CREATE TABLE IF NOT EXISTS sys.x$statements_with_full_table_scans(
query LONGTEXT,
db VARCHAR (64),
exec_count BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
no_index_used_count BIGINT UNSIGNED NOT NULL,
no_good_index_used_count BIGINT UNSIGNED NOT NULL,
no_index_used_pct DECIMAL NOT NULL,
rows_sent BIGINT UNSIGNED NOT NULL,
rows_examined BIGINT UNSIGNED NOT NULL,
rows_sent_avg sys."DECIMAL UNSIGNED",
rows_examined_avg sys."DECIMAL UNSIGNED",
first_seen TIMESTAMP NOT NULL,
last_seen TIMESTAMP NOT NULL,
digest VARCHAR (64)
);

CREATE TABLE IF NOT EXISTS sys.x$statements_with_runtimes_in_95th_percentile(
query LONGTEXT,
db VARCHAR (64),
full_scan VARCHAR (1) NOT NULL,
exec_count BIGINT UNSIGNED NOT NULL,
err_count BIGINT UNSIGNED NOT NULL,
warn_count BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
max_latency BIGINT UNSIGNED NOT NULL,
avg_latency BIGINT UNSIGNED NOT NULL,
rows_sent BIGINT UNSIGNED NOT NULL,
rows_sent_avg DECIMAL NOT NULL,
rows_examined BIGINT UNSIGNED NOT NULL,
rows_examined_avg DECIMAL NOT NULL,
first_seen TIMESTAMP NOT NULL,
last_seen TIMESTAMP NOT NULL,
digest VARCHAR (64)
);

CREATE TABLE IF NOT EXISTS sys.x$statements_with_sorting(
query LONGTEXT,
db VARCHAR (64),
exec_count BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
sort_merge_passes BIGINT UNSIGNED NOT NULL,
avg_sort_merges DECIMAL NOT NULL,
sorts_using_scans BIGINT UNSIGNED NOT NULL,
sort_using_range BIGINT UNSIGNED NOT NULL,
rows_sorted BIGINT UNSIGNED NOT NULL,
avg_rows_sorted DECIMAL NOT NULL,
first_seen TIMESTAMP NOT NULL,
last_seen TIMESTAMP NOT NULL,
digest VARCHAR (64)
);

CREATE TABLE IF NOT EXISTS sys.x$statements_with_temp_tables(
query LONGTEXT,
db VARCHAR (64),
exec_count BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
memory_tmp_tables BIGINT UNSIGNED NOT NULL,
disk_tmp_tables BIGINT UNSIGNED NOT NULL,
avg_tmp_tables_per_query DECIMAL NOT NULL,
tmp_tables_to_disk_pct DECIMAL NOT NULL,
first_seen TIMESTAMP NOT NULL,
last_seen TIMESTAMP NOT NULL,
digest VARCHAR (64)
);

CREATE TABLE IF NOT EXISTS sys.x$user_summary(
user VARCHAR (32),
statements DECIMAL,
statement_latency DECIMAL,
statement_avg_latency DECIMAL NOT NULL,
table_scans DECIMAL,
file_ios DECIMAL,
file_io_latency DECIMAL,
current_connections DECIMAL,
total_connections DECIMAL,
unique_hosts BIGINT NOT NULL,
current_memory DECIMAL,
total_memory_allocated DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.x$user_summary_by_file_io(
user VARCHAR (32),
ios DECIMAL,
io_latency DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.x$user_summary_by_file_io_type(
user VARCHAR (32),
event_name VARCHAR (128) NOT NULL,
total BIGINT UNSIGNED NOT NULL,
latency BIGINT UNSIGNED NOT NULL,
max_latency BIGINT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$user_summary_by_stages(
user VARCHAR (32),
event_name VARCHAR (128) NOT NULL,
total BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
avg_latency BIGINT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$user_summary_by_statement_latency(
user VARCHAR (32),
total DECIMAL,
total_latency DECIMAL,
max_latency DECIMAL,
lock_latency DECIMAL,
rows_sent DECIMAL,
rows_examined DECIMAL,
rows_affected DECIMAL,
full_scans DECIMAL
);

CREATE TABLE IF NOT EXISTS sys.x$user_summary_by_statement_type(
user VARCHAR (32),
statement VARCHAR (128),
total BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
max_latency BIGINT UNSIGNED NOT NULL,
lock_latency BIGINT UNSIGNED NOT NULL,
rows_sent BIGINT UNSIGNED NOT NULL,
rows_examined BIGINT UNSIGNED NOT NULL,
rows_affected BIGINT UNSIGNED NOT NULL,
full_scans BIGINT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$wait_classes_global_by_avg_latency(
event_class VARCHAR (128),
total DECIMAL,
total_latency DECIMAL,
min_latency BIGINT UNSIGNED,
avg_latency DECIMAL NOT NULL,
max_latency BIGINT UNSIGNED
);

CREATE TABLE IF NOT EXISTS sys.x$wait_classes_global_by_latency(
event_class VARCHAR (128),
total DECIMAL,
total_latency DECIMAL,
min_latency BIGINT UNSIGNED,
avg_latency DECIMAL NOT NULL,
max_latency BIGINT UNSIGNED
);

CREATE TABLE IF NOT EXISTS sys.x$waits_by_host_by_latency(
host VARCHAR (255),
event VARCHAR (128) NOT NULL,
total BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
avg_latency BIGINT UNSIGNED NOT NULL,
max_latency BIGINT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$waits_by_user_by_latency(
user VARCHAR (32),
event VARCHAR (128) NOT NULL,
total BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
avg_latency BIGINT UNSIGNED NOT NULL,
max_latency BIGINT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS sys.x$waits_global_by_latency(
events VARCHAR (128) NOT NULL,
total BIGINT UNSIGNED NOT NULL,
total_latency BIGINT UNSIGNED NOT NULL,
avg_latency BIGINT UNSIGNED NOT NULL,
max_latency BIGINT UNSIGNED NOT NULL
);

ALTER TABLE sys.aparelho
ADD CONSTRAINT aparelho_pkey PRIMARY KEY (cod);
ALTER TABLE sys.cargo
ADD CONSTRAINT cargo_pkey PRIMARY KEY (cod);
ALTER TABLE sys.endereco
ADD CONSTRAINT endereco_pkey PRIMARY KEY (cod);
ALTER TABLE sys.plano
ADD CONSTRAINT plano_pkey PRIMARY KEY (cod);
ALTER TABLE sys.sala
ADD CONSTRAINT sala_pkey PRIMARY KEY (cod);
ALTER TABLE sys.unidade
ADD CONSTRAINT unidade_pkey PRIMARY KEY (cod);
ALTER TABLE sys.aluno
ADD CONSTRAINT aluno_pkey PRIMARY KEY (matricula);
ALTER TABLE sys.funcionario
ADD CONSTRAINT funcionario_pkey PRIMARY KEY (registro);
ALTER TABLE sys.modalidade
ADD CONSTRAINT modalidade_pkey PRIMARY KEY (cod);
ALTER TABLE sys.avaliacaofisica
ADD CONSTRAINT avaliacaofisica_pkey PRIMARY KEY (cod);
ALTER TABLE sys.ficha
ADD CONSTRAINT ficha_pkey PRIMARY KEY (cod);
ALTER TABLE sys.funcionario_modalidade
ADD CONSTRAINT funcionario_modalidade_pkey PRIMARY KEY (cod);
ALTER TABLE sys.modalidade_sala
ADD CONSTRAINT modalidade_sala_pkey PRIMARY KEY (cod);
ALTER TABLE sys.pagamento
ADD CONSTRAINT pagamento_pkey PRIMARY KEY (cod);
ALTER TABLE sys.plano_aluno
ADD CONSTRAINT plano_aluno_pkey PRIMARY KEY (cod);
ALTER TABLE sys.plano_modalidade
ADD CONSTRAINT plano_modalidade_pkey PRIMARY KEY (cod);
ALTER TABLE sys.turma
ADD CONSTRAINT turma_pkey PRIMARY KEY (cod);
ALTER TABLE sys.linha_ficha
ADD CONSTRAINT linha_ficha_pkey PRIMARY KEY (cod);
ALTER TABLE sys.plano_turma
ADD CONSTRAINT plano_turma_pkey PRIMARY KEY (cod);
ALTER TABLE sys.turma_sala
ADD CONSTRAINT turma_sala_pkey PRIMARY KEY (cod);
ALTER TABLE sys.medico
ADD CONSTRAINT medico_pkey PRIMARY KEY (id);
ALTER TABLE sys.paciente
ADD CONSTRAINT paciente_pkey PRIMARY KEY (id);
ALTER TABLE sys.secretaria
ADD CONSTRAINT secretaria_pkey PRIMARY KEY (id);
ALTER TABLE sys.consulta
ADD CONSTRAINT consulta_pkey PRIMARY KEY (id);
ALTER TABLE sys.sys_config
ADD CONSTRAINT sys_config_pkey PRIMARY KEY (variable);

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
