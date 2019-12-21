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

```bash
#!/bin/bash

echo -e "\033[32mgit pull review\033[0m"
git pull
cmd.exe#阻止窗口关闭
```

