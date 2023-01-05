<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home- Online Food Ordering</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	

	<%@ include file="./components/message.jsp"%>
	
	<%
	    List<Food> foods = (List<Food>)request.getAttribute("foods");
	    String foodsSentFromOtherSource = (String)request.getAttribute("sentFromOtherSource");
	    List<Category> categories = categoryDao.findAll();  
	    
	    if(foodsSentFromOtherSource == null ){
	    	foods = foodDao.findAll();
	    }
	%>
	
	<div class="container-fluid">

   <!-- show categories -->
   
       <div class="row">
         <div class="col-md-2 " >
             <div class="list-group mt-4">
                 
                 <a href="category?categoryId=0" class="list-group-item list-group-item-action active"  style="background-color: #f37084" ><span class="text-color">All Cuisines</span></a>
               <%
                    for(Category c: categories)
                    {    	
               %>      
                         <a href="category?categoryId=<%=c.getId() %>" class="list-group-item list-group-item-action"><%=c.getName()%></a>
               <%
                    }
               %>
               </div>
         </div>     
   
   
   
   <!-- ****************************************** -->

   <!-- show products -->
   
   <%
       if(foods!=null)
       {
   %>
     
     <div class="col-md-10 ">
         
             <div class="row mt-4">
                 <div class="col-md-12 admin">
                     <div class="card-columns hover">
                     
                         <%
                             String stock="Out Of Stock!!!"; 
                             for(Food p: foods)
                             {
                         %>
                        
                         <div class="card">
                              
                             <img src="resources/productpic/<%=p.getImagePath() %>" style="max-height:270px;max-width:100%;width:auto;" class="card-img-top rounded mx-auto d-block m-2" alt="img">
                         
                             <div class="card-body">
                                 <h5 class="card-title"><a href="food?foodId=<%=p.getId()%>" style="text-decoration: none;color:black;"> <%=p.getName() %></a></h5>
                                 <p class="card-text"><%=Helper.get10Words(p.getDescription()) %></p> 
                             </div>
                             <div class="card-footer text-center">
                                 <p style="font-size:25px"><span class="ml-2"><b>&#8377;<%=Helper.getFoodSellingPrice(p.getPrice(), p.getDiscount()) %>/-</b></span>
                                 <span class="ml-2" style="font-size:20px;color:red"><s>&#8377;<%=p.getPrice()%></s></span>
                                  <span class="ml-2" style="font-size:20px;color:green"><%=p.getDiscount() %>&#37 off</span>
                                 </p>
                                  
             
                             </div>
                             
                         </div>
                         
                       
                         <%
                             
                             }
                         %>
                     </div>
                 </div>
             </div>
            
         </div>
         
     <%
         } 
     %> 
    
         
      <!-- ******* -->
 
   
         
    </div>
 </div>


</body>
</html>