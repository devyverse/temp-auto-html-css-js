/*
//title : webg.c
//author : DEVREAL 
*/

#include "html.h"
#include "css.h"
#include "js.h" 
#include "webg.h"
#include <stdio.h>
#include <stdlib.h>


// function create dir/repo 
void create_dir(const char *path) {
    char cmd[256];
    snprintf(cmd, sizeof(cmd), "mkdir -p %s", path);
    system(cmd);
}

//function create file
void create_file(const char *path, const char *content) {
    FILE *f = fopen(path, "w");
    if (!f) {
        printf("Error : creating isn't possible  %s\n", path);
        return;
    }
    fprintf(f, "%s", content);
    fclose(f);
}

void gwebsite() {
    // Dossiers
    create_dir("website/assets/img");
    create_dir("website/assets/favicon");
    create_dir("website/styles/base");
    create_dir("website/styles/layout");
    create_dir("website/styles/modules");

    // Fichiers
    create_file("website/index.html", HTML_INDEX);
    create_file("website/styles.css", CSS_STYLES);
    create_file("website/script.js", JS_SCRIPT);
}
/*    // Base CSS
    create_file("website/styles/base/reset.css", CSS_RESET);
    create_file("website/styles/base/typography.css", CSS_TYPO);

    // Layout CSS
    create_file("website/styles/layout/grid.css", CSS_GRID);
    create_file("website/styles/layout/header.css", CSS_HEADER);
    create_file("website/styles/layout/footer.css", CSS_FOOTER);}
*/
