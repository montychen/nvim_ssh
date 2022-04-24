推荐使用[Neovim](https://github.com/neovim/neovim), 安装好nvim后

在[NvChad](https://github.com/NvChad/NvChad)的基础上进行定制, NvChad的安装目录是 `~/.config/nvim` , 我们的自定义都放在`~/.config/nvim/lua/custome` 目录下
    

先备份nvim的配置 
```
 mv ~/.config/nvim ~/.config/NVIM.BAK
 ```
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
```
