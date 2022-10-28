// 獲得當前專案根目錄
var pageContext = $("#PageContext").val();


$(function() {
	$('#table_id').DataTable({
		"order": [[ 3, "desc"]]
	}); // 初始化datatable
})

// 編輯
function edit(postId) {
	window.location.href = 'updatePostForm/'+postId;
}

function state(postState) {
	window.location.href = 'liststatepost/'+postState;
}

function edit2(postId) {
	window.location.href = '../updatestorePostForm/'+postId;
}

function check(postId) {
	window.location.href = 'checkPostForm/'+postId;
}

function checkok(postId) {
	window.location.href = '../frontBlog/serchPostForm/'+postId;
}

function storecheck(postId) {
	window.location.href = '../checkstorePostForm/'+postId;
}

function storecheckok(postId) {
	window.location.href = '../../frontBlog/serchPostForm/'+postId;
}

// 刪除
function delete_data(postId) {
	swal.fire({
		title: '確定刪除此文章嗎?',
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
			window.setTimeout((() => window.location.href = 'deletePost/'+postId),800);
		} else if (
			/* Read more about handling dismissals below */
			result.dismiss === Swal.DismissReason.cancel
		) {
			swal.fire(
				'取消刪除'
			)
		}
	})
}

function delete2(postId) {
	swal.fire({
		title: '確定刪除此文章嗎?',
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
			window.setTimeout((() => window.location.href = '../deletestorePost/'+postId),800);
		} else if (
			/* Read more about handling dismissals below */
			result.dismiss === Swal.DismissReason.cancel
		) {
			swal.fire(
				'取消刪除'
			)
		}
	})
}

