Symfony logging
===============

```
/* @var $logger \Symfony\Bridge\Monolog\Logger */
$logger = $this->getContainer()->get('logger');

$logger->info('Info');
$logger->debug('Debug');
$logger->warning('Warning');
$logger->error('Error');
$logger->critical('Critical');
$logger->emergency('Emergency');
```
