﻿<%@ Page Language="C#" %>

<script runat="server">


    void Page_Load(System.Object Sender, System.EventArgs Args)
    {
        string id = Request.QueryString["id"].ToString();
        SqlDataSource deletedatasourse = new SqlDataSource(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString, "");
        deletedatasourse.DeleteCommand = $"Delete from Student where StudentId='{id}'";
        deletedatasourse.Delete();
        Response.Redirect("StudentProfiles.aspx");

    }
</script>

