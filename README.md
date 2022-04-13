* 在[NvChad](https://github.com/NvChad/NvChad)的基础上进行定制
    

先备份nvim的配置 
```
 mv ~/.config/nvim ~/.config/NVIM.BAK
 ```
安装 *NvChad* 

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
```
NvChad的定制配置放在 **nvim/lua/custome** 目录下
```
```
