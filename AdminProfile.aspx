﻿<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

  <title>Admin Homepage</title>
  <meta content="" name="description"/>
  <meta content="" name="keywords"/>

  <!-- Favicons -->
  <link href="../assets/img/managment.png" rel="icon"/>
  <link href="../assets/img/managment (1).png" rel="small-icon"/>

  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet"/>

  <!-- Vendor CSS Files -->
  <link href="../assets/vendor/animate.css/animate.min.css" rel="stylesheet"/>
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
  <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet"/>
  <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet"/>
  <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"/>


  <!-- Template Main CSS File -->
  <link href="../assets/css/style.css" rel="stylesheet"/>
  <link href="../assets/css/bootstrap.min.css" rel="stylesheet" media="screen"/>

  <!-- Other CSS File -->
  <link href="../assets/css/box/style1.css" rel="stylesheet"/>
  <link href="../assets/css/all.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        
        
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center">
      
      <a href="../AdminHomePage.aspx" class="logo me-auto"><img src="../assets/img/logo1.png" alt="logo"
          class="img-fluid"/></a>

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
        <div class="getstarted">
          <li class="dropdown"><img src="../assets/img/profile.png" alt="profile" style="width: 90%;">
            <ul>
              <li><a href="../ViewMyProfile.aspx">View Profile</a></li>
              <li><a href="../Logout.aspx">Logout</a></li>
            </ul>
          </li>
        </div>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->


      <!--  <div class="categories-area section-padding30">
        <div class="container">
        <div class="row justify-content-sm-center">
          <div class="cl-xl-7 col-lg-8 col-md-10">

            <div class="section-tittle text-center mb-70">
              <h2>Homepage</h2>
            </div>
          </div>
        </div>-->

       <!-- ======= Admin Profile Section ======= -->

  <section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <div class="carousel-inner" role="listbox">
        <!-- Type of services -->

        <div class="carousel-item active" style="background-image: url(../assets/img/background2.jpg)">
          <div class="carousel-container">
            <div class="container">

              <div class="categories-area section-padding30"> <!-- this in style1.css -->
                <div class="container align-items-center">

                

                </div>
              </div>
            </div><!-- End services -->
          </div>
        </div>
      </div>
    </div>
  </section><!-- End Homepage section -->


  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Tammakan</span></strong>. All Rights Reserved
      </div>
    </div>
  </footer><!-- End Footer -->

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
