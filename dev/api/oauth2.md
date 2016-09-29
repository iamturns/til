OAuth2
======

- Handles controlling access to resources
- Has a bad reputation of being complicated and insecure (see History)

History
-------

- At first it was a protocol, and very strict
- During development, many giant companies (Google, Microsoft, Facebook, Twitter, etc) came to the standardization meetings and wanted their particular use cases catered for
- Over time (due to enterprise bloat), it became a *framework__, with __suggestions* on how to implement OAuth
    - Eg: The user MAY authenticate this way or MAY with that way
- Lead author (Eran Hammer) resigned and very publically wanted his name withdrawn from spec
- Progress slow over years, 32 revisions to spec, but companies started implemented it immediately, as they needed it!
- Companies implemented OAuth at different points, leading to incomaptible implementations
- It also led to hacks, eg: Facebook was hacked via OAuth
- Found new lead dev, who finalized spec in October 2012
    - RFC 6749
    - RFC 6750 for bearer tokens

Components
----------

### Resource Owner

- aka "The User"
- Owns a resource on the Resource Server
- Uses a Client to access the Resource on their behalf
- Is registered with an Authorization Server

### Resource Server

- eg: Web API
- Trusts the Authorization Server

### Authorization Server

- Issues keys
- Requests Resource Owner for username / password

### Client
- The code used to access the backend data
- eg: javascript, PHP, native app
- The Flow
    - Client asks Authorization Server for a key
    - Client sends key to Resource Server
    
Authorization Code Flow 
-----------------------

- Redirect the Resource Owner to the Authorization Server
- If the Resource Owner is not authenticated, they will be prompted with a login screen
- Authorization Server shows a 'consent' screen
    - Asks the Resource Owner "Do you want to give [app name] permission to x, y, z?"
- If pressing 'Allow', then the Authorization Server redirects back to the Client with an authorization code
- The Client then authenticates with the Authorization Server and sends the authorization code
    - This is usually done via a POST call
- The Authorization Server sends back a token response
    - Access token
        - Short lived token that expires
        - Usually also contains more information, eg: user ID, scope (what can be accessed), 
    - Refresh token
        - Optional
        - Longer lived token
        - Used to request new access tokens
        - Users can remove permissions for clients they have previously allowed access to, which means the Authorization Server will no longer give out new access tokens when the refresh token is sent

Implicit Flow
-------------

- For applications that run on client device
- Same as Authorziation Code Flow, but receive the access token directly from the Authorization Server
- There is no refresh token
- Authorization Server does not redirect back with token in query parameters, as these could be sent and logged on the server, or show up in the referrer and leak to a third party
    - Instead, it uses a hash fragment, eg:
        - GET /auth-callback#access_token=abc&expires_in=3600&state=123
    - These can only be accessed by local client
- Heavily debated flow
    - Security: token is exposed to browser and operating system
    - Spec doesn't allow refresh tokens, but some implement them anyway
    - Google uses hidden iFrames to do the consent handshake again via cookies, which is kind of a refresh token

Resource Owner Password Credential Flow
---------------------------------------


- For trusted applications
- Client types password into the Client application, not forwarded to the Authorization Server
- Client makes call to Authorization Code with username and password 

Client Credentials Flow
-----------------------

- No humans involved, machine to machine communication

Security
--------

### Access tokens

- All relies on the single access token being secure
- It MUST be sent over SSL

### Input validation

- Authorization Server needs to make sure the redirect URL (to forward to after consent screen with access token) is valid for the client, usually against a whitelist
- Also check the scope(s) requested are valid for that client
