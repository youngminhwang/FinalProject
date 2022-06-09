window.onload = function() {

	function toString(Date) {
	
		const year = Date.getFullYear();
		const month = Date.getMonth() + 1;	
		const date = Date.getDate();
		let dateS = null;
	
		if ( month < 10) {
					
			if( date < 10 ) {	

				dateS = year + '0' + month + '0' + date;
								
			} else {
							
				dateS = year + '0' + month + date;
							
			}
							
		} else {
				
			if( date < 10) {
					
				dateS = year + '' + month + '0' + date;
					
			} else {
					
				dateS = '' + year + month + date;
					
			}
							
		} 
		
		return dateS;
	
	}
	
	function calender(today, x) {
		
		const $today = new Date(today.setDate(today.getDate() + x));
		
		const $todayS = toString($today);
		
		const year = $today.getFullYear();
		const month = $today.getMonth() + 1;
		const date = $today.getDate();
		const day = $today.getDay();
		
		const monthLastDay = new Date(year, month, 0);
		const monthLastDate = monthLastDay.getDate();
		
		const prevMonthLastDay = new Date (year, month - 1, 0);
		const prevMonthLastDate = prevMonthLastDay.getDate();
		
		let $year = year;
		let $month = month;
		let $date = date;
		
		for (let i = day; i < 7; ++i) {

			if ( $month < 10) {
						
				if( $date < 10 ) {

				arrDateS[i] = $year + '0' + $month + '0' + $date++;
								
				} else {
							
				arrDateS[i] = $year + '0' + $month + $date++;
							
				}
							
			} else {
				
				if( $date < 10) {
					
				arrDateS[i] = $year + '' + $month + '0' + $date++;
					
				} else {
					
				arrDateS[i] = '' + $year + $month + $date++;
					
				}
							
			} 
			
			if($date > monthLastDate) {
			
				$month = month + 1;
				$date = 1;
				
				if($month > 12)	{
					
					$year = year + 1;
					$month = 1; 
					
				}
				
			}
			
		}
		
		$year = year;
		$month = month;
		$date = date;
		
		for (let i = day; i > -1; --i) {

			if ( $month < 10) {
				
				if( $date < 10 ) {

				arrDateS[i] = $year + '0' + $month + '0' + $date--;
								
				} else {
							
				arrDateS[i] = $year + '0' + $month + $date--;
							
				}
							
			} else {
				
				if( $date < 10) {
					
				arrDateS[i] = $year + '' + $month + '0' + $date--;
					
				} else {
					
				arrDateS[i] = '' + $year + $month + $date--;
					
				}
							
			} 
		
			if($date < 1) {
			
				$month = month - 1;
				$date = prevMonthLastDate;
			
				if($month < 1) {
					
					$year = year - 1;
					$month = 12;
					
				}
			}
			
		}
		
		$year = year;
		$month = month;
		$date = date;
		
		for (let i = day; i < 7; ++i) {

			arrDate[i] = $month + ' / ' + $date++;
			
			if($date > monthLastDate) {
			
				$month = month + 1;
				$date = 1;
				
				if($month > 12)	$month = 1; 
				
			}

		}
	
		$month = month;
		$date = date;
	
		for (let i = day; i > -1; --i) {

			arrDate[i] = $month + ' / ' + $date--;
		
			if($date < 1) {
			
				$month = month - 1;
				$date = prevMonthLastDate;
			
				if($month < 1) $month = 12;
					
			}

		}
		
		$month = month;
		$date = date;
		
		document.getElementById('year').innerHTML = '' + year;
		
		const spanDate = document.getElementsByClassName('date');
		const table = document.getElementsByClassName('diary-table');
		
		if($todayS <= todayS) {
		
			const xhr = new XMLHttpRequest();
			
			const url = '/diary/list?param=' + arrDateS.toString();
			
			xhr.open('GET', url);
			
			xhr.send(); 
		
			xhr.onreadystatechange = function() {
		
				if(xhr.readyState !== XMLHttpRequest.DONE) return;
		
				if(xhr.status === 200) {
			
					const result = JSON.parse(xhr.response);
					
					for(let i = 0; i < 7; ++i) {
					
						if( result[i] != null ) {					
					
							let html = " ";
							
							if( result[i].temp != null) {
							
							html += "<tr><td>온도 : " + result[i].temp + "&#x2103;</td></tr>";
							
							} else {
							
							html += "<tr><td>온도 : &nbsp;- &#x2103;</td></tr>";
							
							}
							
							if( result[i].humid != null)	{
							
							html += "<tr><td>습도 : " + result[i].humid + "%</td></tr>";
							
							} else {
							
							html += "<tr><td>습도 : &nbsp;- %</td></tr>";
							
							}
							
							if( result[i].dirt != null)	{
							
							html += "<tr><td>흙 : " + result[i].dirt + "</td></tr>";
							
							} else {
							
							html += "<tr><td>흙 : &nbsp;-</td></tr>";
							
							}
						
							if( result[i].water == '1' ) {
						
								html += "<tr><td>물주기 : <span class='glyphicon glyphicon-ok'></span></td></tr>";
							
							} else {
						
								html += "<tr><td>물주기 : <span class='glyphicon glyphicon-remove'></span></td></tr>";
						
							}
						
							if( result[i].repot ==='1' ) {
						
								html += "<tr><td>분갈이 : <span class='glyphicon glyphicon-ok'></span></td></tr>";
							
							} else { 
						
								html += "<tr><td>분갈이 : <span class='glyphicon glyphicon-remove'></span></td></tr>";
						
							}
						
							html += "<tr><td></td></tr>";
							html += "<tr><td class='success'>상세보기</td></tr>"
				
							table[i].innerHTML = html;
							
							diary[i] = 1;
							
						} else {
						
							if( arrDateS[i] <= todayS ) {
						
							let html = "<tr><td class='warning'>일기 쓰기</td></tr>";
						
							table[i].innerHTML = html;
							
							diary[i] = 0;
							
							} else {
							
							table[i].innerHTML = '';
							
							}
					
						}
					
					}
					
					if($todayS == todayS) {
			
						arrDate[day] = "<p class='bg-warning' id='today'>TODAY</p>";
			
					}
		
					for(let i = 0; i < 7; ++i) {
	
						spanDate[i].innerHTML = arrDate[i];
	
					}
			
				}
		
			};
		
		} else {
		
			for(let i = 0; i < 7; ++i) {
	
					spanDate[i].innerHTML = arrDate[i];
					
					table[i].innerHTML = '';
	
			}
				
		}
		
	}
	
	const today = new Date();
	const todayS = toString(today);
	
	let arrDateS = [0, 0, 0, 0, 0, 0, 0];
	let arrDate = [0, 0, 0, 0, 0, 0, 0];
	let diary = [0, 0, 0, 0, 0, 0, 0];
	
	let x = 0 ;
	
	calender(today, x);
	
	document.getElementById('next-week').onclick = function() {
		
		x =+ 7;
		calender(today, x);
				
	};
	
	document.getElementById('prev-week').onclick = function() {
		
		x =- 7;
		calender(today, x);
				
	};
	
	const divDay = document.getElementsByClassName('day-box');
	
	for(let i = 0; i < 7; ++i) {
	
		divDay[i].onclick = function() {
			
			if(arrDateS[i] > todayS) {
		
				return false;
			
			} else {
		
				if(diary[i] == 1) {
		
					location.href = '/diary/view?date=' + arrDateS[i];
				
				} else {
			
					location.href = '/diary/write?date=' + arrDateS[i]
				
				}
			
			}
				
		};
	
	}
		
};