

DQL
===

Looks just like SQL, mostly. Eg:

```php
$em->createQuery('SELECT u FROM User u WHERE u.id = ?1 ORDER BY u.name ASC');
```

https://doctrine-orm.readthedocs.org/en/latest/reference/dql-doctrine-query-language.html

QueryBuilder
============

Much easier to use. Constructs DQL for you.

```php
$qb = $em->createQueryBuilder();
$qb->select('u')
  ->from('User', 'u')
  ->where('u.id = ?1')
  ->orderBy('u.name', 'ASC');

$dql = $qb->getDql();
$q = $qb->getQuery();
```

Parameters
==========

Positional
----------

```php
$query->where('something = ?1')
$query->setParameter(1, 'value');
```

Named
-----

Recommended!

```
$query->where('something = :name')
$query->setParameter('name', 'value');
```

Fetching results
================

```php

$hydrationMode = \Doctrine\ORM\Query::HYDRATE_OBJECT; (default)
$hydrationMode = \Doctrine\ORM\Query::HYDRATE_ARRAY;
$hydrationMode = \Doctrine\ORM\Query::HYDRATE_SCALAR;
$hydrationMode = \Doctrine\ORM\Query::HYDRATE_SINGLE_SCALAR;
$hydrationMode = \Doctrine\ORM\Query::HYDRATE_SIMPLEOBJECT;

$query->setHydrationMode(\Doctrine\ORM\Query::HYDRATE_ARRAY);
$query->execute();

//OR, simpler:

$query->getResult($hydrationMode);

//More shortcuts:

$query->getArrayResult(); //Alias for getResult(HYDRATE_ARRAY)
$query->getScalarResult(); //Alias for getResult(HYDRATE_SCALAR)
$query->getSingleScalarResult(); //Alias for getSingleResult(HYDRATE_SINGLE_SCALAR)

//Determine results returned:

$query->getSingleResult($hydrationMode); //throws an Exception if no results
$query->getOneOrNullResult($hydrationMode); //no exception :)

```

Symfony2
========

```php
$this->getDoctrine()
  ->getRepository('Bundle:EntityName')
  ->createQueryBuilder('alias')
  ->getQuery()
```

Partial queries
===============

If you start specifying what fields you'd like returned in your select, eg:

```php
->addSelect(â€˜main.id, main.name')
->addSelect('other.id, other.name')
```

Doctrine will return a flat array
It will NOT hydrate into nested results

If you don't mind the flatness, you can alias your joined select values, eg:

```php
->addSelect(â€˜main.id, main.name')
->addSelect('other.id as other_id, other.name as other_name')
```

Or, you can instruct Doctrine to populate objects with partial data, which retains hierarchy in result set

```php
->addSelect('partial alias.{id, name}')
->addSelect('partial other.{id, name}')
```

Relationships
=============

Two different types;

- Bidirectional
  - Both owning side and inverse side
- Unidirectional
  - Only has owning side

Owning side determines updates to the relationship in the database

This is the 'many' side in OneToMany / ManyToOne

Inverse side of bidirectional relationship must refer to owning side using *mappedBy* attribute

Owning side of bidirectional relationshup must refer to inverse side by *inversedBy* attribute

```php

class Artist
{

  /**
   * @ORM\OneToMany(targetEntity="Album", mappedBy="artist")
   */
  private $albums;

  public function __construct()
  {
    $this->albums = new \Doctrine\Common\Collections\ArrayCollection();
  }

}

class Album
{

  /**
   * @ORM\ManyToOne(targetEntity="Artist", inversedBy="albums")
   * @ORM\JoinColumn(name="artist_id", referencedColumnName="id")
   */
  private artist;

}
```

Sub queries
===========

```php

$q = Doctrine_Query::create()
    ->from('Something s')
    ->where('whatever');

$subquery = $q->createSubquery()
  ->select('se.id')
  ->from('SomethingElse se')
  ->where('whatever');

$q->andWhere('s.id IN (' . $subquery->getDql() . ')');

```
