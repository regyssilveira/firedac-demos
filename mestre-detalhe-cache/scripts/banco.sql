create table mestre (
  id_mestre integer not null,
  descricao varchar(100),

  constraint pk_mestre primary key (id_mestre)
);

create table detalhe (
  id_mestre integer not null,
  id_item integer not null,
  descricao varchar(100),
  valor numeric(10,2),

  constraint pk_detalhe
    primary key (id_mestre, id_item),

  constraint fk_mestre_detalhe
    foreign key (id_mestre)
    references mestre(id_mestre)
    on update cascade
    on delete cascade
);

set term ^ ;

create trigger TR_MESTRE_BI for MESTRE
active BEFORE INSERT position 0
as
begin
  SELECT
    COALESCE(MAX(ID_MESTRE), 0) + 1
  FROM
    MESTRE
  INTO
    NEW.ID_MESTRE;
end^

create trigger TR_DETALHE_BI for DETALHE
active BEFORE INSERT position 0
as
begin
  SELECT
    COALESCE(MAX(ID_ITEM), 0) + 1
  FROM
    DETALHE
  WHERE
    ID_MESTRE = NEW.ID_MESTRE
  INTO
    NEW.ID_ITEM;
end^

set term ; ^

