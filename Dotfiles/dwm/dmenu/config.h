/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

#include "/home/andrade/.cache/wal/colors-wal-dmenu.h"

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"JetBrains Mono Nerd Font:style=Medium:size=13", "Noto Color Emoji:style=Regular:size=13"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
