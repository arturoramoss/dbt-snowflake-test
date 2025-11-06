Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

### DBT profile
```
dbt_snowflake_project:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: 
      user: 
      role: ACCOUNTADMIN
      database: SNOWFLAKE_LEARNING_DB
      schema: dev
      warehouse: COMPUTE_WH
      password: 
    prod:
      type: snowflake
      account: 'not needed'
      user: 'not needed'
      role: ACCOUNTADMIN
      database: SNOWFLAKE_LEARNING_DB
      schema: prod
      warehouse: COMPUTE_WH
```