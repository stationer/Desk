<?php

namespace Stationer\Pencil;

use Stationer\Graphite\data\DataBroker;
use Stationer\Graphite\G;
use Stationer\Graphite\models\Login;
use Stationer\Graphite\models\Role;
use Stationer\Graphite\Runtime;

// Requires the Composer autoloader in a way that works deployed or locally
require_once preg_replace('~src/?$~', '', __DIR__).'/vendor/autoload.php';

$Runtime = Runtime::getInstance();
$Runtime->init();

/** @var DataBroker $DB */
$DB = G::build(DataBroker::class);

// If we're a web-request, output a <pre> for formatting
if ('cli' != php_sapi_name()) {
    echo '<pre>';
}

// Create tables
echo "Creating Tables\n";
foreach (['graphite','barrel','pencil','lastword'] as $module) {
    $schema = file_get_contents(SITE."/vendor/stationer/$module/schema.sql");
    $queries = explode(';', $schema);
    foreach ($queries as $query) {
        G::$M->query($query);
    }
}

// Ensure root Login exists
echo "Checking for root Login\n";
$Login = $DB->byPK(Login::class, 1);
if (false === $Login) {
    echo "Creating root Login with password 12345\n";

    $Login = G::build(Login::class, [
        'login_id'    => 1,
        'loginname'   => 'root',
        'password'    => '12345',
        'realname'    => 'Administrator',
        'email'       => '',
        'comment'     => 'Auto-generated user',
        'referrer_id' => 0,
    ]);
    $result = $DB->insert($Login);
    echo "Creating root Login ".($result ? "Succeeded" : "Failed")."\n";
}

echo "Checking for root Login\n";
$roles = ['Admin','Admin/Login','Admin/Roles','Pencil'];
foreach ($roles as $role) {
    echo "Checking for $role Role\n";

    $Role = $DB->fetch(Role::class, ['label' => $role]);
    if (is_array($Role) && !empty($Role)) {
        echo "Found $role Role\n";
        $Role = array_pop($Role);
    }
    if (empty($Role)) {
        echo "Creating $role Role\n";
        $Role = G::build(Role::class, [
            'creator_id'  => 1,
            'label'       => $role,
        ]);
        $result = $DB->insert($Role);
        echo "Creating $role Role ".($result ? "Succeeded" : "Failed")."\n";
    }
    echo "Granting $role Role to root Login\n";
    $Role->grant(1);
}
echo "Done\n";
