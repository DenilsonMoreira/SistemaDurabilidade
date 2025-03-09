/* Logico_1: */
/*ROOT*/
GRANT ALL PRIVILEGES ON sistemarpg.* TO 'usuario'@'%' ;
FLUSH PRIVILEGES;
/*Usuario*/
SHOW GRANTS FOR 'usuario'@'%';
create database sistemarpg;
use sistemarpg;
show tables;




CREATE TABLE personagem (
    nome varchar(50),
    idade int(5),
    altura FLOAT,
    historia varchar(1000),
    nivel int(5),
    data_criacao DATE,
    data_morte DATE,
    forca int(5),
    raca varchar(50),
    sabedoria int(5),
    destreza int(5),
    constituicao int(5),
    carisma int(5),
    inteligencia int(5),
    bonus_proficiencia int(5),
    xp int(5),
    id_personagem int(5) PRIMARY KEY
);

CREATE TABLE classe (
    nome varchar(50),    
    nivel int(5),
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


CREATE TABLE personagem_classe (
    fk_id_personagem int(5),
    fk_id_classe int(5)
);

CREATE TABLE item_personagem (
    fk_item_id_item int(5),
    fk_id_personagem int(5)
);
 
ALTER TABLE personagem_classe ADD CONSTRAINT FK_personagem_classe_1
    FOREIGN KEY (fk_id_personagem)
    REFERENCES personagem (id_personagem)
    ON DELETE RESTRICT;
 
ALTER TABLE personagem_classe ADD CONSTRAINT FK_personagem_classe_2
    FOREIGN KEY (fk_id_classe)
    REFERENCES classe (id_classe)
    ON DELETE RESTRICT;
 
 
 
ALTER TABLE item_personagem ADD CONSTRAINT FK_item_personagem_1
    FOREIGN KEY (fk_item_id_item)
    REFERENCES item (id_item)
    ON DELETE SET NULL;
 
ALTER TABLE item_personagem ADD CONSTRAINT FK_item_personagem_2
    FOREIGN KEY (fk_id_personagem)
    REFERENCES personagem (id_personagem)
    ON DELETE SET NULL;