推荐使用[Neovim](https://github.com/neovim/neovim)

先备份nvim的配置 
```bash
mv ~/.config/nvim ~/.config/NVIM.BAK

清理旧的插件
rm -rf ~/.local/share/nvim
```

nvim主流的插件管理器是[packer.nvim](https://github.com/wbthomason/packer.nvim), 添加删除插件配置后，在**nvim**内运行
- :PackerClean 彻底清除不用的插件
- :PackerSync 更新、安装或删除不用的插件


### Install LSP Server 代码补全

Nvim内置LSP客户端支持， 安装[nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)插件后，通过`:LspInstall `可以方便的安装对应语言的LSP服务器
```
:LspInstallInfo       查看已经安装了哪些LSP语言服务器
:LspInstall sumneko_lua 
```

### Treesitter 语言解析&语法高亮&增量选择
Nvim内置TreeSitter支持，可以高效的解析编程语言，通过`:TSInstall`来安装对某个编程语言的支持
```
:TSInstallInfo       查看已经安装了那些语言
:TSInstall  rust     安装rust语言支持
```



# NvChad
在[NvChad](https://github.com/NvChad/NvChad)的基础上进行定制, NvChad的安装目录是 `~/.config/nvim` , 我们的自定义都放在`~/.config/nvim/lua/custome` 目录下
    

安装 *NvChad* 

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
```
NvChad默认 **Leader键**映射的是**空格键**。 查看所有默认快捷键映射 
```
<Leader> + ch 
```

克隆拉取NvChad的自定义配置, 并放到 **nvim/lua/custome** 目录下
```
git clone https://github.com/montychen/nvim  ~/.config/nvim/lua/custom

```

# AstroNvim
在[AstroNvim](https://github.com/AstroNvim/AstroNvim)的基础上进行定制，AstroNvim的安装目录是 `~/.config/nvim` , 我们的自定义都放在 **`~/.config/nvim/lua/user`** 目录下

安装AstroNvim
```
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync
```

更新 AstroNvim `:AstroUpdate`


