# .dotfiles
## Background Information (for myself)
**What is a symlink?** Short for Symbolic Link. It is a file that points to another file or folder located somewhere else on your system. The changes made to one file with appear on the other. The command for creating a symlink is

```bash
ln -s target_path link path
```

The command allows the flexibility of saving application configurations, which may then be transferred over to a new system.

## Changelog
- 12.13.22 The semester is drawing to a close and now I have time to reinstall my operating system. I would like to reorganize everything.
- 04.22.23 Finally, with some free time, I was able to whip up a bash script that installs the necessary applications that I often use. Additionally, the script also creates a symlink from the .dotfiles/ repo to the necessary folders and files.
