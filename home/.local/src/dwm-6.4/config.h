/* See LICENSE file for copyright and license details. */
#define XF86XK_AudioLowerVolume	0x1008FF11   /* Volume control down        */
#define XF86XK_AudioMute	0x1008FF12   /* Mute sound from the system */
#define XF86XK_AudioRaiseVolume	0x1008FF13   /* Volume control up          */
#define XF86XK_AudioPlay	0x1008FF14   /* Start playing of audio >   */
#define XF86XK_AudioStop	0x1008FF15   /* Stop playing audio         */
#define XF86XK_AudioPrev	0x1008FF16   /* Previous track             */
#define XF86XK_AudioNext	0x1008FF17   /* Next track                 */
#define XF86XK_AudioPause	0x1008FF31   /* Start playing of audio >   */
#define XF86XK_MonBrightnessUp   0x1008FF02  /* Monitor/panel brightness */
#define XF86XK_MonBrightnessDown 0x1008FF03  /* Monitor/panel brightness */
#define XF86XK_PowerOff		0x1008FF2A   /* Power off system entirely  */

#define HOME /home/sbdaule
#define SCR_H 1080
#define SCR_W 1920

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int gappx     = 8;        /* gaps between windows */
static const unsigned int snap      = 8;       /* snap pixel */
static const int rmaster            = 0;        /* 1 means master-area is initially on the right */
static const unsigned int systraypinning = 1;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;        /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int focusonwheel       = 0;
static const char *fonts[]          = {"monospace:size=12", "JetBrainsMono Nerd Font:style=bold:size=13"};
static const char dmenufont[]       = "JetBrainsMono Nerd Font:size=13";

/* static unsigned int baralpha        = 0xb0; */
/* static unsigned int borderalpha     = 0xff; */

static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";

static const char pcol1[]           = "#7aa2f7";
static const char pcol2[]           = "#9ece6a";
static const char bcol[]            = "#24283b";
static const char wcol[]            = "#f7768e";
static const char tcol[]            = "#c0caf5";
static const char purple[]          = "#bb9af7";
static const char yellow[]          = "#e0af68";

enum { SchemeNorm, SchemeSel, SchemeWarn, SchemePurple, SchemeBlue, SchemeYellow }; /* color schemes */

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { tcol,      bcol,      bcol  },
	[SchemeSel]  = { bcol,      pcol1,     pcol1 },
	[SchemeWarn] = { tcol,      wcol,      bcol },
	[SchemePurple]= { bcol,     purple,    bcol },
	[SchemeBlue]= { bcol,       pcol2,     bcol },
	[SchemeYellow]= { bcol,     yellow,    bcol },
};

/* tagging */
static const char *tags[] = { "󰅩 ", "󰣇 ", " ", "󱉟 ", " ", " ", " ", "󰊫 ", " ", " " };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */

	/* class,            instance, title,     tags mask, isfloating, monitor, scratchkey, float x,           y,          w,              h       floatborderpx, bg */
	{ "qutebrowser",     NULL,     NULL,      1 << 9,    0,          -1,      0,          0,                 0,          0,              0,                     2, 0 },
	{ "Gimp",            NULL,     NULL,      1 << 1,    0,          -1,      0,          0,                 0,          0,              0,                     2, 0 },
	{ "Alacritty:btop",  NULL,     NULL,      1 << 8,    0,          -1,      0,          0,                 0,          0,              0,                     2, 0 },
	{ "Alacritty:Music", NULL,     NULL,      1 << 5,    0,          -1,      0,          0,                 0,          0,              0,                     2, 0 },
	{ "Alacritty:Mixer", NULL,     NULL,      ~0,        1,          -1,      0,          0.5*SCR_W-6-gappx, 6+gappx*4,  0.5*SCR_W,      255,                   2, 0 },
	{ "Alacritty:nvim",  NULL,     NULL,      1 << 6,    0,          -1,      0,          0,                 0,          0,              0,                     2, 0 },
	{ "NoBlur:cava",     NULL,     NULL,      ~0,        1,          -1,      0,          gappx,             0.75*SCR_H, SCR_W -2*gappx, 0.25*SCR_H,            0, 1 },
	{ "Emacs",           NULL,     NULL,      1 << 3,    0,          -1,      0,          0,                 0,          0,              0,                     2, 0 },
	{ NULL,              NULL,     "Notepad", 0,         1,          -1,      'n',        0,                 6+gappx,    SCR_W * 0.4,    SCR_H - 6 - 2*gappx,   2, 0 },

  /*
	{ "Gimp",         NULL,       NULL,       0,            1,           -1,        50,50,500,500,    5,           0},
	{ "Firefox",      NULL,       NULL,       1 << 8,       0,           -1,        50,50,500,500,    5,           0},*/
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 0; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "[D]",      deck },
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
#define STATUSBAR "dwmblocks"

