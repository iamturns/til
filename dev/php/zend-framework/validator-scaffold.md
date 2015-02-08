Zend framework validator scaffold
=================================

```
<?php

class App_Validate_Example extends Zend_Validate_Abstract
{

    const SOMETHING_MISSING = 'somethingMissing';
    const SOMETHING_BAD     = 'somethingBad';

    public $_variableName;

    protected $_messageVariables = array(
        'msgName' => '_variableName',
    );

    protected $_messageTemplates = array(
        self::SOMETHING_MISSING => "'%value%' is missing",
        self::SOMETHING_BAD => "'%value%' must be at least %msgName% tall",
    );

    public function _construct($variableName = null)
    {
        $this->_variableName = $variableName;
    }

    public function setVariableName($variableName)
    {
        $this->_variableName = $variableName;
    }

    public function getVariableName()
    {
        return $this->_variableName;
    }

    public function isValid($value)
    {

        $this->_setValue($value);

        if(something) {
            $this->_error(static::SOMETHING_BAD);
            return false;
        }

        return true;

    }

}
```