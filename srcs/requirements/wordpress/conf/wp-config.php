<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
// define( 'DB_NAME', getenv('MYSQL_SERVER_NAME') );
define( 'DB_NAME', 'jvacaris_db');

/** Database username */
// define( 'DB_USER', getenv('MYSQL_USER') );
define( 'DB_USER', 'jvacaris');

/** Database password */
// define( 'DB_PASSWORD', getenv('MYSQL_ROOT_PASSWORD') );
define( 'DB_PASSWORD', 'P455w0rd');

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'yTg[23:[}{!||G!t.5Mn1;+rOi1`&MA:g]2~R@Pe:q9_aY8ce(lE]^[$.%kz`+3!');
define('SECURE_AUTH_KEY',  'pS{SM/ISf%+7G9/d0=M#3&l9S675q+7F|aOMasyRs5j{MW}~.. S^ZDFDM2<h/PT');
define('LOGGED_IN_KEY',    'x)ciTX{wCrIICiu,;iCioI<-trF96s9Bi6+>|nXWQ5iSNFx5[e=Z0]MCBo*E($+g');
define('NONCE_KEY',        '#^W-5P x%g*o11n]R+j#qI7+.b{R,9+~`zqiRtN1JiTy$>%G@C+Y6tGFPVs@DCDP');
define('AUTH_SALT',        'mAw.(*P5[g!Dh78Lrf;a9C&)0|_iowkAC:@sFc8h}X2m,ICtZ/A,G;uQnuD>5I|Z');
define('SECURE_AUTH_SALT', 'B$qPOc]Zh4Tvf++N@gCTDuRAj2g=m1)A)Hi<>IeOuT}Uns@&,X- gkl4AU`a:JV ');
define('LOGGED_IN_SALT',   '}_1`Sj4O78Jm^teWI@y+QIXaTUSE1QR&R<){{|e-f]DzD~.U-:Kb-U.+:}p;4%P?');
define('NONCE_SALT',       ' kDih5-+~ S22x]jp?~9mmgc**&Qj.;o+PA#GW)@vY/!.Oi0#+Lw]/Y3)t?&.@wj');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';




