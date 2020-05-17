
-- -----------------------------------------------------
CREATE TABLE Pessoa  
  (id INT,
  endereco VARCHAR(100)  ,
  denominacaosocial VARCHAR(100) ,
  nome VARCHAR(100) ,
  email VARCHAR(100) ,
  cnpj VARCHAR(100) ,
  cpf VARCHAR(14) ,
  observacoes VARCHAR(100) ,
  ativo CHAR(1)  ,
  tipo CHAR(1) ,
  login VARCHAR(100) ,
  senha VARCHAR(100) ,
  PRIMARY KEY (id)),


-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE TABLE Estoque 
  (id INT   AUTO_INCREMENT,
  endereco_id INT  ,
  nome VARCHAR(200)  ,
  descricao VARCHAR(100) ,
  telefone VARCHAR(25)  ,
  ativo CHAR  ,
  PRIMARY KEY (id))



-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE TABLE Cidade
  (id INT   AUTO_INCREMENT,
  nome VARCHAR(100)  ,
  uf VARCHAR(2)  ,
  ativo CHAR  ,
  estoque_id INT  ,
  PRIMARY KEY (id),
  INDEX fk_cidade_estoque1_idx (estoque_id ASC),
  CONSTRAINT fk_cidade_estoque1
    FOREIGN KEY (estoque_id)
    REFERENCES estoque(id))

-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE TABLE Produto
  (id INT   AUTO_INCREMENT,
  nome VARCHAR(45)  ,
  descricao VARCHAR(45)  ,
  quantidade DOUBLE  ,
  custounitario DECIMAL(11,2)  ,
  ativo CHAR  ,
  categoria VARCHAR(45) ,
  marca VARCHAR(45) ,
  unidade VARCHAR(45) ,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------


CREATE TABLE Nfe
  (id INT   AUTO_INCREMENT,
  pessoarem_id INT ,
  enderecorem VARCHAR(100)  ,
  pessoadest_id INT  ,
  enderecodest VARCHAR(100)  ,
  numnf INT ,
  dataemissao DATE  ,
  valora DECIMAL(13,3)  ,
  tipo CHAR  ,
  observacoes VARCHAR(100) ,
  ativo CHAR  ,
  PRIMARY KEY (id),
  INDEX fk_nfe_pessoa1_idx (pessoarem_id ASC),
  INDEX fk_nfe_pessoa2_idx (pessoadest_id ASC),
  CONSTRAINT fk_nfe_pessoa1
    FOREIGN KEY (pessoarem_id)
    REFERENCES StockManager.pessoa (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_nfe_pessoa2
    FOREIGN KEY (pessoadest_id)
    REFERENCES StockManager.pessoa (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE TABLE Nfe_has_produto
  (nfe_id INT  ,
  produto_id INT  ,
  quantidade DOUBLE  ,
  valorprodutos DOUBLE  ,
  ativo CHAR  ,
  datasaida DATE ,
  dataentrada DATE ,
  PRIMARY KEY (nfe_id, produto_id),
  INDEX fk_nfe_has_produto_produto1_idx (produto_id ASC),
  CONSTRAINT fk_nfe_has_produto_nfe1
    FOREIGN KEY (nfe_id)
    REFERENCES StockManager.nfe (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_nfe_has_produto_produto1
    FOREIGN KEY (produto_id)
    REFERENCES StockManager.produto (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE TABLE estoque_has_produto
  (insercao_id INT  ,
  estoque_id INT  ,
  produto_id INT  ,
  quantidade DOUBLE  ,
  valorunitario DOUBLE  ,
  ativo CHAR  ,
  PRIMARY KEY (insercao_id, estoque_id, produto_id),
  INDEX fk_Estoque_has_Produto_Produto1_idx (produto_id ASC),
  INDEX fk_Estoque_has_Produto_Estoque1_idx (estoque_id ASC),
  CONSTRAINT fk_Estoque_has_Produto_Estoque1
    FOREIGN KEY (estoque_id)
    REFERENCES StockManager.estoque (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Estoque_has_Produto_Produto1
    FOREIGN KEY (produto_id)
    REFERENCES StockManager.produto (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
