<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE>
<div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Data Table Example</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>Id</th>
                    <th>orderDate</th>
                    <th>amount</th>
                    <th>description</th>
                    <th>orderBy</th>
                    <th>orderId</th>      
                  </tr>
                </thead>
                <tfoot>
                    <tr>
                    <th>Id</th>
                    <th>orderDate</th>
                    <th>amount</th>
                    <th>description</th>
                    <th>orderBy</th>
                    <th>orderId</th>      
                  </tr>
                </tfoot>
                <tbody>
                 <c:forEach var="c" items="${list}">
                  <tr>
                 
		 			<td>${c.id}</td>
                    <td>${c.orderDate}</td>
                    <td>${c.amount}</td>
                    <td>${c.description}</td>
                    <td>${c.user.id}</td>
                    <td>${c.orderDetails.id}</td>
                  </tr>
                  </c:forEach>
                  
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
	