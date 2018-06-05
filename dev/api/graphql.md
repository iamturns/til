# Graphql

The future of API development used by many big comanies in production (Facebook, Twitter, Yelp, IBM http://graphql.org/users/)

## Why

* Allow clients to requst exactly what they want from an API
* Helps frontend caching, optimistic updates, realtime functionality, offline support
* Strongly typed API layer based on schema, confidence on what is returned
* Great tooling, eg: GraphQL Playground

### SDL

Schema Definition Language

Type system to define API schema.

```javascript
type Person {
  id: ID!
  name: String!
  age: Int!
  posts: [Post!]!
}

type Post {
  title: String!
  author: Person!
}
```

Types start with an uppercase letter. Recommended to choose type names in singular form.

`fields` = `id`, `name`, etc
`!` = required

This doesn't expose functionality, but just defines the structure of a model. To add functionality to the API, must add to root types: Query, Mutation, Subscription.

### Queries

```javascript
{
  allPersons {
    name
    age
    posts {
      title
    }
  }
}
```

`allPersons` = _root field_, and everything that follows is the _payload_

Response:

```json
{
  "data": {
    "allPersons": [
      {
        "name": "Johnny",
        "age": 23,
        "posts": [
          {
            "title": "GraphQL is awesome"
          },
          {
            "title": "Relay is a powerful GraphQL Client"
          }
        ]
      },
      {
        "name": "Sarah",
        "age": 20,
        "posts": [
          {
            "title": "How to get started with React & GraphQL"
          }
        ]
      },
      {
        "name": "Alice",
        "age": 20,
        "posts": []
      }
    ]
  }
}
```

#### Arguments

Must be specific in the schema (TODO?)

```javascript
{
  allPersons(last: 2) {
    name
  }
}
```

## Mutations

Making changes to the data.

```javascript
mutation {
  createPerson(name: "Bob", age: 36) {
    id
  }
}
```

`createPerson` = _root field_

Response:

```javascript
{
  "data": {
    "createPerson": {
      "id": "cjhssoxaw8fys0186ejgblfq8"
    }
  }
}
```

If you sent multiple mutations they are executed sequentially.

## Subcriptions

```javascript
subscription {
  newPerson {
    name
    age
  }
}
```

Subscribed client receives:

```javascript
{
  "newPerson": {
    "name": "Jane",
    "age": 23
  }
}
```

## Schema

Contract between server and client.

What fields can you select? What objects do they return? What fields are available in those objects?

Fields are the building blocks of types. Every field is either a scalar or relation field. Scalar fields (explained below) are at the core of GraphQL, things like strings, integers, etc. Relations are tying one type to another.

### Scalar types

* `String`
  * Text
* `Int`
  * Number without decimals, range from -2147483648 to 2147483647
* `Float`
  * Number that can have decimals
* `Boolean`
* `ID`
  * Generated unique 25 character string, follows cuid (https://github.com/ericelliott/cuid) (collision resistant ids)
* `enum` (see below)

#### Custom

```javascript
scalar Date
```

Up to GraphQL service to figure out how to read, write, and validate.

### Enums

```javascript
enum Episode {
  NEWHOPE
  EMPIRE
  JEDI
}
```

### Non-null

`Type!`

### Lists

Fields with lists should be named plural. All others singular.

* `[Type]`
  * `null`
  * `[]`
  * `['a', 'b']`
  * `['a', null, 'b']`
* `[Type]!`
  * ERROR: `null`
  * `[]`
  * `['a', 'b']`
  * `['a', null, 'b']`
* `[Type!]`
  * `null`
  * `[]`
  * `['a', 'b']`
  * ERROR: `['a', null, 'b']`
* `[Type!]!`
  * ERROR: `null`
  * `[]`
  * `['a', 'b']`
  * ERROR: `['a', null, 'b']`

### Object types

```javascript
type Person {
  id: ID!
  name: String!
  age: Int!
  posts: [Post!]!
}

type Post {
  title: String!
  author: Person!
}
```

### Arguments

Optional arguments can provide a default value.

```javascript
type Starship {
  id: ID!
  name: String!
  length(unit: LengthUnit = METER): Float
}
```

### Root types

Special root types:

```javascript
type Query { ... }
type Mutation { ... }
type Subscription { ... }
```

### Interfaces

```javascript
interface Character {
  id: ID!
  name: String!
  friends: [Character]
  appearsIn: [Episode]!
}
```

Any type that implements `Character` must have these exact fields

```javascript
type Human implements Character {
  id: ID!
  name: String!
  friends: [Character]
  appearsIn: [Episode]!
  starships: [Starship]
  totalCredits: Int
}

type Droid implements Character {
  id: ID!
  name: String!
  friends: [Character]
  appearsIn: [Episode]!
  primaryFunction: String
}
```

#### Using interfaces

This produces an error:

```javascript
query HeroForEpisode($ep: Episode!) {
  hero(episode: $ep) {
    name
    primaryFunction
  }
}
```

Use inline fragment:

```javascript
query HeroForEpisode($ep: Episode!) {
  hero(episode: $ep) {
    name
    ... on Droid {
      primaryFunction
    }
  }
}
```

### Unions

```javascript
union SearchResult = Human | Droid | Starship
```

### Input types

Mutations often accept a bunch of fields. Use input, which looks like regular object types:

```javascript
input ReviewInput {
  stars: Int!
  commentary: String
}
```

Within a mutation:

```javascript
mutation CreateReviewForEpisode($ep: Episode!, $review: ReviewInput!) {
  createReview(episode: $ep, review: $review) {
    stars
    commentary
  }
}
```

### Example

Example from above:

```javascript
type Query {
  allPersons(last: Int): [Person!]!
}

type Mutation {
  createPerson(name: String!, age: Int!): Person!
}

type Subscription {
  newPerson: Person!
}
```

## Introspection

Query the `__schema` meta-field, available at the root of `query`:

```javascript
query {
  __schema {
    types {
      name
    }
  }
}

{
  __type(name: "Author") {
    name
    description
  }
}
```

## Error handling

All requests come back in a root field `data`.

Another root field `errors` is added if an error occurs:

```javascript
{
  "data": { ... },
  "errors": [ ... ]
}
```

If you receive an internal server error, use `prisma logs` command.

## Clients

Gives caching, framework integration, managing websockets, pagination, etc.

* Relay = by Facebook, optimized for performance, high learning curve, React only, requires custom schema
* Apollo = community driven, easy to undersand, framework agnostic
* graphql-request = Super lightweight, basically a wrapper around `fetch`

## Tools and packages

* graphql-cli
* graphql-yoga = GraphQL server
* prisma = Makes your database support GraphQL API. Supports MySQL
* graphql-tag = Use `gql` function to parse GraphQL

## Resolvers

Each `field` corresponds to exactly one function. This function is called a `resolver`.

Example query:

```javascript
query {
  author(id: "abc") {
    posts {
      title
      content
    }
  }
}
```

Note that everything has a type behind the scenes:

```javascript
query: Query {
  author(id: "abc"): Author {
    posts: [Post] {
      title: String
      content: String
    }
  }
}
```

When the server resolves a query it starts at the top, and passes the results down. When it reaches a scalar value it stops going deeper.

```javascript
const author = Query.author(null, { id: 'abc' }, context): Author
const posts = Author.posts(author, null, context): [Post]
for each post in posts
  const postTitle = Post.title(post, null, context): String
  const postContent = Post.content(post, null, context): String
```

There are four arguments passed:

* `parent`: The result of the previous call. Sometimes called `root`.
* `args`: Any params passed into the query
* `context`: An object passed through the chain that resolvers can read and write to. Allows resolvers to communicate.
* `info`: AST representation of the query or mutation (rarely used).

The role of a resolver is to return that one field. The resolver for `users` root field knows how to fetch a list of users.

Most GraphQL servers implement default resolvers, so you don't need to specify a resolver function for every single field.

Often return Promises, and GraphQL will wait for them to finish before delving deeper into resolvers. List resolvers can return an array of Promises.

## Advanced queries

### Arguments

```javascript
{
  human(id: "1000") {
    name
    height(unit: FOOT)
  }
}
```

### Aliases

```javascript
{
  empireHero: hero(episode: EMPIRE) {
    name
    appearsIn
    friends {
      name
    }
  }
  jediHero: hero(episode: JEDI) {
    name
    appearsIn
    friends {
      name
    }
  }
}
```

### Fragments

The above example can be simplified:

```
{
  empireHero: hero(episode: EMPIRE) {
    ...heroFields
  }
  jediHero: hero(episode: JEDI) {
    ...heroFields
  }
}

fragment heroFields on Character {
  name
  appearsIn
  friends {
    name
  }
}
```

Note that fragments cannot refer to themselves:

```
fragment NameAndAppearancesAndFriends on Character {
  name
  appearsIn
  friends {
    ...NameAndAppearancesAndFriends
  }
}
```

### Operation name

In above example the `query` keyword and query name is ommitted. But these are useful in production apps to improve code clarity and help debugging.

```
query HeroNameAndFriends {
  hero {
    name
    friends {
      name
    }
  }
}
```

### Variables

Add them to the `query`:

```
query HeroNameAndFriends($episode: Episode) {
  hero(episode: $episode) {
    name
    friends {
      name
    }
  }
}
```

Can use `!` too

#### Default values

```
query HeroNameAndFriends($episode: Episode = "JEDI") {
  hero(episode: $episode) {
    name
    friends {
      name
    }
  }
}
```

### Directives

Use variables to dynamically change the query.

Two directives are available:

* `@include(if: Boolean)`
* `@skip(if: Boolean)`

```
query Hero($episode: Episode, $withFriends: Boolean!) {
  hero(episode: $episode) {
    name
    friends @include(if: $withFriends) {
      name
    }
  }
}
```

### Inline fragments

Check this out:

Another way around this is by using fragments:

```
{
  hero {
    name
    ...DroidFields
  }
}
​
fragment DroidFields on Droid {
  primaryFunction
}
```

This is a bit verbose though, so you can inline the fragments:

```
query HeroForEpisode($ep: Episode!) {
  hero(episode: $ep) {
    name
    ... on Droid {
      primaryFunction
    }
    ... on Human {
      height
    }
  }
}
```

## Best practises

The GraphQL spec does not enforce these things, but is recommended.

Use a single endpoint over HTTP. Return JSON with gzip.

## GraphQL files

Can contain operations (queries, mutations, or subscriptions), and / or type definitions.

## Not GraphQL

Pagination. This is left up to the client (eg: Relay)

Batching and caching. With resolvers the GraphQL server can be quite inefficient to query the database. Often solved by batching, sending a single request to database, can use Facebook's DataLoader.

## HTTP

GET methods to query and POST

http://myapi/graphql?query=${JSON_OBJECT}&variables=${JSON_OBJECT}

There is also operationName if there are multiple operations, operationName controls which one is executed.

POST:

{
"query": "...",
"operationName": "...",
"variables": { "myVariable": "someValue", ... }
}

## Server side

With Node.js using Express

Middlewares available: graphql-js, express-graphql, apollo-server, graphql-yoga

### graphql-js

The official package: `npm install graphql`

Main capabilities:

* Build a type schema (with resolvers)
* Run queries against the schema

You will probably never use it yourself. Many abstractions exist which use this under the hood.

### express-graphql

Facebook's version of GraphQL Express middelware with GraphQL.js.

You create the SDL, the resolvers, and add it as middelware.

It's pretty barebones.

### apollo-server

Similar to express-graphql but works with lots of other frameworks (like koa, hapi, AWS Lambda)

### graphql-yoga

The easiest way. Much nicer syntax. Pass in the SDL (`typeDefs`, usually stored in `schema.graphql` file), and a bunch of resolvers, and that's it! Has subscriptions out the box, graphql playground, and tracing.

https://blog.graph.cool/tutorial-how-to-build-a-graphql-server-with-graphql-yoga-6da86f346e68

### An example

Typedefs:

```
type Query {
  posts: [Post!]!
  post(id: ID!): Post
  description: String!
}

type Mutation {
  createDraft(title: String!, content: String): Post
  deletePost(id: ID!): Post
  publish(id: ID!): Post
}

type Post {
  id: ID!
  title: String!
  content: String!
  published: Boolean!
}
```

Resolvers:

```
let idCount = 0
const posts = []

const resolvers = {
  Query: {
    description: () => `This is the API for a simple blogging application`,
    posts: () => posts,
    post: (parent, args) => posts.find(post => post.id === args.id),
  },
  Mutation: {
    createDraft: (parent, args) => {
      const post = {
        id: `post_${idCount++}`,
        title: args.title,
        content: args.content,
        published: false,
      }
      posts.push(post)
      return post
    },
    deletePost: (parent, args) => {
      const postIndex = posts.findIndex(post => post.id === args.id)
      if (postIndex > -1) {
        const deleted = posts.splice(postIndex, 1)
        return deleted[0]
      }
      return null
    },
    publish: (parent, args) => {
      const postIndex = posts.findIndex(post => post.id === args.id)
      posts[postIndex].published = true
      return posts[postIndex]
    },
  },
}
```
