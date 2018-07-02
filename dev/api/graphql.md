# Graphql

The future of API development used by many big comanies in production (Facebook, Twitter, Yelp, IBM http://graphql.org/users/)

## Why

* Allow clients to requst exactly what they want from an API
* Helps frontend caching, optimistic updates, realtime functionality, offline support
* Strongly typed API layer based on schema, confidence on what is returned
* Great tooling, eg: GraphQL Playground

## Schema

A GraphQL schema is made up of two things. The definition (SDL), and resolvers (implementing actual behaviour defined in the schema definition). This is also known as an executable schema. This is a clear separation of structure and behaviour.

```javascript
const { makeExecutableSchema } = require("graphql-tools");

const schema = makeExecutableSchema({
  typeDefs,
  resolvers
});
```

Schema is an instance of `GraphQLSchema` which can execute actual GraphQL queries:

```javascript
const { graphql } = require("graphql");

const query = `
  query {
    user(id: "abc") {
      id
      name
    }
  }
`;

graphql(schema, query).then(result => console.log(result));
```

### SDL

Schema Definition Language

Type system to define API schema.

Implemented into GraphQLSchema from `graphql` package.

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

```javascript
mutation {
  first: createPost(data: {
    title: "Hello World 👋",
    text: "I like turtles.",
    isPublished: true
  }) {
    id
  }

  second: createPost(data: {
    title: "Join us at GraphQL Europe 🇪🇺 ",
    text: "Get a 10%-discount with this promo code on graphql-europe.org: gql-boilerplates",
  isPublished: true
  }) {
    id
  }

  third: createPost(data: {
    title: "Solving world hunger",
    text: "This is a draft...",
    isPublished: false
  }) {
    id
  }
}
```

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

## Tools and packages

Clients: Gives caching, framework integration, managing websockets, pagination, etc.

* graphql-cli
  * Swiss army knife for GraphQL development
  * Code generation: `graphql create` gives you quite a few starting options, downloaded from https://github.com/graphql-boilerplates
  * Setup and manage .graphqlconfig file (see below) `graphql init` to start one
  * Open Graphql Playground `graphql playground` (see below)
  * Lint schema `graphql lint`
* graphql-config
  * A config file used by many tools and IDEs
  * Lives in a file named `.graphqlconfig`
  * Eg: points to schema file, GraphQL server endpoint, etc
* Relay = client by Facebook, optimized for performance, high learning curve, React only, requires custom schema
* Apollo = client community driven, easy to undersand, framework agnostic
* graphql-request = Super lightweight, basically a wrapper around `fetch`

Perfect for small scripts or simple apps.

```javascript
import { request } from "graphql-request";

const query = `{
  Movie(title: "Inception") {
    releaseDate
    actors {
      name
    }
  }
}`;

request("https://api.graph.cool/simple/v1/movies", query).then(data =>
  console.log(data)
);
```

* graphql-yoga = GraphQL server
* prisma = Makes your database support GraphQL API. Supports MySQL
* graphql-tag = Use `gql` function to parse GraphQL
* graphql-tools = parse queries, create types and schemas, execute queries against resolvers
  * https://github.com/nikolasburk/plain-graphql/blob/graphql-js/src/index.js
* graphql-playground better than GraphiQL
  * Even works as a desktop app, double click on `graphql` file to experiment with it

## Resolvers

Each `field` corresponds to exactly one function. This function is called a `resolver`.

Each resolver know how to fetch data for its field.

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

See more on [graphql-yoga](./graphql-yoga.md).

## Remote schemas

aka schema stitching

By introspecting the schema on a GraphQL server, you can fetch a copy of the types.

https://cdn-images-1.medium.com/max/2000/1*nmcFbnUg7ooxjlZ8z-GLQA.png

It's best practise to download the schema definition at development time and upload to server as graphql file, not running intorspection query at runtime. For performance.

```javascript
const fetch = require("node-fetch");
const {
  makeRemoteExecutableSchema,
  introspectSchema
} = require("graphql-tools");
const { GraphQLServer } = require("graphql-yoga");
const { createHttpLink } = require("apollo-link-http");

const { DATABASE_SERVICE_ID } = require("./services");

async function run() {
  // 1. Create Apollo Link that's connected to the underlying GraphQL API
  // Forward queries and mutations to the GraphQL API
  const makeDatabaseServiceLink = () =>
    createHttpLink({
      uri: `https://api.graph.cool/simple/v1/${DATABASE_SERVICE_ID}`,
      fetch
    });

  // 2. Retrieve schema definition of the underlying GraphQL API
  // Only the schema definition, not executable
  const databaseServiceSchemaDefinition = await introspectSchema(
    makeDatabaseServiceLink()
  );

  // 3. Create the executable schema based on schema definition and Apollo Link
  // There's no introspection for resolvers, so we use the link to forward incoming queries and mutations
  // This is executable!
  const databaseServiceExecutableSchema = makeRemoteExecutableSchema({
    schema: databaseServiceSchemaDefinition,
    link: makeDatabaseServiceLink()
  });

  // 4. Create and start proxy server based on the executable schema
  const server = new GraphQLServer({ schema: databaseServiceExecutableSchema });
  server.start(() => console.log("Server is running on http://localhost:4000"));
}

