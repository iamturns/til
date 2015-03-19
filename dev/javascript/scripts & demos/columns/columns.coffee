(($) ->

  $.ColumnCalculator = class ColumnCalculator

    constructor: (@items, @columnsRequired) ->
      @itemCount = @items.length

    toColumns: ->
      columnCounts = @_calculateColumnCounts()
      @_calculateColumns(columnCounts)

    _calculateColumnCounts: ->
      minItemsPerColumn = Math.floor(@itemCount / @columnsRequired)
      maxItemsPerColumn = minItemsPerColumn + 1
      numberOfMinColumns = @itemCount % @columnsRequired

      columnCounts = []

      for columnNumber in [1..@columnsRequired] by 1

        columnCount = maxItemsPerColumn
        if columnNumber > numberOfMinColumns
          columnCount = minItemsPerColumn

        columnCounts.push(columnCount)

      columnCounts

    _calculateColumns: (columnCounts) ->
      columns = []
      itemsProcessed = 0

      for columnCount in columnCounts
        columnItems = @items.slice(itemsProcessed, itemsProcessed + columnCount)
        columns.push(columnItems)

        itemsProcessed += columnCount

      columns

  $.fn.toColumns = (columnsRequired) ->
    columnizr = new $.ColumnCalculator(@, columnsRequired)
    return columnizr.toColumns()

)(jQuery)