Drupal entity wrappers
======================

Definitely the best way to retrieve data from an entity

This helper function retrieves the entity wrapper from a field collection item;

```
/**
 * @param array $item
 * @return EntityMetadataWrapper
 */
function entity_wraper_get_from_field_collection_item($item)
{

    if (!isset($item['entity'])) {
        return null;
    }

    $entityDetails = $item['entity'];

    if (!is_array($entityDetails) || count($entityDetails) != 1) {
        return null;
    }

    $fieldCollection = array_shift($entityDetails);

    if (!is_array($fieldCollection) || count($fieldCollection) != 1) {
        return null;
    }

    $fieldCollectionDetails = array_shift($fieldCollection);

    if (!isset($fieldCollectionDetails['#entity'])) {
        return null;
    }

    $entity = $fieldCollectionDetails['#entity'];

    if (get_class($entity) != 'FieldCollectionItemEntity') {
        return null;
    }

    return entity_metadata_wrapper('field_collection_item', $entity);

}
```

And this helper function eases the slightly complex API of fetching a value from an entity wrapper;

```
/**
 * @param EntityMetadataWrapper $wrapper
 * @param $fieldName
 * @param $sanitized
 * @return string
 */
function entity_wrapper_get_value($wrapper, $fieldName, $sanitized = true)
{

    if (!$wrapper) {
        return false;
    }

    try {
        $field = $wrapper->{'field_' . $fieldName};
    } catch(EntityMetadataWrapperException $e) {
        return false;
    }

    if (!method_exists($field, 'type')) {
        return false;
    }

    $fieldType = $field->type();

    if ($fieldType == 'text_formatted') {

        $fieldValue = $field->value();

        $fieldValueKey = ($sanitized) ? 'safe_value' : 'value';

        return ifsetor($fieldValue[$fieldValueKey], null);

    }

    if ($fieldType == 'field_item_image') {

        $fieldValue = $field->value();

        if ($sanitized) {

            return ifsetor($fieldValue['uri'], null);

        }

        return $fieldValue;

    }

    return $field->value(array('sanitize' => $sanitized));

}
```