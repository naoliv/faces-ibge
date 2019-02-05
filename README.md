# Gambi para Faces de Logradouros do IBGE

Gambiarra profissional para importar as [Faces de Logradouros do IBGE](ftp://geoftp.ibge.gov.br/recortes_para_fins_estatisticos/malha_de_setores_censitarios/censo_2010/base_de_faces_de_logradouros) em um banco postgis.

Como toda boa gambiarra, a documentação zero, é executado da forma mais lenta possível e vai comer a comida da sua geladeira.

Precisa de +5.2G para baixar e descompactar os shapefiles.
O banco postgis irá utilizar +2.15G em disco.

O banco com os dados de 2010 tem 10625256 (10.6+ milhões de) entradas

Em alguma hora precisa de algo assim:

```sql
CREATE ROLE user LOGIN ENCRYPTED PASSWORD 'md5c58016d169fd095496d6fa76513eccbb'
   VALID UNTIL 'infinity';

CREATE DATABASE "ibge"
  WITH ENCODING='UTF8'
       OWNER="user"
       LC_COLLATE='pt_BR.UTF-8'
       LC_CTYPE='pt_BR.UTF-8'
       CONNECTION LIMIT=-1
       TABLESPACE=arquivos;

CREATE EXTENSION postgis;

== importar ==

CREATE INDEX ON public.faces (nome) WHERE nome IS NOT NULL;
VACUUM ANALYZE; REINDEX TABLE faces;

== arruma nome ==
```
