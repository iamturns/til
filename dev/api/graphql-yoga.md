# GraphQL Yoga

Like the `create-react-app` of GraphQL servers.

Fully featured GraphQL server. Based on Node.js with Express and Apollo server.

Abstracts away complexities in starting from scratch.

Focus on easy setup, performance, and great DX.

Basically you use Prisma to generate the queries and mutations and stuff, and then add on your own custom Queries and Mutations and whatever with some resolvers. I'm not sure, but possibly in this setup it doesn't use the Prisma endpoint, and you MUST implement all queries with prisma binding?

It seems that is true. In which case, why do we need generated/prisma.graphql if we are implementing all the queries and resolvers n stuff anyways?

TODO

## Example

Typedefs:

```javascript
const typeDefs = `
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
`;
```

Resolvers:

```javascript
let idCount = 0;
const posts = [];

const resolvers = {
  Query: {
    description: () => `This is the API for a simple blogging application`,
    posts: () => posts,
    post: (parent, args) => posts.find(post => post.id === args.id)
  },
  Mutation: {
    createDraft: (parent, args) => {
      const post = {
        id: `post_${idCount++}`,
        title: args.title,
        content: args.content,
        published: false
      };
      posts.push(post);
      return post;
    },
    deletePost: (parent, args) => {
      const postIndex = posts.findIndex(post => post.id === args.id);
      if (postIndex > -1) {
        const deleted = posts.splice(postIndex, 1);
        return deleted[0];
      }
      return null;
    },
    publish: (parent, args) => {
      const postIndex = posts.findIndex(post => post.id === args.id);
      posts[postIndex].published = true;
      return posts[postIndex];
    }
  }
};
```

And the server:

```javascript
import { GraphQLServer } from "graphql-yoga";

const server = new GraphQLServer({ typeDefs, resolvers });
server.start(() => console.log("Server is running on localhost:4000"));
```
