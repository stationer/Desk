<?php
/**
 * Site config.
 *
 * Name as, for example, "config.yourwebsite.com.php"
 *
 * Override default Graphite and Graphite Module configs here.
 *
 * use Stationer\Graphite\G to access config array
 */

use Stationer\Graphite\G;

// Controls where classes and templates can be loaded from
G::$G['includePath'] = '/vendor/stationer/barrel/src;/vendor/stationer/pencil/src';

// prd,tst,dev... used to flag debug behaviors
G::$G['MODE'] = 'prd';

// Read/Write database credentials
G::$G['db']['host'] = 'localhost';
G::$G['db']['user'] = '';
G::$G['db']['pass'] = '';
G::$G['db']['name'] = 'GraphiteDB';

// Read-only database credentials
// When set, Graphite will do all DB fetching via the Read-only connection
G::$G['db']['ro']['host'] = G::$G['db']['host'];
G::$G['db']['ro']['user'] = '';
G::$G['db']['ro']['pass'] = '';
G::$G['db']['ro']['name'] = G::$G['db']['name'];

// This will be prefixed to all tablenames, useful for hosting multiple installations in one DB
G::$G['db']['tabl'] = '';

// Whether to log queries for debug output at end of each request
G::$G['db']['log'] = true;

// Default Controller to call when requesting root of site
G::$G['CON']['controller'] = 'Home';

// Default <title> of site
G::$G['VIEW']['_siteName'] = 'Graphite Site';

// Default site email for contact forms and such
G::$G['siteEmail'] = 'fake.email@fakedomain.tld';
