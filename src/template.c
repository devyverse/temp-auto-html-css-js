#include "html.h"
#include "css.h"
#include "js.h"



// HTML CONTAINER //  
const char *HTML_INDEX =
"<!DOCTYPE html>\n"
"<html lang=\"fr\">\n"
"<head>\n"
"    <meta charset=\"UTF-8\">\n"
"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
"    <link rel=\"stylesheet\" href=\"styles.css\">\n"
"    <title>Name Entreprise</title>\n"
"</head>\n"
"<body>\n"
"    <header><h1>Name Entreprise</h1></header>\n"
"    <script src=\"script.js\"></script>\n"
"</body>\n"
"</html>\n";

// CSS CONTAINER // 


const char *CSS_STYLES =
":root {"
"  --text: #0f0f0f;"
"  --muted: #7a7a7a;"
"  --accent: #1a1a1a;"
"  --border: #e3e3e3;"
"  --soft: #f8f8f8;"
"  --radius: 14px;"
"  --font: sans-serif;"
"  --bg: #def5;"
"  --background: #1a1b26;" 
"  --foreground: #c0caf5; "
"  --selection: #283457; "
"  --black: #15161e;"
"  --red: #f7768e;"
"  --green: #9ece6a;"
"  --yellow: #e0af68;"
"  --blue: #7aa2f7;"
"  --magenta: #bb9af7;"
"  --cyan: #7dcfff;"
"  --white: #a9b1d6;"
"  --brightblack: #414868;"
"  --brightwhite: #c0caf5;"
"}"
"*{"
"    box-sizing: border-box ;"
"    margin: 0 auto;"
"}"
"body {"
"      margin: 0;"
"      padding: 0;"
"      font-family: var(--font);"
"      background-color: var(--bg);"
"      color: var(--text);"
"      line-height: 1.6;"
"}";

//JS CONTAINER // 

const char *JS_SCRIPT =
"console.log('DEVREAL generator');\n";

