<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="tweet" required="true" type="in.fount.model.Tweet"%>
<%

%><div	class='tweet' 
		data-jmapping="{
			id: '${tweet.id}', 
			point: {lat: ${tweet.lat}, lng: ${tweet.lon}},
			category: '<%
			if(tweet.getHealth()<.82){
				%>green1<%
			}else if(tweet.getHealth()<.84){
				%>green2<%
			}else if(tweet.getHealth()<.86){
				%>green3<%
			}else if(tweet.getHealth()<.88){
				%>green4<%
			
			}else if(tweet.getHealth()<.90){
				%>yellow0<%
			}else if(tweet.getHealth()<.92){
				%>yellow1<%
			}else if(tweet.getHealth()<.94){
				%>yellow2<%
			}else if(tweet.getHealth()<.96){
				%>yellow3<%
			}else if(tweet.getHealth()<.98){
				%>yellow4<%

			}else if(tweet.getHealth()<1){
				%>orange0<%
			}else if(tweet.getHealth()<1.02){
				%>orange1<%
			}else if(tweet.getHealth()<1.04){
				%>orange2<%
			}else if(tweet.getHealth()<1.06){
				%>orange3<%
			}else if(tweet.getHealth()<1.08){
				%>orange4<%

			}else if(tweet.getHealth()<1.1){
				%>red0<%
			}else if(tweet.getHealth()<1.12){
				%>red1<%
			}else if(tweet.getHealth()<1.14){
				%>red2<%
			}else if(tweet.getHealth()<1.16){
				%>red3<%
			}else{
				%>red<%
			}%>; ${tweet.created_at}'
		}"
		style="width:31%; margin:1%; float:left"
><%

%><div class="container">
	<div class="snippet">
		<a href="#" class="map-link"
				alt="show ${tweet.from_user} on the map">
				<img class='photo' src='${tweet.profile_image_url}' />
		</a>

			<a	href="#" class="map-link"
				alt="show  ${tweet.from_user} on the map">
				<span class="fn org"> ${tweet.from_user} </span>
				<font style="color:red; font-size:large"> ${tweet.health}</font>
			</a>
 	 		<div class='announcement'>${tweet.text}</div>
			<div class='announcement'>Time: ${tweet.created_at}</div>
		</div><%// --- end snippet

%></div><% // --- end of the container div
					
%></div><% // --- end of the tweet div%>