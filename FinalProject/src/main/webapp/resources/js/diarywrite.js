window.onload = function() {
	
	const form = document.getElementById('form');
	const input = document.getElementsByClassName('form-control');
	const upload = document.getElementById('upload-file');
	const tbox = document.getElementsByClassName('tip-box');
	
	tbox[0].innerHTML = '';
	tbox[1].innerHTML = '';
	
	input[0].onblur = function() {
		
		if(input[0].value != null && input[0].value != '') {
			
			let str = /[^0-9]/;
			let minu = /^-/;
			let num = /[0-9]/;
			
			let text= "";
			text +=	"<p class='text-muted'>";
			text += "<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;입력 오류";
			text += "</p>"
			text += "<p class='text-muted'>-10 ~ 40 의 숫자를 입력하여 주세요!</p>";
			
			if(str.test(input[0].value)) {
				if(minu.test(input[0].value) && num.test(input[0].value)) {
					if(parseInt(input[0].value) >= -10 && parseInt(input[0].value) <= 40) {
						tbox[0].innerHTML = '';
					} else {
						tbox[0].innerHTML = text;
					}
				} else {
					tbox[0].innerHTML = text;
				}
			} else {
				if(parseInt(input[0].value) >= -10 && parseInt(input[0].value) <= 40) {
					tbox[0].innerHTML = '';
				} else {
					tbox[0].innerHTML = text;
				}			
			}
			
		} else {
			tbox[0].innerHTML = '';
		}
		
	};
	
	input[1].onblur = function() {
		
		if(input[1].value != null && input[1].value != '') {
			
			let str = /[^0-9]/;
			let num = /[0-9]/;
			
			let text= "";
			text +=	"<p class='text-muted'>";
			text += "<span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp;입력 오류";
			text += "</p>"
			text += "<p class='text-muted'>0 ~ 100 의 숫자를 입력하여 주세요!</p>";
			
			if(str.test(input[1].value)) {
				tbox[1].innerHTML = text;
			} else {
				if(parseInt(input[1].value) >= 0 && parseInt(input[1].value) <= 100) {
					tbox[1].innerHTML = '';
				} else {
					tbox[1].innerHTML = text;
				}			
			}
			
		} else {
			tbox[1].innerHTML = '';
		}
		
	};
	
	upload.onchange = function() {
		
		const pbox = document.getElementById('upload-photo-box');
		const nbox = document.getElementById('upload-name');
		
		pbox.innerHTML= '';
		nbox.textContent = '';

		const file = upload.files[0];
		const img = document.createElement('img');
		const url = URL.createObjectURL(file);
		
		img.src = url;
		img.style.width = '130px';
		img.style.height = '130px';
		
		pbox.appendChild(img);
		
		const name = file.name;
		
		nbox.innerHTML = name + '&nbsp;<span class="glyphicon glyphicon-remove-circle" id="remove-button"></span>';
		
		const remove = document.getElementById('remove-button');
		
		remove.onclick = function() {
			
			upload.value = '';
			pbox.innerHTML= '';
			nbox.textContent = '';
			
		};
		
	};
	
	form.onsubmit = function() {
		
		if(tbox[0].innerHTML.length == 0 && tbox[1].innerHTML.length == 0) return true;
		
		return false;
	};
	
};