/* Media commands */
static const char *mutecmd[]  = {"pactl", "set-sink-mute", "@DEFAULT_SINK@", "toggle", NULL};
static const char *audioRise[]  = {"pactl", "set-sink-volume", "@DEFAULT_SINK@", "+01%", NULL};
static const char *audioLower[]  = {"pactl", "set-sink-volume", "@DEFAULT_SINK@", "-01%", NULL};
 
static const char *musicNextCmd[]  = {"playerctl", "next", NULL};
static const char *musicPrevCmd[]  = {"playerctl", "previous", NULL};
static const char *musicPlayCmd[]  = {"playerctl", "play-pause", NULL};
static const char *musicSeekBackCmd[] = {"playerctl", "position", "5-", NULL};
static const char *musicSeekFwdCmd[]  = {"playerctl", "position", "5+", NULL};
static const char *musicNextPlayer[]  = {"playerctld", "shift", NULL};
static const char *musicPrevPlayer[]  = {"playerctld", "unshift", NULL};
static const char *audioMixer[]  = { "/home/sbdaule/.local/src/dwmblocks/blocks/volume_button.sh", "3", NULL };

static const char *lowerBrightness[]  = {"brillo", "-q", "-U", "0.5", NULL};
static const char *riseBrightness[]  = {"brillo", "-q", "-A", "0.5", NULL};

static const char *screenshotComplete[]      = {"screenshot", "screen", NULL};
static const char *screenshotSelect[]        = {"screenshot", "select", NULL};
static const char *screenshotWindow[]        = {"screenshot", "window", NULL};
static const char *screenshotWindowSelect[]  = {"screenshot", "select_window", NULL};
 
static const char *logoutCmd[]  = {"killall", "startdwm", NULL};

