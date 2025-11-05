select
    current_timestamp() as run_date
    , country
    , count(1) as city_count
from {{ ref('country') }}
group by all