<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="/static/admin/vendor/jquery/jquery.min.js"></script>
<script src="/static/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/static/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
<style>
  .details li {
      list-style: none;
    }
    li {
        margin-bottom:10px;
        
    }
    
    img#anh-cu {
    width: 211px;
    height: 148px;
}
</style>

<script>
	var openFile = function(field) {
		var reader = new FileReader();
		reader.onload = function() {
			console.log(reader.result);
			var img = new Image(150, 100);
			img.onload = function() {
				 var img1 = document.getElementById("anh");
				 img1.innerHTML = '';
				 img1.appendChild(img);
			}
			img.src = reader.result;
		};
		reader.readAsDataURL(field.files[0]);
	};
</script>





<div class="container no-padding">
	<div class="row">
		<div class="col-lg-8 post-list">
		<div class="jumbotron">
                  <div class="row"></div>
                  
                      <div class="col-md-4 col-xs-12 col-sm-6 col-lg-4">
                        <img id="anh-cu" alt="" src="/static/images/users/${userEdit.photo }">
                      </div>
                      <div class="col-md-8 col-xs-12 col-sm-6 col-lg-8">
                          <div class="container" style="border-bottom:1px solid black">
                            <h2>${userEdit.id}</h2>
                          </div>	
                            <hr>
                          <ul class="container details">
                            <li><p><span class="glyphicon glyphicon-earphone one" style="width:50px;"></span>Email: ${userEdit.email }</p></li>
                         
                            <li><p><span class="glyphicon glyphicon-new-window one" style="width:50px;"></span><a href="/home/edit/${ userEdit.id}">Edit your profile</p></a>
                          </ul>
                      </div>
                  </div>
			</div>
			
				
		
		</div>