# work-settings
My  work settings, so far for linux `bash` and [`neovim`](https://neovim.io/).

## Install
Most of the contents of this repo are in fact git _submodules_, so to get its full contents you should run:

```bash
$ git pull https://github.com/lrodero/work-settings.git
$ cd work-settings
$ git submodule init
$ git submodule update
```

Now, it is enough to symlink each folder/file in the home folder. E.g.

```sh
$ ln -s work_settings/.bash ~/.bash
$ ln -s work_settings/.bashrc ~/.bashrc
$ ln -s work_settings/.git ~/.git
$ ln -s work_settings/.gitmodules ~/.gitmodules
$ ln -s work_settings/.vim ~/.vim
$ ln -s work_settings/.vimrc ~/.vimrc

# In .sbt only two files should be linked, without 'overwriting' your own ~/.sbt folder.
$ ln -s work_settings/.sbt/0.13/global.sbt ~/.sbt/0.13/global.sbt
$ ln -s work_settings/.sbt/0.13/plugins/plugins.sbt ~/.sbt/0.13/plugins/plugins.sbt
```

