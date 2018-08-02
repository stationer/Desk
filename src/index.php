<?php

namespace Stationer\Pencil;

use Stationer\Graphite\Runtime;
use Stationer\Graphite\Profiler;

// Requires the Composer autoloader in a way that works deployed or locally
require_once preg_replace('~src/?$~', '', __DIR__).'/vendor/autoload.php';

Runtime::getInstance()->main();
exit;

// A demonstration of using the Profiler.
$Profiler = Profiler::getInstance();
$Profiler->mark('test');
$Profiler->stop('test');
var_dump($Profiler->get());

