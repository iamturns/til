Doctrine query builder parts copy
=================================

Doctrine does not provide a way of copying query builder parts to another query builder object

Ta da!

```
<?php

/**
 * @param \Doctrine\ORM\QueryBuilder $queryBuilderFrom
 * @param \Doctrine\ORM\QueryBuilder $queryBuilderTo
 */
function queryBuilderPartsToQueryBuilderParts($queryBuilderFrom, $queryBuilderTo)
{

  $queryBuilderTo->resetDQLParts();

  foreach ($queryBuilderFrom->getDQLParts() as $partKey => $partVal) {

    if (empty($partVal)) {
      continue;
    }

    if (is_array($partVal)) {
      $partVal = current($partVal);
    }

    if ($partKey == 'join') {
      foreach ($partVal as $partValJoin) {
        $partValJoin = array($partValJoin);
        $queryBuilderTo->add($partKey, $partValJoin, true);
      }
    } else {
      $queryBuilderTo->add($partKey, $partVal);
    }
  }
}
```