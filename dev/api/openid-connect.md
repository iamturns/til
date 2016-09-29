OpenID Connect
===============

- Adds *authentication* to OAuth2 (OAuth2 is only for *authorization*)
- Implements 2 flows from OAuth2: Authorization Code Flow and Implicit Flow

OAuth2 as authentication
------------------------

- Many use OAuth2 for authentication too
- Not good: it's assumed that once you get an Authorization Token from a server, then the authentication must be valid

### Problematic scenario

- User opens malicious app
- App says "Hey, want to login with Facebook?"
- You type in credentials into Facebook, and the app has your access token
- The app then uses your access token to do whatever they want
- As a result, developers added some variations to protect themselves
    - eg: Extra token validation checks
    - Problems;
        - 1. Made them incompatible
            - Need to write specific code for every OAuth provider depending on their implementation or variations
        - 2. Pretty much implemented OpenID connect anyway
            - May as well followed a standard spec

Flow
----

- Very similar to OAuth2 flows
- The main differences;
    - A set number of scopes to query from the Authorization Server
        - Specified in Open ID Connect spec
        - Eg: email, first name, last name, etc
    - Token response contains an extra token: "ID Token"
        - Token that is meant for the client
        - The client must immediately validate the token
        - The token is JWT and contains issuer, subject, audience, and expiration
