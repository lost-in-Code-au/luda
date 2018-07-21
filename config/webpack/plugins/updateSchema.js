var introspectionQuery = require('graphql/utilities').introspectionQuery;
var request = require('sync-request');
var path = require('path');
var fs = require('fs');
var printSchema = require('graphql/utilities/schemaPrinter').printSchema;
var buildClientSchema = require('graphql/utilities/buildClientSchema').buildClientSchema;

var response = request('post', process.env.GRAPHQL_URL+'/graphql', {
  qs: {
    query: introspectionQuery
  }
});

var schema = JSON.parse(response.body.toString('utf-8'));
var schemaPath = path.resolve(__dirname, '../data/schema.graphql');

fs.writeFileSync(schemaPath, printSchema(buildClientSchema(schema.data)));