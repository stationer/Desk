<?php

// Requires the Composer autoloader in a way that works deployed or locally
require_once preg_replace('~src/?$~', '', dirname(__DIR__)).'/vendor/autoload.php';

use Stationer\Graphite\Runtime;

Runtime::getInstance()->init();

if ('cli' != php_sapi_name()) {
    echo '<pre>';
}

$models = [
    '\Stationer\Graphite\models\Login',
    '\Stationer\Graphite\models\LoginLog',
    '\Stationer\Graphite\models\Role',
    '\Stationer\Barrel\models\ConfigLog',
    '\Stationer\Barrel\models\Email',
    '\Stationer\Pencil\models\Content',
    '\Stationer\Pencil\models\File',
    '\Stationer\Pencil\models\Form',
    '\Stationer\Pencil\models\Node',
    '\Stationer\Pencil\models\Page',
    '\Stationer\Pencil\models\Revision',
    '\Stationer\Pencil\models\Site',
    '\Stationer\Pencil\models\Submission',
    '\Stationer\Pencil\models\Tag',
    '\Stationer\Pencil\models\Template',
    '\Stationer\Pencil\models\Theme',
];
foreach ($models as $model) {
    echo "\n\n -- $model\n", $model::drop(true), "\n", $model::create(true), "\n";
}
