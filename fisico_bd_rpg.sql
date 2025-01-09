/* Logico_1: */

CREATE TABLE personagem (
    nome varchar(50),
    idade int(5),
    altura FLOAT,
    historia varchar(50),
    nivel int(5),
    data_criacao DATE,
    data_morte DATE,
    forca int(5),
    sabedoria int(5),
    destreza int(5),
    constituicao int(5),
    carisma int(5),
    inteligencia int(5),
    xp int(5),
    capacidade_carga FLOAT,
    id_personagem int(5) PRIMARY KEY
);

CREATE TABLE classe (
    nome varchar(50),
    bonus_proficiencia int(5),
    truques int(5),
    espaco_magia int(5),
    conjurador BOOLEAN,
    id_classe int(5) PRIMARY KEY
);

CREATE TABLE item (
    nome varchar(50),
    classe_armadura varchar(50),
    preco FLOAT,
    vestir int(5),
    tipo_armadura varchar(50),
    dependencia_forca varchar(50),
    furtividade BOOLEAN,
    peso FLOAT,
    tipo_item varchar(50),
    remover int(5),
    tipo_arma varchar(50),
    dano int(5),
    tipo_dano varchar(50),
    propriedade varchar(50),
    durabilidade int(5),
    material varchar(50),
    id_item int(5) PRIMARY KEY
);

CREATE TABLE raca (
    nome varchar(50),
    id_raca int(5) PRIMARY KEY
);

CREATE TABLE personagem_classe (
    fk_personagem_id_personagem int(5),
    fk_classe_id_classe int(5)
);

CREATE TABLE Relacionamento_2 (
    fk_personagem_id_personagem int(5),
    fk_raca_id_raca int(5)
);

CREATE TABLE Relacionamento_1 (
    fk_item_id_item int(5),
    fk_personagem_id_personagem int(5)
);
 
ALTER TABLE personagem_classe ADD CONSTRAINT FK_personagem_classe_1
    FOREIGN KEY (fk_personagem_id_personagem)
    REFERENCES personagem (id_personagem)
    ON DELETE RESTRICT;
 
ALTER TABLE personagem_classe ADD CONSTRAINT FK_personagem_classe_2
    FOREIGN KEY (fk_classe_id_classe)
    REFERENCES classe (id_classe)
    ON DELETE RESTRICT;
 
ALTER TABLE Relacionamento_2 ADD CONSTRAINT FK_Relacionamento_2_1
    FOREIGN KEY (fk_personagem_id_personagem)
    REFERENCES personagem (id_personagem)
    ON DELETE SET NULL;
 
ALTER TABLE Relacionamento_2 ADD CONSTRAINT FK_Relacionamento_2_2
    FOREIGN KEY (fk_raca_id_raca)
    REFERENCES raca (id_raca)
    ON DELETE SET NULL;
 
ALTER TABLE Relacionamento_1 ADD CONSTRAINT FK_Relacionamento_1_1
    FOREIGN KEY (fk_item_id_item)
    REFERENCES item (id_item)
    ON DELETE SET NULL;
 
ALTER TABLE Relacionamento_1 ADD CONSTRAINT FK_Relacionamento_1_2
    FOREIGN KEY (fk_personagem_id_personagem)
    REFERENCES personagem (id_personagem)
    ON DELETE SET NULL;