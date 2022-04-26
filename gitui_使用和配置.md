[gitui](https://github.com/extrawurst/gitui)是使用Rust开发的一款git **终端客户端**，比[lazygit](https://github.com/jesseduffield/lazygit) 快。跨平台Mac、Linux、Windows都可以使用。

使用方法，mac使用 **`brew install gitui`** 安装后，直接在git仓库的目录下运行 **`gitui`**

## push出错`git error: Bad credentials`[解决办法](https://github.com/extrawurst/gitui/issues/495#issuecomment-854948221)

1. 在个人电脑上[设置SSHkey](https://www.jianshu.com/p/9ded3d993ca3)，实现SSH的自动登陆

2. 每次打开终端，都要先运行 `ssh-add ~/.ssh/id_rsa` 通过[ssh-add](https://blog.csdn.net/weixin_34357267/article/details/91673507)命令是把ssh专用密钥添加到ssh-agent的高速缓存中

每次打开终端，都要先运行上面的命令，有时也烦。 其实可以直接在终端命令行，用手动运行git push命令，也不复杂
```
git push origin main
```

## gitui重新定义按键符合vim的习惯，默认按键不符合vim习惯， 不同OS配置文件的目录不同
```
$HOME/.config/gitui/key_bindings.ron (mac)
$XDG_CONFIG_HOME/gitui/key_bindings.ron (linux using XDG)
$HOME/.config/gitui/key_bindings.ron (linux)
%APPDATA%/gitui/key_bindings.ron (Windows)
```
Mac系统，创建gitui配置文件并输入如下内容 **`nvim ~/.config/gitui/key_bindings.ron`**
```
(
    focus_right: Some(( code: Char('l'), modifiers: ( bits: 0,),)),
    focus_left: Some(( code: Char('h'), modifiers: ( bits: 0,),)),
    focus_above: Some(( code: Char('k'), modifiers: ( bits: 0,),)),
    focus_below: Some(( code: Char('j'), modifiers: ( bits: 0,),)),
    
    move_left: Some(( code: Char('h'), modifiers: ( bits: 0,),)),
    move_right: Some(( code: Char('l'), modifiers: ( bits: 0,),)),
    move_up: Some(( code: Char('k'), modifiers: ( bits: 0,),)),
    move_down: Some(( code: Char('j'), modifiers: ( bits: 0,),)),

    open_help: Some(( code: F(1), modifiers: ( bits: 0,),)),
)
```
