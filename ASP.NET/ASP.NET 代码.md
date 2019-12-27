#### 课堂作业：词典

```c#
namespace dictinary{
    class DictProgram{
        static void Main(string[] args){
            SortedList dict = new SortedList();
            string k, v,a;
            Console.WriteLine("loading dictionary ...");
            try{//判断是否为空
                StreamReader sr = new StreamReader(@"e:\mydict.txt");//创建输出流
                if (sr == null)
                    throw new FileNotFoundException();
                k=sr.ReadLine();
                v=sr.ReadLine();
                while(v!="" && v!=""){
                    dict.Add(k,v);
                    k=sr.ReadLine();
                    v=sr.ReadLine();
                }
                sr.Close();
            }
            catch{//读取文档失败
                Console.WriteLine("loading dictionary failed.");
            }
            Console.WriteLine("loading dictionary finished"); //加载完成
            Console.WriteLine("请输入一个词（退出直接按回车）：");
            k = Console.ReadLine(); //存放读到的词
            while (!String.IsNullOrEmpty(k)){
                if (dict.ContainsKey(k)){//辞典里有这个词
                    Console.WriteLine("{0}的释义是：{1}.", k, dict[k]);
                }
                else{//没查到
                    Console.WriteLine("{0}的释义查不到，请输入其释义，以回车结束.", k);
                    v = Console.ReadLine(); //将查到的词输出出来
                    dict.Add(k.Trim(), v.Trim());  //删除空格 存放查出的值
                }
                Console.WriteLine("还查吗（y/n）?");
                a = Console.ReadLine().ToUpper();
                if (a == "Y"){
                    Console.WriteLine("请输入一个词（退出直接按回车）：");
                    k = Console.ReadLine();
                    continue;
                }
                else
                    break;
            }
            Console.WriteLine("saving dictionary ...");
            StreamWriter sw = new StreamWriter(@"e:\mydict.txt"); //创建输入流
            foreach (DictionaryEntry de in dict){//遍历辞典
                sw.WriteLine(de.Key.ToString());
                sw.WriteLine(de.Value.ToString());
            }
            sw.Close();
            Console.WriteLine("saving dictionary finished.");
        }
    }
}
```





### 第八章

#### p163 实现 GridView 控件的数据绑定

```c#
string constr
```