/* rofi and dmenu menus */
static const char *powerMenu[] = {"/home/sbdaule/.config/rofi/scripts/powermenu.sh", NULL};
static const char *rofiCalc[] = {"rofi", "-show", "calc", "-theme", "/usr/share/rofi/themes/gruvbox-dark-soft.rasi", NULL};
static const char *rofiEmoji[] = {"rofi", "-show", "emoji", NULL};
// static const char *rofiWindows[] = {"rofi", "-show", "windows", NULL};
static const char *rofiPass[] = {"rofi-pass", NULL};
static const char *appMenu[] = {"rofi", "-show", "drun", "-theme", "~/.config/rofi/themes/applauncher.rasi", NULL};
static const char *dmenuapp[]  = { "j4-dmenu-desktop", "--term=\"alacritty\"", NULL };
static const char *dmenucmd[]  = { "dmenu_run", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", pcol1, "-sf", col_gray4, NULL };
static const char *dmenuaddmusic[]  = { "dmenuaddmusic", NULL };

/* Notification commands */
static const char *notifyDismiss[]     = {"dunstctl", "close", NULL};
static const char *notifyDismissAll[]  = {"dunstctl", "close-all", NULL};
static const char *notifyPop[]         = {"dunstctl", "history-pop", NULL};
static const char *notifyContext[]     = {"dunstctl", "context", NULL};

/* My keybindings */
static const char *keyboard60[]     = {"keyboard.sh", "60", NULL};
static const char *keyboard100[]    = {"keyboard.sh", "100", NULL};
static const char *keyboard_std[]   = {"keyboard.sh", "std", NULL};

/* scratchpad commands */
static const char *notepad[]  = {"n", "scratchpad", "start", "notepad", NULL};

/* My app keybindings */
#define TERM "kitty", "-1"

static const char *termcmd[]     = { "setsid", "kitty",       "-1",                          NULL };
static const char *alt_termcmd[] = { "setsid", "alacritty",   NULL };
static const char *topCmd[]      = { "setsid", TERM,          "--class=\"Alacritty:btop\"",  "--Title=\"System Monitor (btop)\"",  "-e", "btop",    NULL };
static const char *ncmpcpp[]     = { "setsid", TERM,          "--class=\"Alacritty:Music\"", "--Title=\"Music Player (ncmpcpp)\"", "-e", "ncmpcpp", NULL };
static const char *lf[]          = { "setsid", TERM,          "--class=\"Alacritty:Files\"", "--Title=\"File Manager (lf)\"",      "-e", "lf",      NULL };
static const char *ranger[]      = { "setsid", TERM,          "--class=\"Alacritty:Files\"", "--Title=\"File Manager (ranger)\"",  "-e", "ranger",  NULL };
static const char *nvim[]        = { "setsid", TERM,          "--class=\"Alacritty:nvim\"",  "--Title=\"Neovim::Notes\"",          "-e", "nvim",    NULL };
static const char *quteb[]       = { "setsid", "qutebrowser", NULL };
static const char *brave[]       = { "setsid", "brave",       NULL };
static const char *pcmanfm[]     = { "setsid", "thunar",      NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
  {0,             XF86XK_AudioMute,          spawn,          {.v = mutecmd} },
  {0,             XF86XK_AudioRaiseVolume,   spawn,          {.v = audioRise} },
  {0,             XF86XK_AudioLowerVolume,   spawn,          {.v = audioLower} },

  {0,             XF86XK_AudioNext,          spawn,          {.v = musicNextCmd} },
  {0,             XF86XK_AudioPrev,          spawn,          {.v = musicPrevCmd} },
  {0,             XF86XK_AudioPlay,          spawn,          {.v = musicPlayCmd} },
  {0,             XF86XK_AudioPause,         spawn,          {.v = musicPlayCmd} },

  {0,             XF86XK_MonBrightnessDown,  spawn,          {.v = lowerBrightness} },
  {0,             XF86XK_MonBrightnessUp,    spawn,          {.v = riseBrightness} },

  {0,             XF86XK_PowerOff,           spawn,          {.v = powerMenu} },

  {0,                     XK_Print,          spawn,          {.v = screenshotComplete} },
  {ShiftMask,             XK_Print,          spawn,          {.v = screenshotSelect} },
  {ControlMask,           XK_Print,          spawn,          {.v = screenshotWindow} },
  {ControlMask|ShiftMask, XK_Print,          spawn,          {.v = screenshotWindowSelect} },

	{ MODKEY,                       XK_F4,     spawn,          {.v = powerMenu } },
	{ MODKEY,                       XK_c,      spawn,          {.v = rofiCalc } },
	{ MODKEY,                       XK_Insert, spawn,          {.v = rofiEmoji } },
	{ MODKEY,                       XK_p,      spawn,          {.v = rofiPass } },

	{ MODKEY|ShiftMask,             XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_a,      spawn,          {.v = appMenu } },
	{ MODKEY,                       XK_slash,  spawn,          {.v = dmenuaddmusic } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_h,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_l,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_f,      fullscreenmode, {0} },
	{ MODKEY,                       XK_z,      zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_s,      togglermaster,  {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_i,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_w,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_d,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_grave,  view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_grave,  tag,            {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_r,      quit,           {0} },
	{ MODKEY|ControlMask,           XK_q,      spawn,          {.v = logoutCmd} },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	// { MODKEY,                       XK_o,      viewsingle,     {0} },

	/* Keyboard Layout */
	{ MODKEY,                       XK_g,      spawn,          {.v = keyboard60 } },
	{ MODKEY|ShiftMask,             XK_g,      spawn,          {.v = keyboard100 } },
	{ MODKEY|ControlMask,           XK_g,      spawn,          {.v = keyboard_std } },

  /* scratchpad keybinding */
 	{ MODKEY,                       XK_Escape, togglescratch,  {.v = notepad } },

  /* App keybinding */
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = alt_termcmd } },
 	{ MODKEY|ShiftMask,             XK_b,      spawn,          {.v = brave } },
 	{ MODKEY|ShiftMask,             XK_e,      spawn,          {.v = emacsc } },
 	{ MODKEY|ShiftMask,             XK_v,      spawn,          {.v = nvim } },
 	{ MODKEY|ShiftMask,             XK_f,      spawn,          {.v = pcmanfm } },
 	{ MODKEY|ShiftMask,             XK_m,      spawn,          {.v = ncmpcpp } },
 	{ MODKEY|ShiftMask,             XK_n,      spawn,          {.v = quteb } },
 	{ MODKEY|ShiftMask,             XK_t,      spawn,          {.v = topCmd } },
 	{ MODKEY|ShiftMask,             XK_x,      spawn,          {.v = lf } },
 	{ MODKEY|ShiftMask,             XK_z,      spawn,          {.v = ranger } },

	/* Brightness keys */
 	{ MODKEY,                 XK_semicolon,    spawn,          {.v = riseBrightness } },
 	{ MODKEY|ShiftMask,       XK_semicolon,    spawn,          {.v = lowerBrightness } },

	/* Media keys */
 	{ MODKEY,                 XK_apostrophe,   spawn,          {.v = audioRise } },
 	{ MODKEY|ShiftMask,       XK_apostrophe,   spawn,          {.v = audioLower } },
 	{ MODKEY,                 XK_backslash,    spawn,          {.v = mutecmd } },
 	{ MODKEY|ShiftMask,       XK_backslash,    spawn,          {.v = musicPlayCmd } },
 	{ MODKEY|ControlMask,     XK_backslash,    spawn,          {.v = audioMixer } },
 	{ MODKEY,                 XK_bracketleft,  spawn,          {.v = musicSeekBackCmd } },
 	{ MODKEY|ShiftMask,       XK_bracketleft,  spawn,          {.v = musicPrevCmd } },
 	{ MODKEY|ControlMask,     XK_bracketleft,  spawn,          {.v = musicPrevPlayer } },
 	{ MODKEY,                 XK_bracketright, spawn,          {.v = musicSeekFwdCmd } },
 	{ MODKEY|ShiftMask,       XK_bracketright, spawn,          {.v = musicNextCmd } },
 	{ MODKEY|ControlMask,     XK_bracketright, spawn,          {.v = musicNextPlayer } },

	/* Notification keys */
 	{ MODKEY,                 XK_minus,        spawn,          {.v = notifyDismiss } },
 	{ MODKEY|ShiftMask,       XK_minus,        spawn,          {.v = notifyDismissAll } },
 	{ MODKEY,                 XK_equal,        spawn,          {.v = notifyContext } },
 	{ MODKEY|ShiftMask,       XK_equal,        spawn,          {.v = notifyPop } },

	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	TAGKEYS(                        XK_0,                      9)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkLtSymbol,          0,              Button4,        setgaps,        {.i = -1} },
	{ ClkLtSymbol,          0,              Button5,        setgaps,        {.i = +1} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        sigdwmblocks,   {.i = 1} },
	{ ClkStatusText,        0,              Button2,        sigdwmblocks,   {.i = 2} },
	{ ClkStatusText,        0,              Button3,        sigdwmblocks,   {.i = 3} },
	{ ClkStatusText,        0,              Button4,        sigdwmblocks,   {.i = 4} },
	{ ClkStatusText,        0,              Button5,        sigdwmblocks,   {.i = 5} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

