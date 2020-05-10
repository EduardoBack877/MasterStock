-- -----------------------------------------------------
create database stockmanager
	DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_general_ci;
-- CREATE SCHEMA IF NOT EXISTS `stockmanager` DEFAULT CHARACTER SET utf8 ;
USE stockmanager ;

-- -----------------------------------------------------
-- Table `stockmanager`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`cidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `uf` VARCHAR(2) NOT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`endereco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cidade_id` INT NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(5) NOT NULL,
  `bairro` VARCHAR(45) NULL,
  `cep` VARCHAR(10) NOT NULL,
  `complementos` VARCHAR(25) NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Endereco_Cidade1_idx` (`cidade_id` ASC),
  CONSTRAINT `fk_Endereco_Cidade1`
    FOREIGN KEY (`cidade_id`)
    REFERENCES `stockmanager`.`cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`pessoa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `endereco_id` INT NOT NULL,
  `denominacaosocial` VARCHAR(90) NULL,
  `nome` VARCHAR(55) NULL,
  `email` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  `cpf` VARCHAR(14) NULL,
  `observacoes` TEXT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Pessoa_Endereco1_idx` (`endereco_id` ASC),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC),
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC),
  CONSTRAINT `fk_Pessoa_Endereco1`
    FOREIGN KEY (`endereco_id`)
    REFERENCES `stockmanager`.`endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`funcionario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pessoa_id` INT NOT NULL,
  `login` VARCHAR(85) NOT NULL,
  `senha` VARCHAR(40) NOT NULL,
  `funcao` VARCHAR(100) NOT NULL,
  `nivelacesso` CHAR NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senhaemail` VARCHAR(45) NOT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Funcionario_Pessoa1_idx` (`pessoa_id` ASC),
  UNIQUE INDEX `ogin_UNIQUE` (`login` ASC),
  CONSTRAINT `fk_Funcionario_Pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `stockmanager`.`pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `descricao` TEXT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`departamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `descricao` TEXT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`unidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`unidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `sigla` VARCHAR(2) NOT NULL,
  `descricao` TEXT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC),
  UNIQUE INDEX `sigla_UNIQUE` (`sigla` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`marca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `descricao` TEXT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `marca_id` INT NOT NULL,
  `departamento_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  `unidade_id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `quantidade` DOUBLE NOT NULL,
  `custounitario` DECIMAL(11,2) NOT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Produto_Departamento1_idx` (`departamento_id` ASC),
  INDEX `fk_Produto_Categoria1_idx` (`categoria_id` ASC),
  INDEX `fk_Produto_Unidade1_idx` (`unidade_id` ASC),
  INDEX `fk_Produto_Marca1_idx` (`marca_id` ASC),
  CONSTRAINT `fk_Produto_Departamento1`
    FOREIGN KEY (`departamento_id`)
    REFERENCES `stockmanager`.`departamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_Categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `stockmanager`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_Unidade1`
    FOREIGN KEY (`unidade_id`)
    REFERENCES `stockmanager`.`unidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_Marca1`
    FOREIGN KEY (`marca_id`)
    REFERENCES `stockmanager`.`marca` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`nfe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`nfe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pessoarem_id` INT,
  `enderecorem_id` INT NOT NULL,
  `pessoadest_id` INT NOT NULL,
  `enderecodest_id` INT NOT NULL,
  `numnf` INT NULL,
  `dataemissao` DATE NOT NULL,
  `valornota` DECIMAL(13,3) NOT NULL,
  `tipo` CHAR NOT NULL,
  `observacoes` TEXT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_nfe_pessoa1_idx` (`pessoarem_id` ASC),
  INDEX `fk_nfe_pessoa2_idx` (`pessoadest_id` ASC),
  INDEX `fk_nfe_endereco1_idx` (`enderecorem_id` ASC),
  INDEX `fk_nfe_endereco2_idx` (`enderecodest_id` ASC),
  CONSTRAINT `fk_nfe_pessoa1`
    FOREIGN KEY (`pessoarem_id`)
    REFERENCES `stockmanager`.`pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nfe_pessoa2`
    FOREIGN KEY (`pessoadest_id`)
    REFERENCES `stockmanager`.`pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nfe_endereco1`
    FOREIGN KEY (`enderecorem_id`)
    REFERENCES `stockmanager`.`endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nfe_endereco2`
    FOREIGN KEY (`enderecodest_id`)
    REFERENCES `stockmanager`.`endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`nfe_has_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`nfe_has_produto` (
  `nfe_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  `quantidade` DOUBLE NOT NULL,
  `valorprodutos` DOUBLE NOT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`nfe_id`, `produto_id`),
  INDEX `fk_nfe_has_produto_produto1_idx` (`produto_id` ASC),
  CONSTRAINT `fk_nfe_has_produto_nfe1`
    FOREIGN KEY (`nfe_id`)
    REFERENCES `stockmanager`.`nfe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nfe_has_produto_produto1`
    FOREIGN KEY (`produto_id`)
    REFERENCES `stockmanager`.`produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`estoque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `endereco_id` INT NOT NULL,
  `nome` VARCHAR(200) NOT NULL,
  `descricao` TEXT NULL,
  `telefone` VARCHAR(25) NOT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Estoque_Endereco1_idx` (`endereco_id` ASC),
  CONSTRAINT `fk_Estoque_Endereco1`
    FOREIGN KEY (`endereco_id`)
    REFERENCES `stockmanager`.`endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`agendamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`agendamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `funcionario_id` INT NOT NULL,
  `titulo` VARCHAR(200) NULL,
  `descricao` TEXT NULL,
  `data` DATETIME NOT NULL,
  `estado` CHAR(1) NOT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`, `funcionario_id`),
  INDEX `fk_Agendamento_Funcionario1_idx` (`funcionario_id` ASC),
  CONSTRAINT `fk_Agendamento_Funcionario1`
    FOREIGN KEY (`funcionario_id`)
    REFERENCES `stockmanager`.`funcionario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`insercao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`insercao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `funcionario_id` INT NOT NULL,
  `data` DATETIME NOT NULL,
  `nfe` LONGBLOB NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_insercao_funcionario1_idx` (`funcionario_id` ASC),
  CONSTRAINT `fk_insercao_funcionario1`
    FOREIGN KEY (`funcionario_id`)
    REFERENCES `stockmanager`.`funcionario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`estoque_has_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`estoque_has_produto` (
  `insercao_id` INT NOT NULL,
  `estoque_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  `quantidade` DOUBLE NOT NULL,
  `valorunitario` DOUBLE NOT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`insercao_id`, `estoque_id`, `produto_id`),
  INDEX `fk_Estoque_has_Produto_Produto1_idx` (`produto_id` ASC),
  INDEX `fk_Estoque_has_Produto_Estoque1_idx` (`estoque_id` ASC),
  INDEX `fk_estoque_has_produto_insercao1_idx` (`insercao_id` ASC),
  CONSTRAINT `fk_Estoque_has_Produto_Estoque1`
    FOREIGN KEY (`estoque_id`)
    REFERENCES `stockmanager`.`estoque` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estoque_has_Produto_Produto1`
    FOREIGN KEY (`produto_id`)
    REFERENCES `stockmanager`.`produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estoque_has_produto_insercao1`
    FOREIGN KEY (`insercao_id`)
    REFERENCES `stockmanager`.`insercao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`telefones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`telefones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(45) NOT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`tipo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` TEXT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`pessoa_has_telefones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`pessoa_has_telefones` (
  `pessoa_id` INT NOT NULL,
  `telefones_id` INT NOT NULL,
  `descricao` TEXT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`pessoa_id`, `telefones_id`),
  INDEX `fk_Pessoa_has_Telefones_Telefones1_idx` (`telefones_id` ASC),
  INDEX `fk_Pessoa_has_Telefones_Pessoa1_idx` (`pessoa_id` ASC),
  CONSTRAINT `fk_Pessoa_has_Telefones_Pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `stockmanager`.`pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoa_has_Telefones_Telefones1`
    FOREIGN KEY (`telefones_id`)
    REFERENCES `stockmanager`.`telefones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`pessoa_has_tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`pessoa_has_tipo` (
  `pessoa_id` INT NOT NULL,
  `tipo_id` INT NOT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`pessoa_id`, `tipo_id`),
  INDEX `fk_Pessoa_has_Tipo_Tipo1_idx` (`tipo_id` ASC),
  INDEX `fk_Pessoa_has_Tipo_Pessoa1_idx` (`pessoa_id` ASC),
  CONSTRAINT `fk_Pessoa_has_Tipo_Pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `stockmanager`.`pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoa_has_Tipo_Tipo1`
    FOREIGN KEY (`tipo_id`)
    REFERENCES `stockmanager`.`tipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`pessoa_has_agendamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`pessoa_has_agendamento` (
  `pessoa_id` INT NOT NULL,
  `agendamento_id` INT NOT NULL,
  `agendamento_funcionario_id` INT NOT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`pessoa_id`, `agendamento_id`, `agendamento_funcionario_id`),
  INDEX `fk_pessoa_has_agendamento_agendamento1_idx` (`agendamento_id` ASC, `agendamento_funcionario_id` ASC),
  INDEX `fk_pessoa_has_agendamento_pessoa1_idx` (`pessoa_id` ASC),
  CONSTRAINT `fk_pessoa_has_agendamento_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `stockmanager`.`pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_has_agendamento_agendamento1`
    FOREIGN KEY (`agendamento_id` , `agendamento_funcionario_id`)
    REFERENCES `stockmanager`.`agendamento` (`id` , `funcionario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`permissoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`permissoes` (
  `id` INT NOT NULL,
  `funcionario_id` INT NOT NULL,
  `regra` VARCHAR(100) NOT NULL,
  `ativo` CHAR NOT NULL,
  PRIMARY KEY (`id`, `funcionario_id`),
  CONSTRAINT `fk_acesso_funcionario1`
    FOREIGN KEY (`funcionario_id`)
    REFERENCES `stockmanager`.`funcionario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`sensor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`sensor` (
  `id` INT NOT NULL,
  `estoque_id` INT NULL,
  `nome` VARCHAR(200) NULL,
  `mac` VARCHAR(20) NULL,
  `ip` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sensor_estoque1_idx` (`estoque_id` ASC),
  CONSTRAINT `fk_sensor_estoque1`
    FOREIGN KEY (`estoque_id`)
    REFERENCES `stockmanager`.`estoque` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`temperatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`temperatura` (
  `id` INT NOT NULL,
  `sensor_id` INT NOT NULL,
  `temperatura` VARCHAR(45) NULL,
  `humidade` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_temperatura_sensor1_idx` (`sensor_id` ASC),
  CONSTRAINT `fk_temperatura_sensor1`
    FOREIGN KEY (`sensor_id`)
    REFERENCES `stockmanager`.`sensor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockmanager`.`log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockmanager`.`log` (
  `id` INT NOT NULL,
  `funcionario_id` INT NOT NULL,
  `data` TIMESTAMP NULL,
  `tipo` CHAR NULL,
  `mensagem` TEXT NULL,
  PRIMARY KEY (`id`, `funcionario_id`),
  INDEX `fk_log_funcionario1_idx` (`funcionario_id` ASC),
  CONSTRAINT `fk_log_funcionario1`
    FOREIGN KEY (`funcionario_id`)
    REFERENCES `stockmanager`.`funcionario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

