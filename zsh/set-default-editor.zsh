#!/bin/sh

# Figured out name of the app by running `osascript -e 'id of app "Zed"'`
TEXT_EDITOR="com.microsoft.VSCode"

duti -s $TEXT_EDITOR public.json all
duti -s $TEXT_EDITOR public.plain-text all
duti -s $TEXT_EDITOR public.python-script all
duti -s $TEXT_EDITOR public.shell-script all
duti -s $TEXT_EDITOR public.source-code all
duti -s $TEXT_EDITOR public.text all
duti -s $TEXT_EDITOR public.unix-executable all
duti -s $TEXT_EDITOR public.data all

duti -s $TEXT_EDITOR .cs all
duti -s $TEXT_EDITOR .css all
duti -s $TEXT_EDITOR .go all
duti -s $TEXT_EDITOR .java all
duti -s $TEXT_EDITOR .js all
duti -s $TEXT_EDITOR .sass all
duti -s $TEXT_EDITOR .scss all
duti -s $TEXT_EDITOR .less all
duti -s $TEXT_EDITOR .vue all
duti -s $TEXT_EDITOR .cfg all
duti -s $TEXT_EDITOR .json all
duti -s $TEXT_EDITOR .jsx all
duti -s $TEXT_EDITOR .log all
duti -s $TEXT_EDITOR .lua all
duti -s $TEXT_EDITOR .md all
duti -s $TEXT_EDITOR .php all
duti -s $TEXT_EDITOR .pl all
duti -s $TEXT_EDITOR .py all
duti -s $TEXT_EDITOR .ipynb all
duti -s $TEXT_EDITOR .rb all
duti -s $TEXT_EDITOR .ts all
duti -s $TEXT_EDITOR .tsx all
duti -s $TEXT_EDITOR .txt all
duti -s $TEXT_EDITOR .conf all
duti -s $TEXT_EDITOR .yaml all
duti -s $TEXT_EDITOR .yml all
duti -s $TEXT_EDITOR .toml all
duti -s $TEXT_EDITOR .c all
duti -s $TEXT_EDITOR .cpp all
duti -s $TEXT_EDITOR .hpp all
duti -s $TEXT_EDITOR .h all
duti -s $TEXT_EDITOR .tex all
