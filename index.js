const express = require("express");
const { postgraphile } = require("postgraphile");
const PgSimplifyInflectorPlugin = require("@graphile-contrib/pg-simplify-inflector");

const app = express();

app.use(
  postgraphile(process.env.DATABASE_URL || "postgres://localhost/bravado_db?sslmode=disable", "bravado_db", {
    dynamicJson: true,
    appendPlugins: [PgSimplifyInflectorPlugin],
    graphqlRoute: '/graphql',
    graphiqlRoute: '/graphiql',
    graphiql: true,
    enhanceGraphiql: true,
    watchPg: process.env.NODE_ENV !== "production",
  })
);
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Running on port... ${PORT}`));