static int topbar = 0;
static const char *prompt = NULL;
static const char worddelimiters[] = " `'\"()[]{}?&/";

static unsigned int lines = 5;
static unsigned int lineheight = {{ printf %s $BAR_HEIGHT }};

static const char *fonts[] = { "{{ substr "$BITMAP" , 0 }}" };
static const char *colors[SchemeLast][2] = {
{{
cat << EOF
	/* fg bg */
	[SchemeNorm] = { "$FG", "$BG" },
	[SchemeSel]  = { "$FG", "$CLR0" },
	[SchemeOut]  = { "#000000", "#00ffff" },
EOF
}}
};
