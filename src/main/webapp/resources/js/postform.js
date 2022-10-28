
function add() {
	var form = document.getElementById("form").value;
	var postId = document.getElementById("postId").value;
	var title = document.getElementById("title").value;
	var titlePhoto = document.getElementById("titlePhoto").value;
	var postContent = document.getElementById("editor1").value;
	//console.log(clientId);
	//sweetalert2
	if (title == null || title == '') {
		Swal.fire({
			icon: 'error',
			title: '請輸入文章標題！！',
		})
		return;
	}
	if (titlePhoto == null || titlePhoto == '') {
		Swal.fire({
			icon: 'error',
			title: '請選擇圖片！！',
		})
		return;
	}
	if (postContent == null || postContent == '') {
		Swal.fire({
			icon: 'error',
			title: '請輸入文章內容！！',
		})
	}

//是否新增文章
	if (postId == null || postId == '') {
		Swal.fire({
			title: 'Are you sure?',
			text: "您將新增文章",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: '新增!',
			cancelButtonText: '取消',
		}).then(function(check) {
			if (check.isConfirmed) {
				//送出
				console.log("送出");
				Swal.fire(
					'新增成功!',
					'您已成功新增一筆資料'
					
				)
				window.setTimeout((() => document.querySelector(".form-valide").submit()),800);
			} else {
				//console.log("不送");
				return false;
			}
		})
	}
	
//是否修改文章
	if (postId != null && postId != '') {

		Swal.fire({
			title: 'Are you sure?',
			text: "您將修改文章",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: '修改!',
			cancelButtonText: '取消',
		}).then((result) => {
			if (result.isConfirmed) {
				//送出
				console.log("送出");
				Swal.fire(
					'修改成功!'
					
				)
				window.setTimeout((() => document.querySelector(".form-valide").submit()),800);
			}
		})
	}
	
	return false
}




//取消
function cancel() {
	window.location.href = '../listpost';
}
function cancel1() {
	window.location.href = './listpost';
}



//一鍵輸入
function oneok() {

		document.form.title.value = "永川牛肉麵";
		document.form.editor1.value = CKEDITOR.instances.editor1.insertHtml
		( '  <p>會知道永川牛肉麵</p> <p>真的很感謝</p> <p>友人熱情提供口袋名單</p> <p>那時候一聽到</p><p>營業24小時</p><p>覺得超酷</p><p>到的時候</p><p>看到永川隔壁是新民</p>'+
'<p>我們很激動</p><p>都想吃</p><p>旁邊經過的大哥</p><p>說都吃都吃</p><p>中壢人很熱情</p><p><img alt="" height="450" src="http://localhost:8080/EatWorld/photo/n3.jpg" width="400" /></p><p>川味牛肉麵</p>'+
'<p>辣度選了小辣</p><p>湯頭喝起來很濃郁</p><p>有辣油和牛油的香氣</p><p>自製的麵條吃起來很有Q勁</p><p>牛肉是半筋半肉那種</p><p>滷的很入味</p><p>又大塊又厚</p><p>很好吃</p><p>我超愛</p><p>而且還可以加湯加麵</p>'+
'<p>好佛心</p><p>地址:桃園市中壢區民權路61-1號</p><p>電話:03-4953403</p><p>營業時間:24HR</p>'
 ) ;
	
};

function oneok1() {

		document.form.msg.value = "文章內文不符合規範，請重新修正後送出，謝謝。";
		
	
};








