select
    country_id
    , country
    , iso_currency
    , city
    , city_population
from {{ source('tb_101', 'COUNTRY')}}