run();
```

## Bindings

Fantastic diagram here: https://cdn-images-1.medium.com/max/1600/1*I4zR2442zdvwlwmCH5x0FQ.png

You have this schema:

```javascript
type Query {
  hello(name: String): String!
}
```

Instead of constructing a query string to send to the API yourself using `fetch` or `graphql-request` or some GraphQL client:

```javascript
query {
  hello
}

query {
  hello(name: "Nikolas")
}
```

How about calling it yourself like this:

```javascript
helloWorldBinding.query.hello().then(result => console.log(result));

helloWorldBinding.query
  .hello({ name: "Nikolas" })
  .then(result => console.log(result));
```

Behind the scenes the bindings are doing the GraphQL query and request for you!

Why do this?

* Easier than constructing an entirely new GraphQL query
* No need to fiddle with authentication
* Typing for error checking and IDE autocompletion. You can have typed inputs and outputs.
* Reusable, shared on NPM to be used anywhere
  * Hey, you wanna query my API? Here's a nice library. It's using GraphQL under the hood but you don't need to worry about that.

`graphql-binding` is CLI tool that generates the bindings code for you.

They basically allow you to easily access GraphQL APIs from a script. This is great if you have a GraphQL server already and want to connect to another one. Or you're just wanting to hit up an API without worrying about all the GraphQL query stuff. Or you want to add some functionality to an existing GraphQL API.

Here's a simple little node script. You want to query the GraphQL API. Here's an easy way:

```javascript
const userBinding = require("graphql-binding-users");

// Create a new `User`
userBinding.mutation
  .createUser(
    {
      name: "Alice"
    },
    `{ id }`
  )
  .then(({ id }) => console.log(`The ID of the created user is: ${id}`));
```

The bindings will send this mutation to the GraphQL API:

```javascript
mutation {
  createUser(name: "Alice") {
    id
  }
}
```

And this one:

```javascript
const userBinding = require("graphql-binding-users");

// Retrieve all `User`s
userBinding.query
  .users({}, `{ id name }`)
  .then(users => console.log(`Retrieved all users: ${users}`));
```

Function call:

```javascript
query {
  users {
    id
    name
  }
}
```

Here's a better example. This is contrived, generally you would be working with remote schemas, not have it all in one file.

```javascript
const { makeExecutableSchema } = require("graphql-tools");
const { Binding } = require("graphql-binding");

const users = [
  {
    name: "Alice"
  },
  {
    name: "Bob"
  }
];

const typeDefs = `
  type Query {
    findUser(name: String!): User
  }
  type User {
    name: String!
  }
`;

const resolvers = {
  Query: {
    findUser: (parent, { name }) => users.find(u => u.name === name)
  }
};

const schema = makeExecutableSchema({ typeDefs, resolvers });

// Create the bindings
const findUserBinding = new Binding({
  schema
});

