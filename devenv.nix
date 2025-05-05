{ pkgs, ... }:

{
  languages = {
    go = {
      enable = true;
    };
  };
  scripts = {
    production-build = {
      exec = ''
        HUGO_ENVIRONMENT=production hugo \
          --gc \
          --minify \
          --baseURL "$HUGO_BASE_URL/" \
          --cacheDir "$TEMP_DIR/hugo_cache"
      '';
    };
    serve = {
      exec = "hugo serve -M --disableFastRender";
    };
  };
  packages = with pkgs; [
    git
    hugo
    dart-sass
  ];
}
