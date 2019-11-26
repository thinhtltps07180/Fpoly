<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>






<h1>
	<jsp:include page="../client/info.jsp" />
</h1>

${message }

<hr />
<div class="row">

	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
		<div class="thumbnail">
			<a href="#"><img src="/static/images/banner/${add.image}"
				class="img-thumbnail " alt=""></a>
			<div class="caption">

				<p>UnitPrice : ${add.unitPrice}</p>

				<p>
					<a href="/client/add/${add.id}" class="btn btn-primary">BUY</a>
				</p>
			</div>


		</div>
	</div>

</div>



