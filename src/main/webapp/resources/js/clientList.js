	$(function() {
		  $('#table_id').DataTable({
		   "columnDefs" : [ {
		    "orderable" : false,
		    "targets" : [ 7 ]
		   } ]
		  }); // 初始化datatable
		 })
		 	 
 // button function
 // 新增
 function addClient(){
  window.location.href = "clientForm";
 }
	
 // 編輯

 function editClient(clientId){
	 window.location.href = "updateForm/"+clientId;
	 }
 // 刪除
 function deleteClient(clientId){

   
   swal.fire({
     title: '確定刪除此會員嗎?',
     icon: 'warning',
     showCancelButton: true,
     confirmButtonText: '確認',
     cancelButtonText: '取消',
     reverseButtons: true
   }).then((result) => {
     if (result.isConfirmed) {
       swal.fire(
         'Deleted!',
         '已成功刪除',
         'success'
       )
       window.location.href = "deleteClient?clientId=" + clientId;
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
 
 function exportPDF(){
	  window.location.href = "exportPDF";
	 }
