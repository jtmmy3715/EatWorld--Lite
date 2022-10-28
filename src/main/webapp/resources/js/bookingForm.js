$(document).ready(function(){
	var store_id = document.getElementById("store_id").value;
	console.log('廠商編號: ' + store_id);
	console.log('test');
})
$(".form-valide").submit(function() {
	var form = document.getElementById("form").value;
	//var booking_table = document.getElementById("booking_table").value;
	var booking_people = document.getElementById("booking_people").value;
	var booking_date = document.getElementById("booking_date").value;
	var booking_period = document.getElementById("booking_period").value;
	var booking_cteateTime = document.getElementById("booking_cteateTime").value;
	var booking_status = document.getElementById("booking_status").value;
	var booking_photo = document.getElementById("photoUpload").value;
	var store_id = document.getElementById("store_id").value;
	var client_id = document.getElementById("client_id").value;

//sweetalert2
	/*if (booking_table == null || booking_table == '') {
		Swal.fire({
			icon: 'error',
			title: '請輸入桌號！！',
		})
		return;
	}*/
	if (booking_people == null || booking_people == '') {
		Swal.fire({
			icon: 'error',
			title: '請輸入人數！！',
		})
		return;
	}
	if (booking_date == null || booking_date == '') {
		Swal.fire({
			icon: 'error',
			title: '請輸入日期！！',
		})
		return;
	}
	if (booking_period == null || booking_period == '') {
		Swal.fire({
			icon: 'error',
			title: '請輸入時段！！',
		})
		return;
	}
	if (booking_cteateTime == null || booking_cteateTime == '') {
		Swal.fire({
			icon: 'error',
			title: '請輸入用餐時間！！',
		})
		return;
	}
	if (booking_status == null || booking_status == '') {
		Swal.fire({
			icon: 'error',
			title: '請輸入訂位狀態！！',
		})
		return;
	}
	if (booking_cteateTime == null || booking_cteateTime == '') {
		Swal.fire({
			icon: 'error',
			title: '請輸入時間！！',
		})
		return;
	}

	if (booking_photo == null || booking_photo == '') {
		Swal.fire({
			icon: 'error',
			title: '請選擇照片！！',
		})
		return false;
	}


	if (store_id == null || store_id == '') {
		Swal.fire({
			icon: 'error',
			title: '請輸入店家！！',
		})
		return;
	}

	//if (store_id.search(/^[0-9]$/) == -1 || client_id.search(/^[0-9]$/) == -1) {

	//	Swal.fire({
	//		icon: 'error',
	//		title: '請輸入數字！！',
	//	})

	//	return;
	//}


	if (client_id == null || client_id == '') {
		Swal.fire({
			icon: 'error',
			title: '請輸入會員！！',
		})
		return;
	}


//是否新增訂位
	if (booking_id == null || booking_id == '') {
		Swal.fire({
			title: 'Are you sure?',
			text: "您將新增訂位表單",
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
					'您已成功新增一筆資料',
					'success'
				)
				window.setTimeout((() => document.querySelector(".form-valide").submit()),800);
			} else {
				//console.log("不送");
				return false;
			}
		})
	}
//是否修改訂位
	if (booking_id != null && booking_id != '') {

		Swal.fire({
			title: 'Are you sure?',
			text: "您將修改訂位表單",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: '修改!',
			cancelButtonText: '取消',
		}).then((result) => {
			if (result.isConfirmed) {
				//送出
				console.log("送出");
				Swal.fire(
					'修改成功!',
					'您已成功新增一筆資料',
					'success'
				)
				window.setTimeout((() => document.querySelector(".form-valide").submit()),800);
			}
		})
	}
	
	return false
})




