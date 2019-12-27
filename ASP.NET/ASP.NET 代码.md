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

#### p98 Session 登录

```c#
public partial class Login:System.Web.UI.Page
{  
    protected void Page_Load(objectsender,EventArgse){    
    }
    protected void btLogin_Click(object sender,Eventargs e){
        stringstrName=tbUserName.Text.Trim();
        stringstrPwd=tbPassword.Text.Trim();
        if(strName==””||strPwd==””){
            this.ClientScript.RegisterStartupScript(this.GetType(),””,“<script>alert(‘用户名和密码不能为空’)</script>”);
            return;
        }else{
            Session[“userName”]=strName;
            Response.Redirect(“SessionDemo.aspx”);
        }
    }
}
```

#### p99 创建 SessionDemo.aspx 页面访问 Session 中的数据

```c#
public partial class SessionDemo: System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        If(Session[“userName”] != null) {
            IbIName.Text = ”用户名：” + Session[“userName”];
        }
        else {
            lblName.Text = ”请您登陆后， 再访问此页面”;
        }
    }
}
```

#### p104 演示 Cookie 的使用

```c#
publicpaetial class CookieDemo: System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {}
    protected void btWrite_Click(object sender, EventArgs e) {
        stringUserIP = Request.UserHostAddress.ToString();
        Response.Cookies[“IP”].Value = UserIP;
        Response.Cookies[“IP”].Expires = DataTime.Now.AddDays(1);
    }
    protected void btReader_Cookie(object sender, EventArgs e) {
        If(Request.Cookie[“IP”] != null) {
            this.IbInfo.Text = Request.Cookies[“IP”].Value;
        }
    }
}
```

#### p106 演示 Server 的使用

```c#
publicpaetial class ServerDemo: System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        Response.Write(“远程服务器名为: ”+Server.MachineName + ” < br / > ”);
		Response.Write(Server.MapPath(“~/ServerDemo.aspx”)+”<br/ > ”); 
        string str; 
        str = Server.HtmlEncode(“ < B > HTML 内容 < /B><br/ > ”);
        Response.Write(str + ” < br / > ”); 
        str = Server.HtmlDecode(str); Response.Write(str + ” < br / > ”);
    }
}
```

#### p146 使用 Command 和 DataReader 访问数据库，实现登陆功能

```c#
public partial class Login: System.Web.UI.Page {
	public static readonly string ConStrUrl = ConfigurationManager.ConnectionString[“conn”].ConnectionString;
	protected void Page_Load(object sende.EventArgs e) {}
	protected void btnLogin_Click(object sender, EventArgs e) {
		SqlConnection conn = new SqlConnection(ConStrUrl);
		try {
			conn.Open();
			string username = tbUserName.Text.Trim();
			string password = tbPassword.Text.Trim();
			string sql = ”select * from[users] where username’” + username + ”’”SqlCommandcmd = new SqlCommand(sql, conn);
			SqlDataReaderdr = cmd.ExecuteReader();
			if(dr.HasRows) {
				while(dr.Read()) {
					if(dr[“password”].ToString() == password) {
						Response.Write(“用户: +dr[“username”].ToString() + ”登陆成功! < hr / > ”);
					}
					else {
						ResponseWrite(“登陆成功： 密码错误！ < hr / > ”);
					}
				}
				conn.Close();
			}
			else {
				ResponseWrite(“登陆成功： 用户不存在！ < hr / > ”);
			}
		}
		catch {
			ResponseWrite(“登陆成功： 数据库连接失败！ < hr / > ”);
		}
	}
}
```

#### p151 演示使用 DataAdapter 和 DateSet 访问数据库

```c#
public partial class DataSetDemo: System.Web.UI.Page {
		public static readonly string ConStrUrl = ConfigurationManager.ConnectionStrings[“conn”].ConnectionString;
		protected void Page_Load(object sender, EventArgs e) {
			using(SqlConnection con = new SqlConnection(ConStrUrl)) {
				con.Open();
				SqlDataAdapterdaDept = new SqlDataAdapter(“select * from users”, con);
				DataSetdsDept = new DataSet();
				daDept.Fill(dsDept, ”users”);
				DataTable table = dsDept.Tables[“users”];
				Response.Write(" < table border = '1' width = '100 % ' > ");
				Response.Write(" < tr > ");
				for(int i = 0; i < table.Columns[i].ColumnName); {
					Response.Write(" < th > ");
					Response.Write(table.Columns[i].ColumnsName; Response.Write(" < /th>");
					}
					Response.Write("< /tr");
					for(int i = 0; i < table.Rows.Count; i++) {
						DataRow row = table.Rows[i];
						Response.Write(" < tr > ");
						for(int j = 0; j < table.Columns.Count; j++) {
							Response.Write(" < tr > ");
							Response.Write("row[j]");
							Response.Write(" < /td>");
						}
						Response.Write("< /tr>");
					}
					Response.Write(" < /table> ");
				}
			}
		}
```

#### p163 在页面 Page_Load 事件中实现 GridView 控件的数据绑定

```c#
string constr = “Data Source=.;Initial Catalog=TestDb;User ID=sa;Password=1";
SqlConnection con = new SqlConnection(constr);
string sql = "select * from UserDetails";
SqlDataAdapter da = new SqlDataAdapter(sal.con);
DataSet ds = new DataSet();
da.Fill(ds,"User");
gvUser.DataSource = ds.Tables["User"];
gvUser.DataBind();
```

#### #### 演示 RequiredFieldValidator 验证控件的使用

```html
<html>
 <head runat="server"> 
  <title>RequiredFieldValidator示例</title> 
 </head>
 <body> 
  <form id="“form1&quot;" runat="server">
   <div>
     姓名:
    <asp:textbox id="txtName" runat=" server">  
     <asp:requiredfieldvalidator id=" rfvName" runat="server" controltovalidate="txtName" errormessage="“用户名不能为空”"></asp:requiredfieldvalidator>
     <br /> 密码:
     <asp:textboxid="txtpwd" runat="server" rfvpwd"="" control'tovalidate="txtPwd" errormessage="密码不能为空">  
      <br /> 
      <asp:button id="btmOk" runat="”server”" text="提交" /> 
     </asp:textboxid="txtpwd">
    </asp:textbox>
   </div>
  </form> 
 </body>
</html>
```

#### 创建 Login.Aspx 界面

```html
<html>
 <head>
  <title>登陆</title>
  <title>head&gt;body&gt;
</title>
 </head>
 <body>
  <form id="forml" runa="server">
   <div> 
    <htr></htr>
    <table style="border:" 0px:="" widh:="" 300px:"=""> 
     <tbody>
      <tr> 
       <td colspan="2" align="center&quot;"> </td>
      </tr>
      <tr>
       <td align="right"> 用户名:</td>
       <td></td>
       <td> 
        <asp:textbox id="tbUserName&quot;" runat="server"> 
        </asp:textbox></td>
      </tr>
      <tr>
       <td align="right"> 密码：</td>
       <td> 
        <asp:textbox id="tbPassword" ,="" runat="server" textmode="Password"></asp:textbox> </td>
      </tr>
      <tr>
       <td colspan="2" align="center"> 
        <asp:button id="btLogin" runat="" "server"="" onclick="btLogin Click" text=" 登陆" /> </td>
      </tr>
     </tbody>
    </table>
   </div>
   <hdy></hdy>
  </form>
 </body>
</html>
```



