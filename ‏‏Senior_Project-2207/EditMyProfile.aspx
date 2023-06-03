﻿<%@ Page Language="C#" %>

<!DOCTYPE html>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<script runat="server">

    void Page_Load(Object Sender, EventArgs Args)
    {
        if (!IsPostBack)
        {
            load_data();
            loadBlocksDropDown();
        }
    }

    protected void load_data()
    {
        SqlDataSource ds2 = new SqlDataSource();
		ds2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
		ds2.SelectCommand = $"Select * from Employee where EmployeeId='{Session["EmployeeId"].ToString()}'";
		DataView dv2 = (DataView)ds2.Select(DataSourceSelectArguments.Empty);
		Image1.ImageUrl = "assets/img/" + dv2.Table.Rows[0]["Photo"].ToString();


        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        ds.SelectCommand = $"Select * from Employee where EmployeeId='{Request.QueryString["id"]}'";
        DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);

     
        EmployeeName.Text = dv.Table.Rows[0]["Name"].ToString();
        Gender.Text = dv.Table.Rows[0]["Gender"].ToString();
        phoneNumber.Text = dv.Table.Rows[0]["PhoneNumber"].ToString();
        Email.Text = dv.Table.Rows[0]["Email"].ToString();
        address.Text = dv.Table.Rows[0]["Address"].ToString();
        Birthdate.Text = dv.Table.Rows[0]["BirthDate"].ToString();
        Nationality.Text = dv.Table.Rows[0]["Nationality"].ToString();
        Role.Text = dv.Table.Rows[0]["Role"].ToString();
        DateJoined.Text = dv.Table.Rows[0]["DateJoined"].ToString();
        National_Id.Text = dv.Table.Rows[0]["NationalID"].ToString();
        Specialization.Text = dv.Table.Rows[0]["Specialization"].ToString();

        LabelEm.Text = dv.Table.Rows[0]["name"].ToString();
    }

    protected void loadBlocksDropDown()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM TeamBlock", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        Block.DataSource = dt;
        Block.DataTextField = "BlockName";
        Block.DataValueField = "BlockId";
        Block.DataBind();
        Block.Items.Insert(0, new ListItem("Select a Block", "0"));
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        int rr = new Random().Next(999, 99999999);
        string file = rr.ToString() + ".png";
        string image = Server.MapPath("assets/img/" + file);
        ff1.SaveAs(image);

        ds.UpdateCommand = $"Update Employee Set name='{EmployeeName.Text}',Gender='{Gender.Text}',PhoneNumber='{phoneNumber.Text}',Email='{Email.Text}',BlockId='{Block.Text}',Address='{address.Text}',BirthDate='{Birthdate.Text}',Nationality='{Nationality.Text}',Role='{Role.Text}',DateJoined='{DateJoined.Text}',NationalID='{National_Id.Text}',Specialization='{Specialization.Text}',Photo='{file}', BlockId='{Block.SelectedValue}' where EmployeeId='{Request.QueryString["id"]}'";
        ds.Update();
        Panel1.Visible = true;

    }
    protected void Button_Profile(object sender, EventArgs e)
    {
        Response.Redirect("ViewMyProfile.aspx?id=" + Request.QueryString["id"]);

    }
    protected void Button_Close(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }
</script>
<style>
    .PoupupMsg {
        background: #e4e6fb;
        width: 360px;
        height: 250px;
        text-align: center;
        padding: initial;
        position: fixed;
        top: 38%;
        left: 48%;
        transform: translate(-150px, 0px);
        box-shadow: 6px 8px rgba(0, 0, 0, 0.1);
    }

    .BtnClose {
        padding: 5px;
        border: 0px solid black;
        background-color: grey; /*#6C439B;*/
        color: white;
        border-radius: 5px;
        font: inherit;
    }

    .button3 {
        padding: 10px;
        border: 0px solid black;
        background-color: #6C439B;
        color: white;
        border-radius: 5px;
        font: inherit;
        margin: 25px 500px 25px 500px;
    }

    }
</style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Edit Staff Profile</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="../assets/img/managment.png" rel="icon" />
    <link href="../assets/img/managment (1).png" rel="small-icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet" />

    <!-- Vendor CSS Files -->
    <link href="../assets/vendor/animate.css/animate.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />


    <!-- Template Main CSS File -->
    <!-- Template Main CSS File -->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" media="screen">

    <!---->
    <link href="../assets/css/box/style1.css" rel="stylesheet">
    <link href="../assets/css/all.css" rel="stylesheet">
</head>

