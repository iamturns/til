<?php

// Work in progress.. will become its own Git Repo soon enough

/**
 * @param int $timestamp
 * @param int $timestampCompare defaults to current timestamp
 * @param string $suffixFuture
 * @param string $suffixPast
 * @param string $timestampEqual
 * @param string $timestampUnknown
 * @return string
 */
function ily_date_diff(
    $timestamp,
    $timestampCompare = null,
    $suffixFuture = 'away',
    $suffixPast = 'ago',
    $timestampEqual = 'Just now',
    $timestampUnknown = '-'
) {

    if (!$timestamp) {
        return $timestampUnknown;
    }

    if (!$timestampCompare) {
        $timestampCompare = time();
    }

    if ($timestamp == $timestampCompare) {
        return $timestampEqual;
    }

    if ($timestamp >= $timestampCompare) {
        $suffix = $suffixFuture;
        $diffSeconds = $timestamp - $timestampCompare;
    } else {
        $suffix = $suffixPast;
        $diffSeconds = $timestampCompare - $timestamp;
    }

    $periodDetails = array(
        'y' => array(
            'full'    => 'year',
            'seconds' => 31570560,
        ),
        'm' => array(
            'full'    => 'month',
            'seconds' => 2630880,
        ),
        'w' => array(
            'full'    => 'week',
            'seconds' => 604800,
        ),
        'd' => array(
            'full'    => 'day',
            'seconds' => 86400,
        ),
        'h' => array(
            'full'    => 'hour',
            'seconds' => 3600,
        ),
        'i' => array(
            'full'    => 'minute',
            'seconds' => 60,
        ),
        's' => array(
            'full'    => 'second',
            'seconds' => 1,
        )
    );

    foreach ($periodDetails as $periodDetail) {

        $number = floor($diffSeconds / $periodDetail['seconds']);

        if ($number < 1) {
            continue;
        }

        $periodTitle = $periodDetail['full'];

        if ($number > 1) {
            $periodTitle .= 's';
        }

        return $number . ' ' . $periodTitle . ' ' . $suffix;

    }

    return $timestampUnknown;

}

/**
 * Usage: $name = ifsetor($_POST['name'], '');
 * @param mixed the variable to check isset()
 * @param mixed $default the variable to return if $x is not set
 * @return mixed if $x isset() it will return that, otherwise will return $default
 */
function ifsetor(&$x, $default = null)
{
    if(isset($x)) return $x;
    return $default;
}

/**
 * Tests if the variable isset and is not empty
 * Usage: $name = ifnotemptyor($_POST['name'], '');
 * @param mixed the variable to check issets() and if()
 * @param mixed $default the variable to return if $x is not set and false
 * @return mixed if $x isset and satisfies if() it will return that, otherwise will return $default
 */
function ifnotemptyor(&$x, $default = null)
{
    if(!empty($x)) return $x;
    return $default;
}

<?php

function ily_string_left($string, $count) {
    return substr($string, 0, $count);
}

function ily_string_right($string, $count) {
    return substr($string, -$count, $count);
}

function ily_string_left_chop($string, $count) {
    return substr($string, $count);
}

function ily_string_right_chop($string, $count) {
    return substr($string, 0, strlen($string) - $count);
}

function ily_string_starts_with($string, $what)
{
    return (substr($string, 0, strlen($what)) == $what);
}

function ily_string_ends_with($string, $what)
{
    return (substr($string, -strlen($what), strlen($what)) == $what);
}

function ily_string_has($string, $find)
{
    return (stripos($string, $find) !== false);
}

function ily_string_cut_at($string, $what)
{
    return substr($string, 0, strpos($string, $what));
}