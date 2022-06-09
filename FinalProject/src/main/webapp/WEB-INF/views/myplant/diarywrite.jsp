<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header2.jsp" />

<link rel="stylesheet" href="/resources/css/diaryform.css">
<script type="text/javascript" src="/resources/js/diarywrite.js"></script>

<div id="wrap-box-top">
	<div>
		<a href="/diary/calendar?no=${myPlant.myPlantNo}">
			<span class="glyphicon glyphicon-arrow-left"></span>&nbsp;일기 달력
		</a>
	</div>
	<div id="title-box">일기 쓰기</div>
	<div></div>
</div>
<div id="wrap-box">
	<div id="diary">
		<div id="profile-box">
			<div>
				<c:if test="${not empty myPlant.stored}">
					<img src="/upload/${myPlant.stored}" class="img-thumbnail" id="plant-photo">
				</c:if>
				<c:if test="${empty myPlant.stored}">
					<img src="/resources/img/default.jpg" class="img-thumbnail" id="plant-photo">
				</c:if>
			</div>
			<div id="info-box">
				<table class="table" id="profile-table">
					<tr><td>식물명 : </td><td>${myPlant.bname}</td></tr>
					<tr><td>이름 : </td><td>${myPlant.nick}</td></tr>
					<tr><td>심은날 : </td><td>${myPlant.birth}(${gapDays + 1}일째)</td></tr>
				</table>	
			</div>
		</div>
			<div id="date-box">
				<span>${newDate}</span>
			</div>
			<form action="/diary/write" method="post" enctype="multipart/form-data" id="form">
				<div class="diary-box">
					<div class="write-box">
						<p>온도</p>
						<input type="text" class="form-control" name="temp" placeholder="&#x2103;">
					</div>
					<div class="tip-box">
					</div>
					<div class="write-box">
						<p>습도</p>
						<input type="text" class="form-control" name="humid" placeholder="%">
					</div>
					<div class="tip-box">
					</div>
				</div>
				<div class="diary-box">
					<div class="write-box">
						<p>흙</p>
						<div class="btn-group" data-toggle="buttons">
	  						<label class="btn btn-xs btn-info">
	   							 <input type="radio" name="dirt" value="과습">과습
	  						</label>
	  						<label class="btn btn-xs btn-warning">
	   							 <input type="radio" name="dirt" value="건조">건조
	 						 </label>
						</div>
					</div>
					<div class="tip-box">
					</div>
					<div class="write-box" id="check-box">
						<table class="table" id="check-table">
							<tr>
								<td>물주기</td>
								<td><input type="checkbox" name="water"></td>
							</tr>
							<tr>
								<td>분갈이</td>
								<td><input type="checkbox" name="repot"></td>
							</tr>
						</table>
					</div>
					<div class="tip-box">
					</div>
				</div>
				<div id="content-con">
					<div id="content-box">
						<div class="title-box">일기 쓰기&nbsp;<span class="glyphicon glyphicon-menu-down"></span></div>
						<div id="text-box">
							<textarea class="form-control" rows="4" name="cmt"></textarea>
						</div>
					</div>
					<div id="upload-box">
						<div class="title-box">
							<label for="upload-file">
								사진 첨부&nbsp;<span class="glyphicon glyphicon-picture"></span>
							</label>
							<input type="file" accept="image/gif, image/jpeg, image/png" id="upload-file" name="file">
						</div>
						<div id="upload-photo-box"></div>
						<div>
							<div id="upload-name">
							</div>
							<div id="submit-box">
								<input type="hidden" name="ddate" value="${ddate}">
								<button type="submit" class="btn btn-success btn-sm" id="write-button">작성 완료</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
	