<body>
    <form id="form1" runat="server">
        <div>
        </div>


        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top d-flex align-items-center">
            <div class="container d-flex align-items-center">

                <a href="../AdminHomePage.aspx" class="logo me-auto">
                    <img src="../assets/img/Logo2.png" style="width: 160px; height: 250px"
                        alt="logo" class="img-fluid" /></a>

                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a href="../ScheduleP1.aspx">Schedule</a></li>
                        <li><a href="../Attendance.aspx">Attendance</a></li>
                        <li><a href="../Block.aspx">Blocks</a></li>

                        <li class="dropdown"><a href="#"><span>Profiles</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><a href="../StudentProfiles.aspx">Student Profiles</a></li>
                                <li><a href="../StaffProfiles.aspx">Staff Profiles</a></li>
                            </ul>
                        </li>
                        <div>
                            <li class="dropdown">
                                <asp:Image ID="Image1" Width="40" Height="40" runat="server" class="getstarted" />
                                <ul>
                                    <li><a href="ViewMyProfile.aspx">View Profile</a></li>
                                    <li><a href="Logout.aspx">Logout</a></li>
                                </ul>
                            </li>
                        </div>
                </nav>
                <!-- .navbar -->
            </div>
        </header>
        <!-- End Header -->


        <!-- ======= Breadcrumbs ======= -->
        <section id="breadcrumbs" class="breadcrumbs">
            <div class="container">

                <div class="d-flex justify-content-between align-items-center">
                    <ol>
                        <li><a href="AdminHomePage.aspx" style="color: #6C439B">Home page</a></li>
                        <li><a href="Profiles.aspx" style="color: #6C439B">Profiles</a></li>
                        <li><a href="StaffProfiles.aspx" style="color: #6C439B">Staff profiles</a></li>
                        <li>
                            <asp:LinkButton ID="LinkButton1" OnClick="Button_Profile" runat="server" Style="color: #6C439B">
                                <asp:Label ID="LabelEm" runat="server"></asp:Label>
                                Profile
                            </asp:LinkButton></li>
                        <li>Edit Profile</li>
                    </ol>
                </div>

            </div>
        </section>
        <!-- End Breadcrumbs -->


        <!-- ======= search section ======= -->
        <div id="blog" class="blog">
            <div class="container align-items-center" data-aos="fade-up">
                <div class="sidebar justify-content-sm-center">

                    <div class="row justify-content-sm-center">
                        <div class="cl-xl-7 col-lg-8 col-md-10">
                            <div class="section-tittle text-center">
                                <h2>Edit Staff Profile</h2>

                            </div>
                        </div>
                    </div>


                    <div class="row justify-content-center">

                        <div class="col-md-5 form-group" style="text-align: left;">
                            <label for="Name" class="colleft1" style="text-align: left">Full Name<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="EmployeeName"
                                ForeColor="Red" runat="server"
                                ErrorMessage="Please enter staff name"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="EmployeeName" runat="server" class="form-control" Style="font-size: 10pt"
                                placeholder="Enter staff full name"></asp:TextBox>
                        </div>

                        <div class="col-md-5 form-group mt-3 mt-md-0" style="text-align: left;">
                            <label for="Name" class="colleft1" style="text-align: left">Phone Number<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="phoneNumber"
                                ForeColor="Red" runat="server"
                                ErrorMessage="Please enter the phone number"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="phoneNumber" runat="server" class="form-control" Style="font-size: 10pt"
                                placeholder="Enter staff phone number"></asp:TextBox>
                        </div>
                    </div>




                    <div class="row justify-content-center">

                        <div class="col-md-5 form-group" style="text-align: left;">
                            <label for="Birth Date" class="colleft1">Birth Date<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Birthdate"
                                ForeColor="Red" runat="server"
                                ErrorMessage="Please enter the birth date"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="Birthdate" runat="server" class="form-control" Style="font-size: 10pt"
                                placeholder="Enter staff birth date"></asp:TextBox>

                        </div>

                        <div class="col-md-5 form-group mt-3 mt-md-0" style="text-align: left;">
                            <label for="Gender" class="colleft1">Gender<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="Gender"
                                ForeColor="Red" runat="server"
                                ErrorMessage="Please enter the gender"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="Gender" class="form-control" runat="server" Style="font-size: 10pt">
                                <asp:ListItem> Select a Gender </asp:ListItem>
                                <asp:ListItem> Male </asp:ListItem>
                                <asp:ListItem> Female </asp:ListItem>
                            </asp:DropDownList>


                        </div>
                    </div>


                    <div class="row justify-content-center">

                        <div class="col-md-5 form-group" style="text-align: left;">
                            <label for="Email" class="colright1">Email<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="Email"
                                ForeColor="Red" runat="server"
                                ErrorMessage="Please enter the email"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="Email" runat="server" class="form-control" Style="font-size: 10pt"
                                placeholder="Enter staff email"></asp:TextBox>
                        </div>



                        <div class="col-md-5 form-group" style="text-align: left;">
                            <label for="Nationality" class="colright1">Nationality<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Nationality"
                                ForeColor="Red" runat="server"
                                ErrorMessage="Please enter the nationality"></asp:RequiredFieldValidator>

                            <asp:TextBox ID="Nationality" runat="server" class="form-control" Style="font-size: 10pt"
                                placeholder="Enter staff nationality"></asp:TextBox>

                        </div>

                    </div>

                    <div class="row justify-content-center">
                        <div class="col-md-5 form-group mt-3 mt-md-0" style="text-align: left;">
                            <label for="National Id" class="colright1">National ID<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="National_Id"
                                ForeColor="Red" runat="server"
                                ErrorMessage="Please enter the national Id"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="National_Id" runat="server" class="form-control" Style="font-size: 10pt"
                                placeholder="Enter staff national Id"></asp:TextBox>
                            <asp:Label ID="National_IdERORR" runat="server" Text="The national id already exists"
                                Visible="false" ForeColor="Red"></asp:Label>
                        </div>


                        <div class="col-md-5 form-group" style="text-align: left;">
                            <label for="Address" class="colright1">Address<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="address"
                                ForeColor="Red" runat="server"
                                ErrorMessage="Please enter the address"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="address" runat="server" class="form-control" Style="font-size: 10pt"
                                placeholder="Enter staff address"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row justify-content-center">
                        <div class="col-md-5 form-group mt-3 mt-md-0" style="text-align: left;">
                            <label for="Role" class="colright1">Role<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="Role"
                                ForeColor="Red" runat="server"
                                ErrorMessage="Please enter the role"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="Role" runat="server" class="form-control" Style="font-size: 10pt"
                                placeholder="Enter staff Role"></asp:TextBox>
                        </div>


                        <div class="col-md-5 form-group" style="text-align: left;">
                            <label for="Specialization" class="colright1">Specialization<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="Specialization"
                                ForeColor="Red" runat="server"
                                ErrorMessage="Please enter the specialization"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="Specialization" runat="server" class="form-control" Style="font-size: 10pt"
                                placeholder="Enter staff specialization"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row justify-content-center">
                        <div class="col-md-5 form-group mt-3 mt-md-0" style="text-align: left;">
                            <label for="DateJoined" class="colright1">Date Joined<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="DateJoined"
                                ForeColor="Red" runat="server"
                                ErrorMessage="Please enter the date joined"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="DateJoined" runat="server" class="form-control" Style="font-size: 10pt"
                                placeholder="Enter staff date joined"></asp:TextBox>

                        </div>


                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

                        <div class="col-md-5 form-group" style="text-align: left;">
                            <label for="Block" class="colleft1">Block<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="Block"
                                ForeColor="Red" runat="server" ErrorMessage="Please choose a block"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="Block" class="form-control" runat="server" Style="font-size: 10pt">
                            </asp:DropDownList>

                        </div>

                    </div>

                    <div class="row justify-content-center">
                        <div class="col-md-5 form-group mt-3 mt-md-0" style="text-align: left;">

                            <label for="Photo" class="colright1">Profile photo </label>
                            <asp:FileUpload ID="ff1" runat="server" class="form-control" Style="font-size: 10pt" />

                        </div>

                        <div class="col-md-5 form-group" style="text-align: left;">
                        </div>

                    </div>

                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Class="button3" Text="Edit profile" />

                </div>
            </div>
        </div>
        <!-- End Edit profile  Section -->

        <!-- ======= Poupup msg ======= -->
        <asp:Panel ID="Panel1" runat="server" Visible="false" class="PoupupMsg">
            <pre> 
</pre>
            <img src="check.png" width="70" alt="" />
            <pre> </pre>
            <h4>The Profile edited successfully</h4>
            <br />
            <asp:Button ID="Button2" runat="server" Class="BtnClose" Text="Close" OnClick="Button_Close" /><br />
        </asp:Panel>

        <!-- End Poupup msg  -->

        <!-- ======= Footer ======= -->
        <footer id="footer">
            <div class="container">
                <div class="copyright">
                    &copy; Copyright <strong><span>Tammakan</span></strong>. All Rights
        Reserved
                </div>
            </div>
        </footer>
        <!-- End Footer -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </form>
</body>

</html>