//jquery.validate
function add() {
	//Fetch form to apply custom Bootstrap validation
	let form = $(".needs-validation")

	

	form.addClass('was-validated');

	//Make ajax call here

	function isNumberKey(evt) {
		var charCode = (evt.which) ? evt.which : event.keyCode
		if (charCode > 31 && (charCode < 48 || charCode > 57))
			return false;
		return true;
	}

	//to confirm input takes only number input
	//use class ".shouldNumber" in your html <input type="text" /> element
	$('.shouldNumber').on('keypress', function() {
		return isNumberKey(event)
	});

} (jQuery);
jQuery(".form-valide").validate({
	rules: {
		"booking_table": {
			required: !0
		},
		"booking_people": {
			required: !0
		},
		"booking_date": {
			required: !0
		},
		"booking_period": {
			required: !0
		},
		"booking_cteateTime": {
			required: !0
		},
		"booking_status": {
			required: !0
		},
		"booking_photo": {
			required: !0
		},
		//"store_id": {
		//	required: !0,
		//	digits: !0
		//},
		"client_id": {
			required: !0,
			digits: !0
		}
	},
	messages: {
		/*"booking_table": {
			required: "請選擇桌號",
		},*/
		"booking_people": {
			required: "請選擇人數",
		},
		"booking_date": {
			required: "請選擇日期",
		},
		"booking_period": {
			required: "請選擇時段",
		},
		"booking_cteateTime": {
			required: "請選擇用餐時間",
		},
		"booking_status": {
			required: "請選擇訂單狀態",
		},
		"booking_photo": {
			required: "請選擇照片",
		},
		"store_id": {
			required: "請輸入商家編號",
			digits: "只能輸入數字"
		},
		"client_id": {
			required: "請輸入會員編號",
			digits: "只能輸入數字"
		}
	},

	ignore: [],
	errorClass: "invalid-feedback animated fadeInUp",
	errorElement: "div",
	errorPlacement: function(e, a) {
		jQuery(a).parents(".form-group > div").append(e)
	},
	highlight: function(e) {
		jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-invalid")
	},
	success: function(e) {
		jQuery(e).closest(".form-group").removeClass("is-invalid"), jQuery(e).remove()
	},
});


//取消
function cancel() {
	history.back()
}

//一鍵輸入
function oneok() {
	var count = Math.floor(Math.random() * 3 + 1);


	if (count == 1) {
		//document.form.booking_table.value = "1";
		document.form.booking_people.value = "3";
		document.form.booking_date.value = "2022-10-29";
		document.form.booking_period.value = "上午";
		document.form.booking_cteateTime.value = "10:30:00";
		document.form.booking_status.value = "訂位成功";

		document.form.store_id.value = "1";
		document.form.client_id.value = "4";
	}
	if (count == 2) {
		//document.form.booking_table.value = "3";
		document.form.booking_people.value = "1";
		document.form.booking_date.value = "2025-11-22";
		document.form.booking_period.value = "中午";
		document.form.booking_cteateTime.value = "12:00:00";
		document.form.booking_status.value = "訂位審核";

		document.form.store_id.value = "2";
		document.form.client_id.value = "8";
	}


	if (count == 3) {
		//document.form.booking_table.value = "5";
		document.form.booking_people.value = "4";
		document.form.booking_date.value = "2027-12-22";
		document.form.booking_period.value = "下午";
		document.form.booking_cteateTime.value = "15:30:00";
		document.form.booking_status.value = "訂位取消";

		document.form.store_id.value = "3";
		document.form.client_id.value = "9";
	}
	
	
	
	
			var store_id = document.form.store_id.value;
			var client_id = document.form.client_id.value;
			$.ajax({
				url: '../booking/order/booking/'+store_id,
				dataType: 'json',
				contentType: 'application/json',
				success: function(data){
					console.log(data.store_name);
					$("#store_name").val(data.store_name);
				},
				error: function(e){
					console.log(e);
					console.log('error');
				}
					
			});
			
			$.ajax({
				url: '../booking/order/clientName/'+client_id,
				dataType: 'json',
				contentType: 'application/json',
				success: function(data){
					console.log(data.client_name);
					$("#client_name").val(data.client_name);
				},
				error: function(e){
					console.log(e);
					console.log('error');
				}
					
			});
		
};







