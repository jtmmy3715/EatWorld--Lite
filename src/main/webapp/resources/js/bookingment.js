// 獲得當前專案根目錄
var pageContext = $("#PageContext").val();





// button function
// 新增
function new_data() {
	window.location.href = "form";
}
// 查詢
function query() {
	window.location.href = "list";
}
// 編輯
function edit(updateLink) {
	window.location.href = './update/'+updateLink;
}
// 刪除
function delete_data(deleteLink) {
	swal.fire({
		title: '確定刪除此訂位嗎?',
		icon: 'warning',
		showCancelButton: true,
		confirmButtonText: '好',
		cancelButtonText: '不要',
		reverseButtons: true
	}).then((result) => {
		if (result.isConfirmed) {
			swal.fire(
				'Deleted!',
				'已成功刪除',
				'success'
			)
			window.setTimeout((() => window.location.href = './delete/'+deleteLink),800);
		} else if (
			/* Read more about handling dismissals below */
			result.dismiss === Swal.DismissReason.cancel
		) {
			swal.fire(
				'取消刪除',
				'error'
			)
		}
	})
}


// 顯示圖片
function search_photo(booking_photo) {
	console.log(booking_photo);
	swal.fire({
		imageUrl:booking_photo,
		imageWidth:300
	}
		
	)

}
