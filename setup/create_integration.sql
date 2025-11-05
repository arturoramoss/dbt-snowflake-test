create or replace api integration github_integration
    api_provider = 'git_https_api'   -- Using GitHub's HTTPS API
    api_allowed_prefixes = ('https://github.com/arturoramoss')  -- GitHub API prefix
    enabled = true
    allowed_authentication_secrets = all  -- This means all available authentication methods (OAuth, Personal Tokens, etc.)
    api_user_authentication = (type = snowflake_github_app)  -- Enable OAuth authentication (via GitHub OAuth App)
    comment = 'Integration to access GitHub repository API';