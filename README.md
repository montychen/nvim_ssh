推荐使用[Neovim](https://github.com/neovim/neovim), 安装说明[详见](https://github.com/montychen/nvim/blob/main/Vim_%E5%BF%AB%E9%80%9F%E5%85%A5%E9%97%A8.md)

先备份nvim的配置 
```bash
mv ~/.config/nvim ~/.config/NVIM.BAK

# 完全清理nvim的配置
rm -rf ~/.config/nvim       # 删除nvim&自定义配置
rm -rf ~/.local/share/nvim  # 清理旧的插件

```

### mac系统先运行
```bash
xcode-select --install
```
# [LunarVim](https://github.com/LunarVim/LunarVim)

### 安装 LunarVim
```bash
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
```
### 运行LunarVim的执行文件 lvim 
把**lvim**所在的目录`~/.local/bin/lvim`加到PATH环境变量。在`.bash_profile`文件末尾加入一行：
```bash
$ echo "export PATH=~/.local/bin:\$PATH" >> ~/.bash_profile
$ source ~/.bash_profile
$ lvim
```
### 运行lvim后的配置
安装并运行`lvim`后，要运行一次 **`:TSUpdate`**，不然打开lua文件会提示
```lua
lunarvim treesitter/highlighter: Error execute  /nvim/runtime/lua/vim/treesitter/query.lua. invalid node type ....
```

### LunarVim常用快捷键
查看快捷键映射 `<Leader>Vk` or `<Leader>Lk`

### LunarVim的自定义配置
LunarVim提供最定义配置， 自定义的内容都放在这个文件 **`~/.config/lvim/config.lua`**

在终端下运行下面这个命令，会在当前目录下生成`lv-settings.lua`文件，里面包含LunarVim所有可用的配置项
```bash
lvim --headless +'lua require("lvim.utils").generate_settings()' +qa && sort -o lv-settings.lua{,}
```


### 卸载LunarVim
```bash
bash ~/.local/share/lunarvim/lvim/utils/installer/uninstall.sh
# or
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/uninstall.sh)
```

# [NvChad](https://github.com/NvChad/NvChad)
NvChad的安装目录是 `~/.config/nvim` , 支持自定义，自定义的内容都在`~/.config/nvim/lua/custome` 目录。
    

### 安装 NvChad 

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 ; nvim
```

加载NvChad的自定义配置
```bash
# 克隆拉取NvChad的自定义配置
git clone https://github.com/montychen/nvim  ~/.dj_soft/dj_nvim

# 通过ln软连接到 **~/.config/nvim/lua/custome** 目录下
ln -s ~/.dj_soft/dj_nvim/custom  ~/.config/nvim/lua/custom

```

### 基本快捷按键
NvChad默认 **Leader键**映射的是**空格键**。 查看所有默认快捷键映射 `<Leader> + tk `

NvChad支持在线更新 `<Leader> + uu`


[packer.nvim](https://github.com/wbthomason/packer.nvim)是nvim主流的插件管理器是, 添加删除插件配置后，在**nvim**内运行
- `:PackerClean` 彻底清除不用的插件
- `:PackerSync` 更新、安装或删除不用的插件


### Install LSP Server 代码补全

Nvim内置LSP客户端支持， 安装[nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)插件后，通过`:LspInstall `可以方便的安装[对应语言的LSP服务器](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
```
:LspInstallInfo       查看已经安装了哪些LSP语言服务器
:LspInstall sumneko_lua 
```

### Treesitter 语言解析&语法高亮&增量选择
Nvim内置[TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)支持，可以高效的解析编程语言，通过`:TSInstall`来安装对某个[支持的编程语言](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)
```
:TSInstallInfo       查看已经安装了那些语言
:TSInstall  rust     安装rust语言支持
```



