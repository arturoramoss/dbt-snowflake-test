create or replace api integration github_integration
    api_provider = git_https_api   -- Using GitHub's HTTPS API
    api_allowed_prefixes = ('https://github.com')  -- GitHub API prefix
    enabled = true
    allowed_authentication_secrets = all  -- This means all available authentication methods (OAuth, Personal Tokens, etc.)
    comment = 'Integration to access GitHub repository API'
    ;

CREATE OR REPLACE SECRET snowflake_learning_db.public.github_pat
  TYPE = PASSWORD
  USERNAME = ''
  PASSWORD = ''
  ;


-- Didn't work so created the repository manually
-- CREATE OR REPLACE GIT REPOSITORY dbt_snowflake_test
--   ORIGIN = 'https://github.com/arturoramoss/dbt-snowflake-test.git'
--   API_INTEGRATION = ( github_integration )
--   GIT_CREDENTIALS = ( snowflake_learning_db.public.github_pat )
-- ;


-- Create NETWORK RULE for external access integration

CREATE OR REPLACE NETWORK RULE dbt_network_rule
  MODE = EGRESS
  TYPE = HOST_PORT
  -- Minimal URL allowlist that is required for dbt deps
  VALUE_LIST = (
    'hub.getdbt.com',
    'codeload.github.com'
    );

-- Create EXTERNAL ACCESS INTEGRATION for dbt access to external dbt package locations

CREATE OR REPLACE EXTERNAL ACCESS INTEGRATION dbt_ext_access
  ALLOWED_NETWORK_RULES = (dbt_network_rule)
  ENABLED = TRUE;