// Now the access functions are automatically created based on the schema
findUserBinding.query.findUser({ name: "Bob" });
```

You're building a GraphQL server. You want to expose a query that returns the number of stars on your GitHub project. You could use `fetch` and interact with the GraphQL API directly. Another way is to use bindings.

Why? The strength of GraphQL is strongly typed schema. But if you're suddenly accessing GraphQL APIs, the types are lost. Bindings allow you to pass along typed functions instead of sending raw queries.

Bindings work for queries, mutations, and subscriptions.

GraphQL bindings are building blocks. They allow you to embed existing GraphQL APIs into your own GraphQL server.

So you don't need to know any of the GraphQL APIs details. The endpoint, the authorization, etc. It's all abstracted away into the binding.

You can take a bunch of bindings from different GraphQL APIs and create a single GraphQL server that exposes parts of them.

### Using info object

When implementing GraphQL resolvers you pass the info param. This is an AST representation of the query.

Imagine this schema:

```javascript
type Query {
  user(id: ID!): User
}

type Mutation {
  createUserWithRandomName: User!
}
```

Someone might want `id` from User, and some might want `id` and `name` and `username` and whatever. How do you carry this along?

```javascript
const userBinding = require('graphql-binding-users')
const generateName = require('sillyname')

const resolvers = {
  Query: {
    user: async (parent, args, context, info) => {
      const users = await userBinding.query.users({}, info)
      return users.find(user => user.id === args.id)
    },
  },
  Mutation: {
    createUserWithRandomName: (parent, args, context, info) => {
      const sillyName = generateName()
      return userBinding.mutation.createUser(
        {
          name: sillyname,
        },
        info,
      )
  }
}
```

Notice the use of `info`. The selection set is not hardcoded anymore, it's determined from the incoming query. The info knows the requested fields from the selection set.

### A more complex example

Take this existing simple GraphQL API:

```javascript
const { makeExecutableSchema } = require("graphql-tools");

let idCount = 0;
const posts = [];

const typeDefs = `
type Query {
  posts: [Post!]!
  post(id: ID!): Post
  description: String!
}

type Mutation {
  createPost(title: String!, content: String!, published: Boolean): Post!
  updatePost(id: ID!, title: String, content: String, published: Boolean): Post
  deletePost(id: ID!): Post
}

type Post {
  id: ID!
  title: String!
  content: String!
  published: Boolean!
}
`;

const resolvers = {
  Query: {
    posts: () => posts,
    post: (parent, args) => posts.find(post => post.id === args.id)
  },
  Mutation: {
    createPost: (parent, args) => {
      const post = {
        id: `post_${idCount++}`,
        title: args.title,
        content: args.content,
        published: Boolean(args.published)
      };
      posts.push(post);
      return post;
    },
    updatePost: (parent, args) => {
      const postIndex = posts.findIndex(post => post.id === args.id);
      posts[postIndex].title = args.title ? args.title : posts[postIndex].title;
      posts[postIndex].content = args.content
        ? args.content
        : posts[postIndex].content;
      posts[postIndex].published = Boolean(args.published);
      return posts[postIndex];
    },
    deletePost: (parent, args) => {
      const postIndex = posts.findIndex(post => post.id === args.id);
      const deleted = posts.splice(postIndex, 1);
      return deleted[0];
    }
  }
};

const schema = makeExecutableSchema({ typeDefs, resolvers });

module.exports = schema;
```

And in a separate file, we import the schema and create bindings. This is all done automatically! Magic!

```javascript
const { Binding } = require("graphql-binding");
const schema = require("../../post-service/src/schema");

class PostBinding extends Binding {
  constructor() {
    super({ schema });
  }
}

module.exports = PostBinding;
```

Now we have our own GraphQL server. We want to use that one above, and add a few features. Like searhing for posts, creating drafts, publishing drafts, etc.

We import the binding and go for it:

```javascript
const { addFragmentToInfo } = require("graphql-binding");
const { GraphQLServer } = require("graphql-yoga");
const PostBinding = require("./postBinding");

const postBinding = new PostBinding();

const typeDefs = `
type Query {
  posts(searchString: String): [Post!]!
}

type Mutation {
  createDraft(title: String!, content: String!): Post
  publish(id: ID!): Post
  deletePost(id: ID!): Post
}

type Post {
  id: ID!
  title: String!
  content: String!
  published: Boolean!
}
`;

const resolvers = {
  Query: {
    posts: async (parent, args, ctx, info) => {
      const searchString = args.searchString ? args.searchString : "";
      const ensureTitleAndContentFragment = `
        fragment EnsureTitleAndContentFragment on Post {
          title
          content
        }
      `;
      const allPosts = await postBinding.query.posts(
        {},
        addFragmentToInfo(info, ensureTitleAndContentFragment)
      );

      return allPosts.filter(
        post =>
          post.title.includes(searchString) ||
          post.content.includes(searchString)
      );
    }
  },
  Mutation: {
    createDraft: (parent, args, ctx, info) => {
      return postBinding.mutation.createPost(
        {
          title: args.title,
          content: args.content,
          published: false
        },
        info
      );
    },
    publish: (parent, args, ctx, info) => {
      return postBinding.mutation.updatePost(
        {
          id: args.id,
          published: true
        },
        info
      );
    },
    deletePost: (parent, args, ctx, info) => {
      return postBinding.deletePost(
        {
          id: args.id
        },
        info
      );
    }
  }
};

const server = new GraphQLServer({ typeDefs, resolvers });
server.start(() => console.log(`Your GraphQL server is running now ...`));
```

Here is binding to external services:

```javascript
const fs = require("fs");
const path = require("path");
const fetch = require("node-fetch");
const { Binding } = require("graphql-binding");
const { HttpLink } = require("apollo-link-http");
const { makeRemoteExecutableSchema } = require("graphql-tools");

class RemoteBinding extends Binding {
  constructor({ typeDefsPath, endpoint }) {
    const link = new HttpLink({ uri: endpoint, fetch });
    const typeDefs = fs.readFileSync(
      path.join(__dirname, typeDefsPath),
      "utf-8"
    );

    const schema = makeRemoteExecutableSchema({ link, schema: typeDefs });

    super({ schema });
  }
}

module.exports = RemoteBinding;
```

And the implementation:

```javascript
const postServiceBinding = new RemoteBinding({
  typeDefsPath: "../schemas/post-service.graphql",
  endpoint: "https://post-service-nyvvyjtbyt.now.sh"
});
const userServiceBinding = new RemoteBinding({
  typeDefsPath: "../schemas/user-service.graphql",
  endpoint: "https://user-service-lvzqpqmeqb.now.sh/"
});

const server = new GraphQLServer({
  typeDefs: "./src/schema.graphql",
  resolvers,
  context: req => ({
    ...req,
    userService: userServiceBinding,
    postService: postServiceBinding
  })
});
```

### Graphql Binding CLI

It can also be installed globally and used as a CLI tool

Pass in schema, get bindings output. Supports TypeScript,

## Imports

You may want to break your SDL schema files into multiple files.

How do you import between them like ES6 modules?

They are done via comments:

Import specific types: # import A from 'schema.graphql'
Import multiple types: # import A, B, C from 'schema.graphql'
Import all types: # import _ from 'schema.graphql'
Import root fields: # import Query._ from 'schema.graphql'
Relative paths: # import A from "../database/schema.graphql"

Acheived by using `graphql-import`.

```javascript
import { importSchema } from "graphql-import";
import { makeExecutableSchema } from "graphql-tools";

const typeDefs = importSchema("schema.graphql");
const resolvers = {};

const schema = makeExecutableSchema({ typeDefs, resolvers });
```

## Middleware

Good for logging, authorization, altering inputs, measuring performance.

Usage:

```javascript
import { applyMiddleware } from "graphql-middleware";

const schemaWithMiddleware = applyMiddleware(schema, beepMiddleware);

const beepMiddleware = {
  Query: {
    hello: async (resolve, parent, args, context, info) => {
      // Alter arguments before sending them off
      const argsWithDefault = { name: "Bob", ...args };
      // Send off to original
      const result = await resolve(parent, argsWithDefault, context, info);
      // Alter the result
      return result.replace(/Trump/g, "beep");
    }
  }
};
```

Or with `graphql-yoga` just pass an array of your middleware as above into the server:

```javascript
const server = new GraphQLServer({
  typeDefs,
  resolvers,
  fieldMiddleware: [authMiddleware, metricsMiddleware],
  documentMiddleware: []
});
```
