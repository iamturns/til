Solr cheatsheet
===============

Directory and files
===================

```
/conf
schema.xml
solrconfig.xml
stopwords.txt

/data
index
spellchecker
```

solrconfig.xml
--------------

Loads plugins, sets access URLs, directories, listeners, warmup queries, etc


schema.xml
----------

Contains the field type definitions (filters, tokenizers, etc)

And field definitions (name, type, indexed, sored, multiValued, etc)

And possibly other instructions, eg: unique key field, fallback field, query adjustments, etc

Setup
=====

Fields
------

```
<field name="id" type="[field_type_name]" indexed="[boolean]" stored="[boolean]" multiValued="[boolean]" default="[value]" />
```

### Common options

#### indexed

Set to true if field should be searchable, sortable, or facetable

If true, goes through 'analysis' phase

Transformation applied (lower case, remove word stems, etc), and tokens added to index

#### stored

Set to true if field should be retrievable, or for using highlighting

Does not go through analysis phase

#### multiValued

Boolean

#### default

#### required

Will throw an error if the value does not exist

#### More

Including compressThreshold, omitNorms, termVectors, omitPositions

Copy fields
-----------

Instead of sending data twice to different fields, let Solr do it for you

```
<field name="one" />
<field name="two" />
<field name="three" />

<copyField source="two" dest="three" />
```

If you set something to 'two', it will be stored in 'two' and 'three'

A common requiremnt is to copy (or mege) all input fields into one solr field;

```
<copyField source="*" dest="allText"/>
```

Dynamic fields
--------------

Allows you to process many fields in a similar way

Most useful feature is using wildcards

```
<dynamicField name="*" param="value" />
```

Another common method is using a few dynamic fields to allow for schema-less indexing;

```
<dynamicField name="*_i" type="integer" indexed="true" stored="true" />
<dynamicField name="*_s" type="string" indexed="true" stored="true"/>
```

Field types
-----------

```
<fieldType name="xx" class="solr.BaseClass" defaultAttribute="defaultValue" />

<fieldType name="xx" class="solr.BaseClass">
    <analyzer>
        <tokenizer class="solr.ClassName" />
        <filter class="solr.ClassName" attribute="value" />
    </analyzer>
    <analyzer type="query">
        <!-- ... -->
    </analyzer>
</fieldType>
```

### Common field types

**string**

**boolean**

**int**

**float**

**long**

**double**

**date**

Format: 1995-12-31T23:59:59Z

**text_general**

Reasonable, generic cross-language defaults

Tokenizes, removes stop words, down cases

Applies synonyms at query time

**text_en**

Removes english stop words, down cases, applies stemming

**text_en_splitting**

Aggressive word-splitting and autophrase features enabled

'wi fi' will match 'WiFi' or 'Wi-Fi'

**text_en_splitting_tight**

Less flexible matching (use if you get false matches)

Good for SKUs (can insert dashes in wrong place and still match)

**binary**

**location**

**currency**

Importing data
==============

Methods
-------

### Database

Using "Data Import Handler" (DIH)

http://wiki.apache.org/solr/DataImportHandler

#### CSV file

Including those exported by MySQL

http://wiki.apache.org/solr/UpdateCSV

#### POST JSON documents

http://wiki.apache.org/solr/UpdateJSON

Multivalued fields
------------------

```
<field name="tags">tag1</field>
<field name="tags">tag2</field>
```

Partial Updates
---------------

aka Atomic Updates
Can send commands such as 'set', 'add', and 'inc'

Querying data
=============

Use HTTP GET

### q

Query string

To search all documents;

```
q=*:*
```

Query strings are based on Lucene syntax

```
at least one word +musthavethisword +andthistoo -butnotthis "exact phrase" "proximity matching"~5 (fieldname:boostme)^2
```

### fl

Field list

Specify set of fields to return, limiting amount of information in the response

Space or comma separated

Examples:

```

id, name

id, score

*

*, score

```

### fq

Filter query

Some examples:

```
fl=name,id
```

Field List - only name and id fields

```
fl=name,id,score
```

Return relevancy score too

```
fl=*,score
```

All fields and relevancy score

```
wt=json
```

Return response in JSON format

```
qf=title^2,feature
```

Fields and weighting to search

Sorting
-------

```
sort=price desc
```

Default sort is 'score desc'

Highlighting
------------

Uses em HTML tags to highlight relevant snippets in returned document

This example enables for 'name' and 'features' fields;

```
hl=true&hl.fl=name,features
```

Faceted search
--------------

Generates counts for various properties

Allows users to 'drill down' / refine their search

Request counts for category field 'cat':

```
facet=true&facet.field=cat
```

Add a facet on the boolean 'inStock' field:

```
facet=true&facet.field=cat&facet.field=inStock
```

Can also generate counts on the fly!

This example queries for prices below 100 and above 100 using range queries

```
facet=true&facet.query=price:[* TO 100]&facet.query=price:[100 TO *]
```

Field Collapsing
----------------

Collapses a group of results with same field value down to a single (or fixed number) of entries

Eg: google does this per site, so only a couple of entries per site are shown

Result Grouping
---------------

Groups documents with a common field value into groups, and returns top documents per group

Eg: search for DVD's, show top results for TV, Movies, Documentaries, etc

Boosting Results
----------------

Can be done a few ways - boost when indexing, or boost when querying

### Field based boosting

Store something such as important:true, and boost that match

### Function based boosting

Can read value (eg: property, or how recently updated the document is) and apply a boosting value

Query Parsers
============

The default query parser is DisMax

Also includes Lucene query parser (aka 'standard'), and Extended DisMax (aka 'eDisMax')

DisMax = similar to Google, rarely displays syntax errors to users

eDisMax = improves DisMax, handles full Lucene syntax, and more (@todo - like what?)

Common query params
--------------------

- sort
- start
- rows
- fq = filter query

Standard Parser
----------------

Enables users to specify very precise queries, however, it's less tolerant of syntax errors

Contains lots of Lucene stuff - fuzzy, proximity, boosting, phrasing, etc

https://cwiki.apache.org/confluence/display/solr/The+Standard+Query+Parser

### Common params

- q = query (mandatory)
- df = default field to query (usually defined in schema.xml file)

DisMax
------

Similar to Google. Rarely displays syntax error messages.

Implements an extremely simplified subset of Lucene QueryParser syntax (quotes, +, -)

Can also do boolean clauses and boosts in query

Solr administrator can provide additional boosting queries, functions, and filtering (solrconfig.xml)

These can be overridden in query URL

### Common params

- q = query
- qf = Query Fields. Which fields to perform query on. If absent, defaults to 'df'. Can contain boosting stuff.

eDisMax
-------

Supports full Lucene syntax

Seems it's always best to choose this over DisMax

Query params
------------

Set variables within query param

`q={!key1=value key2=value}regular query`

Faceting
========

### Params

- facet = if set to 'true', enables faceting
- facet.query = lucene query to generate facet count

More here: https://cwiki.apache.org/confluence/display/solr/Faceting

Request handlers
================

Handles requests coming to Solr. Perhaps query requests, or index update requests.

SearchHandler
-------------

`<requestHandler name="/select" class="solr.SearchHandler">`

Contains a bunch of 'lists';

- defaults = obvious
- appends = added to user queries
