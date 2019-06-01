create table transactions (
  id integer not null,
  descricao varchar(100) not null,
  
  constraint pk_transacations
    primary key(id)
);

SET TERM ^ ;

CREATE OR ALTER TRIGGER tr_transaction_BI FOR transactions 
ACTIVE BEFORE INSERT POSITION 0
as
begin
  select
    coalesce(max(id), 0) + 1
  from
    transactions 
  into
    new.id;
end
^

SET TERM ; ^
