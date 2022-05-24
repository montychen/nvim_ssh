# 打开终端，配置全局git用户名称和邮箱
下面用户名 montychen 和邮箱 dj2503@qq.com 是github账号的正确信息
```bash
git config --global user.name "montychen"
git config --global user.email "dj2503@qq.com"
```
查看git全局配置 `git config --list`


# 用github账号的邮箱生产SSH公钥
回车之后会出现如下所示的输出，直接按回车即可。
```bash
ssh-keygen -t rsa -C "dj2503@qq.com"
```
<pre>
Generating public/private rsa key pair.
Enter file in which to save the key
(/Users/your_user_directory/.ssh/id_rsa): (按回车键)
Enter passphrase (empty for no passphrase): (按回车键)
Enter same passphrase again: (按回车键)
</pre>
在默认用户目录`~/.ssh`下会生成秘钥文件

<pre>
$ ls -l  ~/.ssh                               
    total 24
    -rw-------  1 dj  staff  2602  5 24 16:16 id_rsa
    -rw-r--r--  1 dj  staff   567  5 24 16:16 id_rsa.pub
    -rw-r--r--  1 dj  staff    92  5 23 18:22 known_hosts
</pre>

#  通过ssh-add命令是把ssh私钥添加到ssh-agent的高速缓存中 
```bash
ssh-add  ~/.ssh/id_rsa
```

# 将公钥id_rsa.pub(注意不是id_rsa)添加到github中
登陆github账号，在setting设置界面点击 **SSH and GPG keys** New SSH key，在Title中取一个名字（任意），key中填入**id_rsa.pub**文件里的所有内容( **ssh-rsa 到以 dj2503@qq.com结尾** 的所有内容)。然后点击Add SSH key即可。


# 测试SSH设置是否成功
```bash
ssh -T git@github.com
```
出现以下结果即为成功: `Hi montychen! You've successfully authenticated, but GitHub does not provide shell access.`

