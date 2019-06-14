using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;

public partial class AddProf : System.Web.UI.Page
{
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["TestBankConnectionString"].ConnectionString;

        SqlCommand cm = new SqlCommand();
        cm.CommandType = CommandType.Text;
        cm.CommandText = "Insert into Prof (ProfName) values (@ProfName)";
        cm.Connection = cn;

        SqlParameter course_param = new SqlParameter();
        course_param.ParameterName = "@ProfName";
        course_param.SqlDbType = SqlDbType.VarChar;
        course_param.Size = txtProf.Text.Length;
        course_param.Direction = ParameterDirection.Input;
        course_param.Value = txtProf.Text;

        cm.Parameters.Add(course_param);

        cm.Connection.Open();

        cm.ExecuteNonQuery();

        cm.Connection.Close();


        GridView1.DataBind();
    }
}
