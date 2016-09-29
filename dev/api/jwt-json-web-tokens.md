JWT / JSON Web Tokens
=====================

- Pronounced 'jot'
- Convention for generating tokens, produces a string such as: ey3j4kksdf.23jkskdfjksdf.3489sdhjk234
- Can be used as header in HTTP request (most common), in query string, as a cookie, whatever
- Used as de facto standard for tokens in OAuth2 and OpenID
- Easy to create, transmit, parse, and validate
- Libraries across many languages and frameworks

Structure & Format
------------------

Consists of two JSON objects;

- Header
    - metadata
    - algorithms and keys used to encrypt
- Claims
    - Issuer (iss)
        - Where the token is coming from
    - Audience (aud)
        - So the recipient knows they are the right recipient for the token, and not someone else
    - IssuedAt (iat)
    - Expiration (exp)
        - Perhaps a work day (eg: 10 hours)
        - With access tokens, 1 hour or shorter
    - Subject (sub)
        - Identifier that token describe, eg: UserID
    - Application defined claims (custom)

Result
------

Example: "hy3j4kksdf.23jkskdfjksdf.3489sdhjk234" 

- Take header part, Base64 URL encode it
- Take claims part, Base64 URL encode it
- Put in a string, separated by a dot
- Run signature algorithm over it
- Append Base64 URL Encoded signature at end with dot
