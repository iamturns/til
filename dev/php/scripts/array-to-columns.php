<?php

//TODO - move this into a github repo someday

/**
 * @param array $items
 * @param int $columnsRequired
 * @return array
 */
public function getColumns($items, $columnsRequired)
{
    $columnCounts = $this->_getColumnCounts($items, $columnsRequired);
    $columns = $this->_getColumns($items, $columnCounts);
    return $columns;
}

/**
 * @param array $items
 * @param int $columnsRequired
 * @return array
 */
protected function _getColumnCounts($items, $columnsRequired)
{

    $minItemsPerColumn = floor(count($items) / $columnsRequired);
    $maxItemsPerColumn = $minItemsPerColumn + 1;
    $numberOfMinColumns = count($items) % $columnsRequired;

    $columnCounts = array();

    for ($columnNumber = 0; $columnNumber < $columnsRequired; $columnNumber++) {
        if ($columnNumber < $numberOfMinColumns) {
            $columnCounts[] = $maxItemsPerColumn;
        } else {
            $columnCounts[] = $minItemsPerColumn;
        }
    }

    return $columnCounts;

}

/**
 * @param array $items
 * @param array $columnCounts
 * @return array
 */
protected function _getColumns($items, $columnCounts)
{

    $columns = array();
    $itemsProcessed = 0;

    foreach ($columnCounts as $columnCount) {

        $columns[] = array_slice($items, $itemsProcessed, $columnCount);

        $itemsProcessed += $columnCount;

    }

    return $columns;

}