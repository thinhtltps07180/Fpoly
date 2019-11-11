<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<!-- Custom fonts for this template-->
  <link href="/static/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <!-- Page level plugin CSS-->
  <link href="/static/admin/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  
  <link rel="stylesheet" href="style.css">
  <!-- Custom styles for this template-->
  <link href="/static/admin/css/sb-admin.css" rel="stylesheet">
</head>
<bodyid="page-top">

	
		<jsp:include page="layout/headeradmin.jsp"/>
		<jsp:include page="layout/navadmin.jsp"/>
		<tiles:insertAttribute name="body"/>
		
		<jsp:include page="layout/footeradmin.jsp"/>


   <script src="/static/admin/vendor/jquery/jquery.min.js"></script>
  <script src="/static/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/static/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="/static/admin/vendor/datatables/jquery.dataTables.js"></script>
  <script src="/static/admin/vendor/datatables/dataTables.bootstrap4.js"></script>
  
   <!-- Custom scripts for all pages-->
  <script src="/static/admin/js/sb-admin.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/static/admin/js/sb-admin.min.js"></script>
  
   <!-- Demo scripts for this page-->
  <script src="/static/admin/js/demo/datatables-demo.js"></script>
	
</body>
</html>