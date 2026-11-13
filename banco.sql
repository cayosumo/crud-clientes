-- Conforme ao slide 9 do roteiro.
-- O banco e a tabela sao compartilhados: nao execute comandos de exclusao de tabela.
USE u679404890_aulas_des;

CREATE TABLE IF NOT EXISTS clientes_aula (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Conferencia, se tiver permissao:
-- SELECT * FROM clientes_aula ORDER BY id DESC;
