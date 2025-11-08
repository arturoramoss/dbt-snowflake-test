{% macro clone_prod_database() %}
    {# 
      Creates or replaces target_database by cloning source_database.
      Usage:
      dbt run-operation clone_database --args '{"source_database": "PROD_DB", "target_database": "PROD_DB_CLONE"}'
    #}

    {% set tgt = target.database | upper %}
    {% set src = tgt.replace("_STAGE", "_PROD") | upper %}

    {% set sql %}
        create or replace database {{ tgt }}
        clone {{ src }}
    {% endset %}

    {% do log("Running: " ~ sql, info=True) %}
    {% do run_query(sql) %}
    {% do log("Cloned database " ~ src ~ " -> " ~ tgt, info=True) %}
{% endmacro %}