# PopOS dotfiles

While this is meant as a guide for my future self, it feels almost more like a presentation of my current knowledge to my future self. I am sure it is possible to create some script that install everything from my .dotfiles while also creating [Symbolic Links](https://www.freecodecamp.org/news/symlink-tutorial-in-linux-how-to-create-and-remove-a-symbolic-link/) but, admittedly, I had only just learned what symbolic links are.

## Dependencies

`gnome-shell-extension`
`gnome-tweak-tool`

The `.themes` folder requires that you have `gnome-shell-extensions` so that you may install and enable [User Themes](https://extensions.gnome.org/extension/19/user-themes/). Following, switch the current gnome theme to the available theme, in the `themes` folder, in `gnome-tweak-tool`.



## Placement of files

I am sure that this seems rather amateurish, but this is the best that I can do currently.

| dotfile    | Placement   |
| :--------: | :---------: |
| .gitconfig | /home/user/ |
| .ssh       | /home/user/ |
| .themes    | /home/user/ |
