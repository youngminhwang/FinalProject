<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header2.jsp" />

<link rel="stylesheet" href="/resources/css/diaryform.css">
<script type="text/javascript" src="/resources/js/diaryview.js"></script>

<div id="wrap-box-top">
	<div>
		<a href="/diary/calendar?no=${myPlant.myPlantNo}">
			<span class="glyphicon glyphicon-arrow-left"></span>&nbsp;일기 달력
		</a>
	</div>
	<div id="title-box">일기 보기</div>
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
				<span hidden="true">${diary.ddate}</span>
				<span>${newDate}</span>
			</div>
			<form action="/diary/alter" method="post" enctype="multipart/form-data" id="form">
				<div class="diary-box">
					<div class="write-box">
						<p>온도</p>
						<input type="text" class="form-control" name="temp" placeholder="&#x2103;" value="${diary.temp}" disabled>
					</div>
					<div class="tip-box">
						<c:if test="${empty diary.temp}">
							<p class='text-danger'>
							<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 온도 TIP
							</p>
							<p class='text-muted'>${tip.get('temp')}</p>
						</c:if>
						<c:if test="${not empty diary.temp}">
							<fmt:parseNumber var="t" value="${diary.temp}" />
							<c:choose>
								<c:when test="${code.temp eq '082001'}">
									<c:if test="${t >= 10 and t <= 15}">
										<p class='text-danger'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 온도 TIP
										</p>
										<p class='text-success'>적정 온도 입니다!</p>
									</c:if>
									<c:if test="${t < 10 or t > 15}">
										<p class='text-danger'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 온도 TIP
										</p>
										<p class='text-muted'>${tip.get('temp')}</p>
									</c:if>
								</c:when>
								<c:when test="${code.temp eq '082002'}">
									<c:if test="${t >= 16 and t <= 20}">
										<p class='text-danger'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 온도 TIP
										</p>
										<p class='text-success'>적정 온도 입니다!</p>
									</c:if>
									<c:if test="${t < 16 or t > 20}">
										<p class='text-danger'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 온도 TIP
										</p>
										<p class='text-muted'>${tip.get('temp')}</p>
									</c:if>
								</c:when>
								<c:when test="${code.temp eq '082003'}">
									<c:if test="${t >= 21 and t <= 25}">
										<p class='text-danger'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 온도 TIP
										</p>
										<p class='text-success'>적정 온도 입니다!</p>
									</c:if>
									<c:if test="${t < 21 or t > 25}">
										<p class='text-danger'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 온도 TIP
										</p>
										<p class='text-muted'>${tip.get('temp')}</p>
									</c:if>
								</c:when>
								<c:when test="${code.temp eq '082004'}">
									<c:if test="${t >= 26 and t <= 30}">
										<p class='text-danger'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 온도 TIP
										</p>
										<p class='text-success'>적정 온도 입니다!</p>
									</c:if>
									<c:if test="${t < 26 or t > 30}">
										<p class='text-danger'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 온도 TIP
										</p>
										<p class='text-muted'>${tip.get('temp')}</p>
									</c:if>
								</c:when>
							</c:choose>
						</c:if>
					</div>
					<div class="write-box">
						<p>습도</p>
						<input type="text" class="form-control" name="humid" placeholder="%" value="${diary.humid}" disabled>
					</div>
					<div class="tip-box">
						<c:if test="${empty diary.humid}">
							<p class='text-info'>
							<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 습도 TIP
							</p>
							<p class='text-muted'>${tip.get('humid')}</p>
						</c:if>
						<c:if test="${not empty diary.humid}">
							<fmt:parseNumber var="h" value="${diary.humid}" />
								<c:choose>
									<c:when test="${code.humid eq '083001'}">
										<c:if test="${h >= 40}">
											<p class='text-info'>
											<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 습도 TIP
											</p>
											<p class='text-muted'>${tip.get('humid')}</p>
										</c:if>
										<c:if test="${h < 40}">
											<p class='text-info'>
											<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 습도 TIP
											</p>
											<p class='text-success'>적정 습도 입니다!</p>
										</c:if>
									</c:when>
									<c:when test="${code.humid eq '083002'}">
										<c:if test="${h < 40 or h > 70}">
											<p class='text-info'>
											<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 습도 TIP
											</p>
											<p class='text-muted'>${tip.get('humid')}</p>
										</c:if>
										<c:if test="${h >= 40 and h <= 70}">
											<p class='text-info'>
											<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 습도 TIP
											</p>
											<p class='text-success'>적정 습도 입니다!</p>
										</c:if>
									</c:when>
									<c:when test="${code.humid eq '083003'}">
										<c:if test="${h <= 70}">
											<p class='text-info'>
											<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 습도 TIP
											</p>
											<p class='text-muted'>${tip.get('humid')}</p>
										</c:if>
										<c:if test="${h > 70}">
											<p class='text-info'>
											<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 습도 TIP
											</p>
											<p class='text-success'>적정 습도 입니다!</p>
										</c:if>
									</c:when>
								</c:choose>
						</c:if>
					</div>
				</div>
				<div class="diary-box">
					<div class="write-box">
						<p>흙</p>
						<input type="text" class="form-control" name="dirt" value="${diary.dirt}" disabled>
						<div class="hidden-box" hidden="true">
							<div class="btn-group" data-toggle="buttons">
								<c:choose>
									<c:when test="${diary.dirt eq '과습'}">
	  								<label class="btn btn-xs btn-info active">
	   								<input type="radio" name="dirt" value="과습" checked>과습
		  							</label>
		  							</c:when>
		  							<c:otherwise>
		  							<label class="btn btn-xs btn-info">
	   									<input type="radio" name="dirt" value="과습">과습
		  							</label>
		  							</c:otherwise>
		  						</c:choose>
		   						<c:choose>
									<c:when test="${diary.dirt eq '건조'}">
		  							<label class="btn btn-xs btn-warning active">
		   								<input type="radio" name="dirt" value="건조" checked>건조
		 							 </label>
		 							 </c:when>
		   							<c:otherwise>
		   							<label class="btn btn-xs btn-warning">
		   								<input type="radio" name="dirt" value="건조">건조
		 							 </label>
		 							</c:otherwise>
		 						</c:choose>
							</div>
						</div>
					</div>
					<div class="tip-box">
						<c:if test="${empty diary.dirt}">
							<p class='text-warning'>
							<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 흙 TIP
							</p>
							<p class='text-muted'>${tip.get('dirt')}</p>
						</c:if>
						<c:if test="${not empty diary.dirt}">
							<c:choose>
								<c:when test="${code.dirt eq '053001'}">
									<c:if test="${diary.dirt eq '건조'}">
										<p class='text-warning'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 흙 TIP
										</p>
										<p class='text-muted'>${tip.get('dirt')}</p>
									</c:if>
									<c:if test="${diary.dirt eq '과습'}">
										<p class='text-warning'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 흙 TIP
										</p>
										<p class='text-success'>${tip.get('dirt')}</p>
									</c:if>
								</c:when>
								<c:when test="${code.dirt eq '053002'}">
									<c:if test="${diary.dirt eq '건조'}">
										<p class='text-warning'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 흙 TIP
										</p>
										<p class='text-muted'>${tip.get('dirt')}</p>
									</c:if>
									<c:if test="${diary.dirt eq '과습'}">
										<p class='text-warning'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 흙 TIP
										</p>
										<p class='text-success'>${tip.get('dirt')}</p>
									</c:if>
									</c:when>
								<c:when test="${code.dirt eq '053003'}">
									<c:if test="${diary.dirt eq '과습'}">
										<p class='text-warning'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 흙 TIP
										</p>
										<p class='text-muted'>${tip.get('dirt')}</p>
									</c:if>
									<c:if test="${diary.dirt eq '건조'}">
										<p class='text-warning'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 흙 TIP
										</p>
										<p class='text-success'>${tip.get('dirt')}</p>
									</c:if>
								</c:when>
								<c:when test="${code.dirt eq '053004'}">
									<c:if test="${diary.dirt eq '과습'}">
										<p class='text-warning'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 흙 TIP
										</p>
										<p class='text-muted'>${tip.get('dirt')}</p>
									</c:if>
									<c:if test="${diary.dirt eq '건조'}">
										<p class='text-warning'>
										<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;${myPlant.bname} 흙 TIP
										</p>
										<p class='text-success'>${tip.get('dirt')}</p>
									</c:if>
								</c:when>
							</c:choose>
						</c:if>
					</div>
					<div class="write-box" id="check-box">
						<table class="table" id="check-table">
							<tr>
								<td>물주기</td>
								<td>
								<c:if test="${diary.water eq '1'}">
								<span class="glyphicon glyphicon-ok"></span>
								</c:if>
								<c:if test="${diary.water eq '0'}">
								<span class="glyphicon glyphicon-remove"></span>
								</c:if>
								</td>
							</tr>
							<tr>
								<td>분갈이</td>
								<td>
								<c:if test="${diary.repot eq '1'}">
								<span class="glyphicon glyphicon-ok"></span>
								</c:if>
								<c:if test="${diary.repot eq '0'}">
								<span class="glyphicon glyphicon-remove"></span>
								</c:if>
								</td>
							</tr>
							</table>
						<div class="hidden-box" hidden="true">	
							<table class="table" id="check-table">
							<tr>
								<td>물주기</td>
								<td>
								<c:if test="${diary.water eq '1'}">
								<td><input type="checkbox" name="water" checked></td>
								</c:if>
								<c:if test="${diary.water eq '0'}">
								<td><input type="checkbox" name="water"></td>
								</c:if>
								</td>
							</tr>
							<tr>
								<td>분갈이</td>
								<td>
								<c:if test="${diary.repot eq '1'}">
								<td><input type="checkbox" name="repot" checked></td>
								</c:if>
								<c:if test="${diary.repot eq '0'}">
								<td><input type="checkbox" name="repot"></td>
								</c:if>
								</td>
							</tr>
							</table>
						</div>
					</div>
					<div class="tip-box">
					</div>
				</div>
				<div id="content-con">
					<div id="content-box">
						<div class="title-box">일기 쓰기&nbsp;<span class="glyphicon glyphicon-menu-down"></span></div>
						<textarea class="form-control" rows="4" name="cmt" disabled>${diary.cmt}</textarea>
					</div>
					<div id="upload-box">
						<div class="title-box">
							<label for="upload-file">
								사진 첨부&nbsp;<span class="glyphicon glyphicon-picture"></span>
							</label>
							<input type="file" accept="image/gif, image/jpeg, image/png" 
							 class="form-control" id="upload-file" name="file" disabled>
							<input type="hidden" id="origin" name="origin" value="${diary.origin}">
							<input type="hidden" id="stored" name="stored" value="${diary.stored}">
						</div>
						<div id="upload-photo-box">
							<c:if test="${not empty diary.stored}">
								<img src="/upload/${diary.stored}" style="width:130px; height:130px;">
							</c:if>
						</div>
						<div>
							<div id="upload-name">
								<c:if test="${not empty diary.origin}">
									${diary.origin}&nbsp;
									<span id="remove-button" hidden="true">
									<span class="glyphicon glyphicon-remove-circle"></span>
									</span>
								</c:if>
							</div>
							<div id="submit-box">
								<button type="button" class="btn btn-success btn-sm" id="alter-button">수정 하기</button>
								<a href="/diary/delete?date=${diary.ddate}">
								<button type="button" class="btn btn-warning btn-sm" id="drop-button">삭제 하기</button>
								</a>
								<div class="hidden-box" hidden="true">
									<input type="hidden" name="ddate" value="${diary.ddate}">
									<button type="submit" class="btn btn-success btn-sm" id="write-button">작성 완료</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
