/*

*/


-- list_all_sqlite_tables_query
SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table'
;


-- list_all_postgres_tables_query
SELECT
    table_schema || '.' || table_name
FROM
    information_schema.tables
WHERE
    table_type = 'BASE TABLE'
    AND
    table_schema NOT IN ('pg_catalog', 'information_schema')
;


-- postgres_tables_sizes_query
SELECT n.nspname AS table_schema,
       c.relname AS table_name,
       c.reltuples AS rows
FROM
    pg_class c
    JOIN
    pg_namespace n
    ON
    n.oid = c.relnamespace
WHERE
    c.relkind = 'r' AND n.nspname NOT IN ('information_schema','pg_catalog')
ORDER BY
    c.reltuples desc
;


-- analyse_sqlite_tables_query
ANALYZE main;


-- sqlite_tables_sizes_query
SELECT *
FROM
    sqlite_stat1
ORDER BY
    stat DESC
;


