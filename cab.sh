#!/bin/bash

# take a arg as name
PROJECT_NAME=$(gum input --placeholder "project name?")

if [ "$PROJECT_NAME" == "." ]
    then 
        PROJECT_NAME="$(basename $PWD)"
fi

# if . entered as a project name, take the cur dir name and make that a project assuming you're trying to create project in curr dir

gum spin --spinner dot --title "creating project..." -- git clone -n --depth=1 --filter=tree:0 https://github.com/0verread/cab temp_dir -q;\
                                                        cd temp_dir;\
                                                        git sparse-checkout set --no-cone flask-app;\
                                                        git checkout &> /dev/null;\
                                                        rm -rf .git;\
                                                        cd ..;\
                                                        mkdir "$PROJECT_NAME";\
                                                        cp -r temp_dir/flask-app/ "$PROJECT_NAME";\
                                                        rm -rf temp_dir;

echo "finished creating project $(gum style --foreground "#04B575" "$PROJECT_NAME")"
