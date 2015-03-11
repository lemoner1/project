<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.daum.*" %>
<%@ page import="vo.school.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DUMBOs</title>
</head>
<!--  
 <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
 -->
 <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=0e8c0b4caf1b89ff80896081677bc050&libraries=services"></script>
 <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
    <script>   /*script에서 td를 받아오면 3 6 9 12 이런식으로 증가하게된다 그러므로 
                *td의 length를 계산한후 index에 값을 넣어주게되면 성공적으로 좌표 input이 가능하다
                *error가 났던 이유->td 대신 table을 받으려고하면  for문과 script문이 꼬이게되어 문제가 발생한다 */
       var count =0;
   /*   function codeAddress(address_2) {
       var rows = $("td");
        var address = address_2;
        var geocoder = new google.maps.Geocoder();
         
        geocoder.geocode( { 'address': address}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK) {
                var index=(rows.length-1);
                console.log(index);
               var LAT=$(rows).eq(index-1);
                var LNG=$(rows).eq(index);
                LAT.text(results[0].geometry.location.lat());
                LNG.text(results[0].geometry.location.lng());
                
             
            
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      
      }
   */
   
   function codeAddress(address_2) {
       var rows = $("td");
        var address = address_2;

      // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new daum.maps.services.Geocoder();
         
        geocoder.addr2coord(''+address, function(status,result) {
           if (status === daum.maps.services.Status.OK) {
                var index=(rows.length-1);
                console.log(index);
               var LAT=$(rows).eq(index-1);
                var LNG=$(rows).eq(index);
                
                LAT.text(result.addr[0].lat);
                LNG.text(result.addr[0].lng);
                
             
            
          } else {
           // alert('Geocode was not successful for the following reason: ' + status);
            
          }
        });
      
      }
      
      function delay(gap){
         
         var then,now;
         then=new Date().getTime();
         now=then;
         while((now-then)<gap){
            now= new Date().getTime();//현재시간을 읽어 함수를 불러들인 시간과의 차를 이용하여 처리
         }
      }
    </script>
<body>

<table border="1">
   

<%
               ArrayList daum_address = (ArrayList)request.getAttribute("daum_address");
               String address = null;
               
               if(daum_address.size()>0)
               {
                  for(int i=0; i<2000; i++)
                  {
                     Object obj = null;
                     obj = daum_address.get(i);
                     if(obj instanceof School)
                     {
                    	 School school  = (School)obj;
                        
                        address = school.getAddress();   
                     }
                     
%>
      <tr>
         <td><%=address%></td><td></td><td></td>
      </tr>
      <script>
      var temp_adr ="<%=address%>";  
      codeAddress(temp_adr);
   
      
      </script>
<%
                                          
                  
      }
      %>
   
<% 
               }
            
%>


   </table>

</body>
</html>