<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>




 <div id="content-wrapper">
	
      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Tables</li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Data Table Example</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>Title</th>
                    <th>CreateBy</th>
                    <th>CreateDate</th>
                    <th>Categories</th> 
                    <th>Status</th>
                  </tr>
                </thead>
                <tfoot>
                   <tr>
                     <th>Title</th>
                    <th>CreateBy</th>
                    <th>CreateDate</th>
                    <th>Categories</th>
                    <th>Status</th>
                  </tr>
                </tfoot>
                <tbody>	
                 <c:forEach var="c" items="${list}" varStatus="loopCounter" >
                  <tr>
                 
		 			
                    <td>${c.title}</td>
                    <td>${c.user.id}</td>
                    <td>${c.createDate}</td>
                      <td>${c.categories.name}</td>
                    <td><a class="check-list"  href="/admin/checkNews/${loopCounter.count}/${c.id}" id="${loopCounter.count}"><button style="font-size:24px ;color:red"> <i class="fa fa-check"></i></button></a></td>
                  
					
  
                  </tr>
                  </c:forEach>
                  
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

        <p class="small text-center text-muted my-5">
          <em>More table examples coming soon...</em>
        </p>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->


  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>
  
  <script>
  
$( "a.check-list" ).click(function( event ) {
	 var myId = $(this).attr('id');
	
  event.preventDefault();
  Swal.fire({
	  title: 'Are you sure?',
	  text: "You won't be able to revert this!",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: 'Yes, confirm it!',
	}).then((result) => {
	  if (result.value) {
	    Swal.fire(
	      'Congratulations!',
	      'Your file has been changed.',
	      'success'    
	    ).then(function() {
			let getId = myId;
	/* 		alert(getId); */
			var href = $("#"+getId).attr("href")
		/* 	alert(href) */
	    	window.location.href = href  
		})
	   
	  }
	 
	})
	
	return false;	
});

</script>