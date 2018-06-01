<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '0000' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'aJB4cW;lzZQ!lF=)hal6[v PN,WK&@Eqn+3HXoS = V0(u*>ffi?$)s6J/81sgAA' );
define( 'SECURE_AUTH_KEY',  'VANe^M-]?Vn%&JjDanlv-!&68-dHv_|Fwv/^iR$zv(z*l?{93fXvi-e6AZ9CzM<1' );
define( 'LOGGED_IN_KEY',    'bSz>V8T?;ui%ru-A}`9f1O[/Jn5?:GW)~jUgp`5I=L,sE(EqA!z+sLgV/%T62VJ;' );
define( 'NONCE_KEY',        'QimM)=E^S`6>o<p}0T!1;`{crW6sOHa.qV#H!/KaT?s8-3m;JkI)X:J`BIS&:R<Y' );
define( 'AUTH_SALT',        '~7K?eZs|zsL2a0ZSjt-2.S;TbcRNO|2O?hr[we0odut4j_sxkq=~?lv!7Oe@Qr9s' );
define( 'SECURE_AUTH_SALT', 'OecOtP>`YwNV1n6d4~Ao,V8)0f#0DfQu!#3?oH|)Q_h${Q#HjR7q+<yV0jW9~wq{' );
define( 'LOGGED_IN_SALT',   'Dz)6oevKTHKHNCM:LI[?xg05Z?]+(6-4fbQ;lWnCe%@Mx&&dUr!fu#cgZ=N]+n3[' );
define( 'NONCE_SALT',       'w(@Ll2dPcce +B,+ -,oNN:&Bt+]r9)!I7^u4|?TT_|ZM+UU.wgW=7gDLa+`,c8u' );

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';




/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
