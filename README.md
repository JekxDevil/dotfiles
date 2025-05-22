# dotfiles

My configuration files versioned and stored using a side git bare repository _within the_ home folder while the work-tree _is the_ home folder.   

The issue git commands respecting this, only an alias is necessary where the path for git directory and work-tree are specified.

Prerequisite: git


## Setup

Create a git bare repository folder within your home path.
Set up the alias respecting git-dir and work-tree difference.
Set the untracked files flag to `no`, in order to avoid all the other files and directories in you folder to be mentioned as untracked by git.

```shell
git init --bare $HOME/.dotfiles
alias config-dotfile="$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
config-dotfile config --local status.showUntrackedFiles no
```

Optionally, set the alias it in your shell `.*rc` file.

Then, set it to a new remote repository, e.g.

```shell
config-dotfiles remote add origin <URL-REPO>
config-dotfiles branch --set-upstream-to=origin/main main
```

## Usage

After the set up, any file within the home folder can be versioned with the alias followed by standard git commands.

```shell
config-dotfile status
config-dotfile add .zshrc
config-dotfile commit
config-dotfile push
```

## Cloning

Setup again the [alias](#setup).
Clone the repository specifying the separate git-dir argument to the folder within the home, as in your alias setup.
If any pre-existing config files conflicts with yours, choose whether to save them separately in another folder, or discard them.

```sh
git clone --separate-git-dir=$HOME/.dotfiles <URL-REPO> ~
```

## References
- <https://www.atlassian.com/git/tutorials/dotfiles>
- <https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles/>
- <https://news.ycombinator.com/item?id=11071754>
- <https://www.reddit.com/r/golang/comments/egeip1/gnu_stow_alternative_written_in_go/>
