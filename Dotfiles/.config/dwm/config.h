/* See LICENSE file for copyright and license details. */
#include "/home/andrade/.cache/wal/colors-wal-dwm.h"
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int gappx     = 10;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;    /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;        /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = {"JetBrains Mono Nerd Font:style=Medium:size=13"};
static const char dmenufont[]       = "JetBrains Mono Nerd Font:style=Medium:size=13";

/* tagging */
static const char *tags[] = { " 󰼏 ", " 󰼐 ", " 󰼑 ", " 󰼒 ", "󰼓 ", "󰼔 ", "󰼕 ", "󰼖 ", "󰼗 " };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "qutebrowser", NULL,    NULL,       1 << 0,       0,           -1 },
        { "firefox",  NULL,       NULL,       1 << 0,       0,           -1 },
	{ "Ripcord",  NULL,       NULL,       1 << 1,       0,           -1 },
	{  NULL,      NULL,       "nnn",      0,            1,           -1 },
	{ "steam",    NULL,	  NULL,	      1 << 2,       0,           -1 }, 
	{  NULL,      NULL,       "pulsemixer", 0, 	    1,           -1 },
	{  NULL,      NULL,       "Webcam",   0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "  ",      tile },    /* first entry is default */
	{ "  ",      NULL },    /* no layout function means floating behavior */
	{ " [M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-i", "-p", " Run  ", NULL };
static const char *termcmd[] = { "st", NULL };
static const char *nnncmd[] = { "/bin/zsh", "-l", "-c", "source ~/.zshrc; st -e nnn -C", NULL };
static const char *htcmd[] = { "st", "-e", "htop" };
static const char *voldowncmd[] = { "pamixer", "-d", "5", NULL };
static const char *volupcmd[] = { "pamixer", "-i", "5", NULL };
static const char *mutecmd [] = { "pamixer", "-t", NULL };
static const char *brdowncmd [] = { "xbacklight", "-dec", "10" }; 
static const char *brupcmd [] = { "xbacklight", "-inc", "10" };
static const char *bttcmd [] = { "st", "-e", "bluetoothctl", NULL };
static const char *pavucmd[] = { "st", "-e", "pulsemixer" };
static const char *browcmd[] = { "qutebrowser", NULL };
/*static const char *foxcmd[] = { "firefox", NULL }; */
static const char *ripcmd[] = { "Ripcord", NULL };
static const char *minecmd[] = { "minecraft-launcher", NULL };
static const char *spotcmd[] = { "st", "-e", "ncspot" };
static const char *clipcmd[] = { "clipmenu", NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
/* Dmenu */
        { MODKEY,                       XK_space,   spawn,         {.v = dmenucmd } },
	{ MODKEY,		        XK_c,       spawn,         SHCMD("~/Others/Scripts/Dmenu/dmenu-menus") },
	{ MODKEY,	                XK_x,	    spawn,         SHCMD("~/Others/Scripts/Dmenu/dmenu-power-menu") },
	{ MODKEY,	                XK_v,	    spawn,         {.v = clipcmd } },
	{ MODKEY,                       XK_period,  spawn,         SHCMD("~/Others/Scripts/Dmenu/dmenu-emojis") },
	{ MODKEY,			XK_z,       spawn,	   SHCMD("~/Others/Scripts/Dmenu/passmenu") },
/* System Applications */
	{ MODKEY,                       XK_Return,  spawn,         {.v = termcmd } },
	{ MODKEY,			XK_e,       spawn,	   {.v = nnncmd } },
	{ ControlMask|ShiftMask,        XK_Escape,  spawn,         {.v = htcmd } },
	{ MODKEY|ShiftMask,		XK_v,	    spawn,	   {.v = pavucmd } },
/* Funcion Keys */
	{ 0,				XF86XK_AudioMute,        spawn, {.v = mutecmd } },
	{ 0,				XF86XK_AudioLowerVolume, spawn, {.v = voldowncmd } },
	{ 0,         			XF86XK_AudioRaiseVolume, spawn, {.v = volupcmd } },
	{ 0, 				XF86XK_MonBrightnessDown, spawn, {.v = brdowncmd } },
	{ 0,				XF86XK_MonBrightnessUp,    spawn, {.v = brupcmd } },
	{ 0,				XF86XK_Bluetooth,	 spawn, {.v = bttcmd } },
/* Shortcut Applications */
	{ MODKEY|Mod1Mask,		XK_1,	   spawn,	   {.v = browcmd } },
/*      { MODKEY|Mod1Mask,              XK_1,      spawn,          {.v = foxcmd  } }, */
	{ MODKEY|Mod1Mask,		XK_2,	   spawn,	   {.v = ripcmd } },
	{ MODKEY|Mod1Mask,		XK_3,      spawn,          {.v = minecmd } },
	{ MODKEY|Mod1Mask,		XK_4,      spawn,	   {.v = spotcmd } },
/* System Keys */
	{ 0,				XK_Print,  spawn,          SHCMD("scrot ~/Media/Pictures/Screenshots/%Y-%m-%d_%H%M%S-$wx$h_screenshot-scrot.png -e 'xclip -selection clipboard -target image/png -i $f -verbose'") },
	{ MODKEY|ShiftMask,		XK_s,  	   spawn,	   SHCMD("scrot -s --line mode=edge ~/Media/Pictures/Screenshots/%Y-%m-%d_%H%M%S-$wx$h_screenshot-scrot.png -e 'xclip -selection clipboard -target image/png -i $f -verbose'") },
	{ MODKEY,			XK_g,	   spawn,	   SHCMD("~/Others/Scripts/screen_capture.sh") },
	{ ControlMask,                  XK_Shift_L, spawn,         SHCMD("setxkbmap -query | grep -q 'br' && setxkbmap us || setxkbmap br,us") },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_k,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_j,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_Left,   setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_Right,  setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_w,      killclient,     {0} },
	{ MODKEY,                       XK_n,      setlayout,      {0} },
	{ MODKEY,                       XK_s,      togglefloating, {0} },
        { MODKEY,                       XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -1 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = 0  } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|Mod1Mask,              XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

