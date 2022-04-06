# OpenClassrooms monorepo

Visual Studio Code has multiple way to be configured, and use various file/folders to do so.
You'll find a command in this repo, to copie the files at the correct place and configure your IDE. It's a bit opinionated, but you still have possibilities to extend this conf
If you want to override some settings, you must use the User tab of VSC preferences screen.

This config use workspaces for a better file organisation.

* close vscode
* clone the repo
* run `./restore.sh [your-repo-path]` it will prompt you when replacing files (so stop it if you think you'll loose some config !)
* add `/openclassrooms.code-workspace` to your global git ignore. For now we don't want to pollute more the repo with specific IDE files
* open vscode and use `Open workspace from File` to open the `openclassrooms.code-workspace` file (or type `code openclassrooms.code-workspace` at the root of the monorepo)
