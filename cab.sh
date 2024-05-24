#!/bin/bash

GREEN="#008000"

TEXT_VENV_CREATE="creating virtual env"
TEXT_VENV_ACTIVATE="activate virtual env"
TEXT_INS_REQ="installing the requirements"

PROJECT_NAME=$(gum input --placeholder "project name?")

if [ "$PROJECT_NAME" == "." ]
    then 
        PROJECT_NAME="$(basename $PWD)"
fi

LIST_FILES=(
    ".env"
    ".gitignore"
    "app.py"
    "README.md"
    "requirements.txt"
    "__init__.py"
    # config dir
    "config/__init__.py"
    "config/config.py"
    "config/dev_config.py"
    "config/production.py"
    # controllers
    "controllers/__init__.py"
    # middlewares
    "middlewares/__init__.py"
    # models
    "models/__init__.py"
    "models/user_model.py"
    # services
    "services/__init__.py"
    # routes and utils
    "routes.py"
    "utils.py"
)

# mkdir temp_dir
# git clone -n --depth=1 --filter=tree:0 https://github.com/0verread/cab temp_dir
# cd temp_dir
# git sparse-checkout set --no-cone flask-app
# git checkout
# rm -rf .git
# cd ..
# cp -r temp_dir/ .
# rm -rf temp_dir

# if . entered as a project name, take the cur dir name and make that a project assuming you're trying to create project in curr dir
echo "$PROJECT_NAME"
echo "[ `date` ]": "$(gum style --foreground 212 START)"
echo "[ `date` ]": "creating project $(gum style --foreground "#008000" "$PROJECT_NAME" )"

mkdir -p -- "$PROJECT_NAME"
mkdir -p -- "temp_dir"
git clone -n --depth=1 --filter=tree:0 https://github.com/0verread/cab temp_dir
cd temp_dir
git sparse-checkout set --no-cone flask-app
git checkout
rm -rf .git
cd ..
cp -r temp_dir/ .
rm -rf temp_dir

echo "[ `date` ]": "$(gum style --foreground 212 END)"

