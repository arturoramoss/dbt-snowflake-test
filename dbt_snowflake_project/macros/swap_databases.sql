{% macro swap_databases() %}
    {# 
      Swaps the names and metadata of two databases.
      Usage:
      dbt run-operation swap_databases --args '{"database_a": "PROD_DB", "database_b": "PROD_DB_CLONE"}'
    #}

    {% set db1 = target.database | upper %}
    {% set db2 = db1.replace("_STAGE", "_PROD") | upper %}

    {% set sql %}
        alter database {{ adapter.quote(db1) }}
        swap with {{ adapter.quote(db2) }}
    {% endset %}

    {% do log("Running: " ~ sql, info=True) %}
    {% do run_query(sql) %}
    {% do log("Swapped databases " ~ db1 ~ " <-> " ~ db2, info=True) %}
{% endmacro %}