php documentor cheatsheet
=========================

**Return self**

```
/**
 * @returns self
 */
```

**Inheritence**

```
/**
 * {@inheritDoc}
 */
```

**Inline variable**

```
/* @var $variableName \Class\Name */
```

**Array of thangs**

```

/* @var $someObjects SomeObject[] */
foreach ($someObjects as $someObject) {
    //($someObject instanceof SomeObject) === true
}

/**
 * @return int[]
 */
```
