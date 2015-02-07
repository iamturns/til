Zend Framework code standard reference
======================================

```
<?php

/**
 * Description of class
 */
class CamelCase_CamelCase
{

    /**
     * Optional description of constant
     */
    const UPPER_CASE = 'value';

    /**
     * Optional description of variable
     * @var datatype1|datatype2 optional desc
     */
    protected $_camelCase;

    /**
     * Optional description of function
     * @param datatype1|datatype2 $param optional desc
     * @return datatype1|datatype2 optional desc
     */
    public function camelCaseFunctionName($param)
    {

        $camelCaseVariableNames = 'value';

        $concatenatedString = 'foo' . ' ' . 'bar';

        $concatenatedMultiLineString = 'Line one'
                                     . 'Line two'
                                     . 'Line three';

        $array = array(
            'shortKey'          => 'val',
            'slightlyLongerKey' => 'val',
        );

        $result = $this->getObject()
            ->getAnotherObject()
            ->getResult();

        Class_Name::staticFunctionWithLongOrManyParamaters(
            'param 1',
            'param 2',
            'param 3',
            array(
                'key' => 'val',
                'key' => 'val',
            )
        );

        if ($a == $b) {

            //...

        } elseif ($c == $d) {

            //...

        } elseif (($e == $f)
                  && ($g == $h)
        ) {

            //...

        } elseif (($i == $j)
                  && ($k == $l)
                  || (($m == $n)
                      && ($o == $p))
        ) {

            //...

        }


        switch($a) {
            case 1:
                //...
                break;

            case 2:
                //...
                break;

            //Default is required
            default:
                //...
                break;
        }

        $foos = $this->_getArrayOfFooObjects();

        foreach ($foos as $foo) {
            /* @var $foo Foo */
            //...
        }

    }

    protected function _underscoreForPrivateOrProtectedFunctions()
    {
        //...
    }

    /**
     * @return Foo[]
     */
    protected function _getArrayOfFooObjects()
    {
        //....
    }

}
```