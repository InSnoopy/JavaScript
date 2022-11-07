<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    .pager{
	   float:left;
    }
    
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>

<!-- header -->
<%@ include file="./header.jsp" %>

<!-- aside1 -->
<%@ include file="../../site/aside1.jsp" %>	

	<!-- main -->
    <div class="col-sm-8 text-left"> 
      <h1>Welcome</h1>
      <p>WEB-IFN inner index jsp...</p>
      <hr>
      <!-- 리스트 영역 -->
	  <div id="list">
	  
	  	<div class="panel-group" id="accordion">
		  <div class="panel panel-default">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
		        Collapsible Group 1</a>
		      </h4>
		    </div>
		    <div id="collapse1" class="panel-collapse collapse in">
		      <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
		      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
		      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
		      commodo consequat.</div>
		    </div>
		  </div>
		  <div class="panel panel-default">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
		        Collapsible Group 2</a>
		      </h4>
		    </div>
		    <div id="collapse2" class="panel-collapse collapse">
		      <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
		      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
		      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
		      commodo consequat.</div>
		    </div>
		  </div>
		  <div class="panel panel-default">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
		        Collapsible Group 3</a>
		      </h4>
		    </div>
		    <div id="collapse3" class="panel-collapse collapse">
		      <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
		      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
		      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
		      commodo consequat.</div>
		    </div>
		  </div>
		</div>
	  
	  </div>
	  
	  <%-- 페이지 영역 --%>
	  <ul class="pager">
		  <li><a href="#">Previous</a></li>
      </ul>
      <ul class="pagination pager">
		  <li><a href="#">1</a></li>
		  <li><a href="#">2</a></li>
		  <li><a href="#">3</a></li>
		  <li><a href="#">4</a></li>
		  <li><a href="#">5</a></li>
	  </ul>
	  <ul class="pager">
		  <li><a href="#">Next</a></li>
      </ul>
	  
    </div>
    
<!-- aside2 -->
<%@ include file="../../site/aside2.jsp" %>	

<!-- footer -->
<%@ include file="../../site/footer.jsp" %>	
</body>
</html>
