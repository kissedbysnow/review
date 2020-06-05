## 2020年5月26日 version-2.0

> git_pull_all.sh

```bash
#!/bin/bash

function showGreen(){ echo -e "\033[32m $1 \033[0m"}
function showBlue(){ echo -e "\033[36m $1 \033[0m"}
function showYellow(){ echo -e "\033[33m $1 \033[0m"}
function showWhite(){ echo -e "\033[37m $1 \033[0m"}

function traversal_dir(){
    for sub_dir in `ls $1` #通过 ls root_dir 遍历出子目录，装入子目录 sub_dir 中
    do
        dir=$1"/"$sub_dir #将根目录 $1 与子目录 sub_dir 拼接成完整的目录
        if [ -d $dir ] #判断：是目录的继续下一步
        then
            cd $dir
			showBlue $dir
            showGreen 'git pull '$sub_dir
            git pull
			echo #打印空行
        else
            showYellow $dir
			echo #打印空行
        fi  
    done
}

root_dir="N:\Desktop\qnit" #定义根目录，即项目 project 的上级目录。例如：root_dir/project/.git 
traversal_dir $root_dir 
```

- 改一下 `root_dir` 的值就可以用了

## 2020年1月3日 version-1.0

> git_pull_all.sh

```bash
#!/bin/bash

#输出 git pull xxx 并设置字体颜色为绿色
function showMsg()
 {
   echo -e "\033[32m$1\033[0m"
 }

function getdir(){
    for element in `ls $1`
    do  
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]
        then
            cd $1"/"$element 
            showMsg 'git pull '$element
            git pull
        else
            echo $dir_or_file
        fi  
    done
}
root_dir="C:\Users\hp\Desktop\qnit"
getdir $root_dir
```

> git_pull.sh

```bash
#!/bin/bash

echo -e "\033[32mgit pull review\033[0m"
git pull
cmd.exe#阻止窗口关闭
```

- 这个就不介绍了