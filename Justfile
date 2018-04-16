build: build-core
    gutenberg build

serve: build-core
    gutenberg serve

build-core:
    rm -f static/js/elm.js
    rm -f public/js/elm.js
    elm-make elm/Main.elm --output static/js/elm.js

clean:
    rm -rf public
    rm -rf proto