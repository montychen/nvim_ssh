# 打开终端，配置全局git用户名称和邮箱
下面用户名 montychen 和邮箱 dj2503@qq.com 是github账号的正确信息
```bash
git config --global user.name "montychen"
git config --global user.email "dj2503@qq.com"
```
查看git全局配置 `git config --list`


# 用github账号的邮箱生产SSH公钥
github对SSH密钥做了升级，原来的SHA-1，rsa等一些已经不支持了, 用新的ed25519密钥对
- RSA，DSA，ECDSA，EdDSA和Ed25519都用于数字签名，但只有RSA也可以用于加密。
- 签名的作用是确认信息是由谁发出的
- 加密是对内容进行保护，不是发给你得内容，你根本就不知道内容是什么, 内容已经加密
- ed25519是目前最安全、加解密速度最快的key类型，由于其数学特性，它的key的长度比rsa小很多，优先推荐使用。它目前唯一的问题就是兼容性，即在旧版本的ssh工具集中可能无法使用
- rsa是目前兼容性最好的，应用最广泛的key类型，在用ssh-keygen工具生成key的时候，默认使用的也是这种类型。不过在生成key时，如果指定的key size太小的话，也是有安全问题的，推荐key size是3072或更大。

回车之后会出现如下所示的输出，都直接按回车即可。
```bash
ssh-keygen -t ed25519 -C "dj2503@qq.com"
```
在默认用户目录`~/.ssh`下会生成秘钥文件

<pre>
$ ls -l  ~/.ssh                               
total 32
    -rw-------  1 dj  staff  399 May 24 17:10 id_ed25519
    -rw-r--r--  1 dj  staff   95 May 24 17:10 id_ed25519.pub
    -rw-------  1 dj  staff  656 May 24 16:31 known_hosts
    -rw-r--r--  1 dj  staff   92 May 23 18:22 known_hosts.old
</pre>

#  通过ssh-add命令是把ssh私钥添加到ssh-agent的高速缓存中 
```bash
ssh-add  ~/.ssh/id_ed25519
```

# 将公钥id_ed25519.pub(注意不是id_ed25519)添加到github中
登陆github账号，在setting设置界面点击 **SSH and GPG keys** New SSH key，在Title中取一个名字（任意），key中填入**id_ed25519.pub**文件里的所有内容( **ssh-ed25519 到以 dj2503@qq.com结尾** 的所有内容)。然后点击Add SSH key即可。


# 测试SSH设置是否成功
```bash
ssh -T git@github.com
```
出现以下结果即为成功: `Hi montychen! You've successfully authenticated, but GitHub does not provide shell access.`

# 查看本地仓库push代码的验证方式：https还是ssh 
 **`git remote -v`** 在本地git仓库目录输入这个命令，出现下面内容说明是通过https方式访问的。
<pre>
$ git remote -v
    origin	https://github.com/montychen/lang_digest.git (fetch)
    origin	https://github.com/montychen/lang_digest.git (push)
</pre>

把访问方式改为ssh方式，在终端命令行输入如下命令： `git remote set-url origin 登录你的github项目拿到的ssh克隆地址`
```
git remote set-url origin git@github.com:montychen/lang_digest.git
```
以后就可以直接在git仓库目录下通过`git push`以免密的方式提交代码了

