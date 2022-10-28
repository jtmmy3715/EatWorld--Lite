
$('#get_cart_all').on("click",function(){
	console.log("按鈕")
	updateCart();
	
});
	
	



/*function createXhr(){
	if(window.XMLHttpRequest){
		xhr = new XMLHttpRequest();
	}else{
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}
}


function setCartData(){
	let list="${sessionScope.detail_list}";
	console.log(value+"123")
	list.foreach(function(value){
		$("#cart_ul").append($('<li/>')
				.addClass("single-product-cart")
				.append($('<div/>')
					.append($('<h4/>'))
						.append($('<a/>')
								.attr('href','#')
								)
				
				)
			);
			
	});
}*/

			var product_id = 0;
			var combo_id = 0;
			//付款方式
			var pay_type = 0;
			//選擇活動
			var event_id = 0;
			
			//折價金額
			var discount_total =0;
			
			function clickProductList(){
				$(document).on("click", ".showDetail", function () {
					 product_id = $(this).closest("div").find("input[name='product_id']").val();
					 combo_id = $(this).closest("div").find("input[name='combo_id']").val();
					 console.log(product_id+'/'+combo_id);
					 if (typeof(product_id) == "undefined"){
						//為套餐顯示
						$.getJSON({
							type:"POST",
							url:"/EatWorld/FrontProductController/getComboModal",
							async:"true",
							data:"combo_id="+combo_id,
							success:function(value){
								console.log("JQUERY讀取單商品連線成功");
								$('#qulity').val("1");
							    $("#name_detail").text(value.combo_name);
							    $("#content_detail").text("");
							    $("#id_inventory")
							    //.css('color','red')
							    .html("");
							    $("#content_detail").empty();
							    $("#price_detail").text(value.price);
							    $("#photo_detail").attr("src","/EatWorld/photo/"+value.photo);
							    $("#view_detail").text(""); 
							    $.getJSON({
									type:"POST",
									url:"/EatWorld/FrontProductController/getComboProduct",
									async:"true",
									data:"combo_name="+value.combo_name,
									success:function(data){
										console.log("JQUERY讀取套餐商品細項連線成功");
										$("#content_detail").append("<ul>套餐內容:</ul>");
										$.each(data, function (index, value) {
											$("#content_detail").append("<li>"+value.productBean.name+"</li>");
										});
	
									},error:function(data){
										console.log("讀取套餐商品細項失敗");
									}
								});
							},error:function(data){
								console.log("讀取單商品失敗");
							}
						});
					}else{
						$.ajax({
							type:"POST",
							url:"/EatWorld/FrontProductController/updateViewCount",
							async:"true",
							data:"product_id="+product_id,
							success:function(resopnse,status,xhr){
								console.log("JQUERY連線成功");
								//判斷新增是否成功
								if(xhr.readyState==4&&xhr.status==200){
									if(xhr.responseText=="ok"){
										console.log("增加瀏覽次數成功!");
									}
								}
								
							}
						});
						$.getJSON({
							type:"POST",
							url:"/EatWorld/FrontProductController/getFrontProductModal",
							async:"true",
							data:"product_id="+product_id,
							success:function(value){
								console.log("JQUERY讀取單商品連線成功");
								$('#qulity').val("1");
							    $("#name_detail").text(value.name);
							    $("#content_detail").text(value.content);
							    $("#id_inventory")
							    .css('color','red')
							    .html("剩餘&ensp;"+value.inventory+"&ensp;個");
							    $("#price_detail").text(value.price);
							    $("#photo_detail").attr("src","/EatWorld/photo/"+value.photo);
							    $("#view_detail").text(value.count_view+"次瀏覽"); 
							},error:function(data){
								console.log("讀取單商品失敗");
							}
						});
						
						
						
					}

					//console.log('123');
				   // var myBookId = $(this).data('id');
/*				    let name = $(this).closest("div").find("input[name='name']").val();
				    let content = $(this).closest("div").find("input[name='content']").val();
				    let photo = $(this).closest("div").find("input[name='photo']").val();
				    let price = $(this).closest("div").find("input[name='price']").val();
				    let view = $(this).closest("div").find("input[name='count_view']").val();
				    product_id =  $(this).closest("div").find("input[name='product_id']").val();
				    $('#qulity').val("1");
				    $("#name_detail").text(name);
				    $("#content_detail").text(content);
				    $("#price_detail").text(price);
				    $("#photo_detail").attr("src","/EatWorld/photo/"+photo);
				    $("#view_detail").text(view+"次瀏覽");  */  
				});	
			}
		
			function clickProductCart(){
				$('#add_product_cart').on("click",function(){
					let qulity = $('#qulity').val();
					
					if(typeof product_id === "undefined"){
						//傳入套餐數量
						console.log("套餐")
						$.ajax({
							type:"POST",
							url:"/EatWorld/OrderController/insertToComboCart",
							async:"false",
							data:"combo_id="+combo_id+"&qulity="+qulity,
							success:function(resopnse,status,xhr){
								console.log("JQUERY連線成功");
								console.log(xhr.status);
								console.log(xhr.readyState);
								//判斷新增是否成功
								if(xhr.readyState==4&&xhr.status==200){
									if(xhr.responseText=="ok"){
										console.log("新增至套餐cart成功!");
										updateCart();
			
									}else{
										swal.fire({
									     title: '請先結帳同商家購物車',
									     icon: 'warning',
									     confirmButtonText: '好'
									   })
									}
								}
								
							}
						});
					}else{
						//傳入產品ID與數量
						console.log(product_id+"/"+qulity);
						$.ajax({
							type:"POST",
							url:"/EatWorld/OrderController/insertToCart",
							async:"false",
							data:"product_id="+product_id+"&qulity="+qulity,
							success:function(resopnse,status,xhr){
								console.log("JQUERY連線成功");
								console.log(xhr.status);
								console.log(xhr.readyState);
								//判斷新增是否成功
								if(xhr.readyState==4&&xhr.status==200){
									if(xhr.responseText=="ok"){
										console.log("新增至cart成功!");
										updateCart();
			
									}else{
										swal.fire({
									     title: '請先結帳同商家購物車',
									     icon: 'warning',
									     confirmButtonText: '好'
									   })
									}
								}
								
							}
						});
					}
					
				})
			}
			
			function clickProductWish(){
				$('#add_product_wish').on("click",function(){
				console.log("123333333");
				
				})
			}
			
			function calOrderTotal(){
				$(".order_price").each(function(){
					console.log($(this).val());
				});
			}
			function back(){
				swal.fire({
				     title: '即將返回購物車頁面?',
				     icon: 'warning',
				     showCancelButton: true,
				     confirmButtonText: '好',
				     cancelButtonText: '不要',
				     reverseButtons: true
				   }).then((result) => {
				     if (result.isConfirmed) {
				       
				       	history.back();
				       
				     } else if (
				       /* Read more about handling dismissals below */
				       	result.dismiss === Swal.DismissReason.cancel
				     ) {
				       swal.fire(
				         '取消返回',
				         '已取消'
				       )
				     }
				   })
				  
			}
			
		$(function(){
			updateCart();
			clickProductWish();
			clickProductCart();
			clickProductList();
			calOrderTotal();
			onclickOrderCheckBox();
			updateCartPage();
			//付款方式傾聽-結帳頁面
			onclickPayType();
			//傾聽活動選擇
			onclickEvent();
		});
		
		//活動按鈕傾聽
		function onclickEvent(){
			$('#id_select_cart_event').change(function(){
				event_id = $(this).val();
				updateCartPage();
			})
		}
		
		//付款方式傾聽
		function onclickPayType(){
			$(".input_radio").change(function(){
				console.log("radio更改"+$(this).val());
				pay_type=$(this).val();
			});
		}
		
		
		
		
		////一鍵輸入按鈕偵測
		function onclickOrderCheckBox(){
			$('input[name=in_check_order]').change(function(){
				console.log($(this).val());
				let check_val=$(this).val();
				if(check_val=="one"){
					//一鍵輸入訂單資料
					$('#tx_order_name').val('Jimmy熊');
					$('#tx_order_email').val('jtmmy3715@gmail.com');
					$('#tx_order_phone').val('0987094968');
					$('#tx_order_note').val('飲料全部去冰');
				}else{
					////Ajax讀取會員資料
					$('#tx_order_name').val('');
					$('#tx_order_email').val('');
					$('#tx_order_phone').val('');
					$('#tx_order_note').val('');
				}
				
			});
		}
		
		function updateCart(){
			
			
			//更新購物車內商品顯示
			$.getJSON({
				type:"GET",
				url:"/EatWorld/OrderController/getCartOrderDetail",
				async:"true",
				data:"i_filter=1"+"&event_id="+event_id,
				success:function(data){
					let total = updateCartProductHtml(data);
					//更新套餐顯示
					$.getJSON({
						type:"GET",
						url:"/EatWorld/OrderController/getCartOrderDetail",
						async:"true",
						data:"i_filter=2"+"&event_id="+event_id,
						success:function(combo_data){
							console.log("JQUERY讀取CART套餐連線成功");
							console.log("CART"+(data.length+combo_data.length));
							//$('#cart_ul').empty();
							$('#cart_size').text(data.length+combo_data.length);
							total +=updateCartProductComboHtml(combo_data,total);						
					        console.log("total="+total);
					        $('#cart_sum').text(total+"元")
		
						},error:function(data){
							console.log("讀取cart套餐失敗");
						}
					});
				},error:function(data){
					console.log("讀取cart失敗");
				}
			});
			
		
			
		}
		
		function updateCartProductComboHtml(combo_data){
			let total = 0;
			$.each(combo_data, function (index, value) {
						console.log("數量="+value.qulity);
			            $('#cart_ul').append(
			                $('<li/>')
			                    .addClass('single-product-cart')
			                    .append(
			                        $('<div/>')
			                            .addClass('cart-img')
			                            .append(
			                                $('<a/>')
			                                    .attr('href', '#')
			                                    .append(
			                                        $('<img/>')
			                                            .attr('src', '/EatWorld/photo/'+value.comboBean.photo)
			                                    )
			                            )
			                    )
			                    .append(
			                        $('<div/>').addClass('cart-title')
			                            .append(
			                                $('<h4/>').append(
			                                    $('<a/>')
			                                        .attr('href', '#')
			                                        .html(value.comboBean.combo_name)
			                                ))
			                            .append(
			                                $('<span/>')
			                                    .attr('id', 'cart_single_price')
			                                    .html('單價:' + value.comboBean.price)
			                            )
			                            .append(
			                                $('<span/>')
			                                    .attr('id', 'cart_single_qulity')
			                                    .html('數量:' + value.qulity)
			                                    
			                            )
			                            .append(
			                                $('<div/>')
			                                    .attr('id', 'cart_totally_price')
			                                    .html('共:' + value.qulity * value.comboBean.price + '元')
			                            )
			                    )
			                    .append('<div/>')
			                    .addClass('cart-delete')
			                    .append(
			                        $('<a/>')
			                            .attr('href', '#')
			                    )
			            )
			            total+=value.qulity * value.comboBean.price;
			        })
			    return total;
		}
		function updateCartProductHtml(data){
			let total=0;
					console.log("JQUERY讀取CART連線成功");
					//console.log("CART"+data.length);
					$('#cart_ul').empty();
					//$('#cart_size').text(data.length);
					
					$.each(data, function (index, value) {
						console.log("數量="+value.qulity);
			            $('#cart_ul').append(
			                $('<li/>')
			                    .addClass('single-product-cart')
			                    .append(
			                        $('<div/>')
			                            .addClass('cart-img')
			                            .append(
			                                $('<a/>')
			                                    .attr('href', '#')
			                                    .append(
			                                        $('<img/>')
			                                            .attr('src', '/EatWorld/photo/'+value.productBean.photo)
			                                    )
			                            )
			                    )
			                    .append(
			                        $('<div/>').addClass('cart-title')
			                            .append(
			                                $('<h4/>').append(
			                                    $('<a/>')
			                                        .attr('href', '#')
			                                        .html(value.productBean.name)
			                                ))
			                            .append(
			                                $('<span/>')
			                                    .attr('id', 'cart_single_price')
			                                    .html('單價:' + value.productBean.price)
			                            )
			                            .append(
			                                $('<span/>')
			                                    .attr('id', 'cart_single_qulity')
			                                    .html('數量:' + value.qulity)
			                                    
			                            )
			                            .append(
			                                $('<div/>')
			                                    .attr('id', 'cart_totally_price')
			                                    .html('共:' + value.qulity * value.productBean.price + '元')
			                            )
			                    )
			                    .append('<div/>')
			                    .addClass('cart-delete')
			                    .append(
			                        $('<a/>')
			                            .attr('href', '#')
			                    )
			            )
			            total+=value.qulity * value.productBean.price;
			        })
			        console.log("total="+total);
			        return total;
			        //$('#cart_sum').text(total+"元")
		}
		
		/*function addCartQulity(){
			$('.add_cart_minus').on('click',function(){
				$(this).val();
				
				
			});
			
			
		}*/
		
		function updateCartPage(){
			//更新購物車內商品顯示
			$.getJSON({
				type:"GET",
				url:"/EatWorld/OrderController/getCartOrderDetail",
				async:"true",
				data:"i_filter=1"+"&event_id="+event_id,
				success:function(data){
					var total=0;
					console.log("JQUERY讀取CARTPage連線成功");
					console.log("CARTPAGE"+data.length);
					$('#cart_show_list').empty();
					//更新單點商品顯示
					total +=updateCartPageHTML(data);
					
					$.getJSON({
						type:"GET",
						url:"/EatWorld/OrderController/getCartOrderDetail",
						async:"true",
						data:"i_filter=2"+"&event_id="+event_id,
						success:function(combo_data){
							console.log("JQUERY讀取CARTPage套餐連線成功");
							total +=updateComboCartPageHTML(combo_data);
					        console.log("total="+total);
					        $('#cart_page_total').text("$"+total+"元")
					        $('#checkout_amount').text("$"+(total-discount_total)+"元")
					        
		
						},error:function(data){
							console.log("讀取cart套餐失敗");
						}
					});
			        

				},error:function(data){
					console.log("讀取cart失敗");
				}
			});
		}
		
		function updateComboCartPageHTML(combo_data){
			let total=0;
			$.each(combo_data, function (index, value) {
						console.log("數量="+value.qulity);
			            $('#cart_show_list').append(
							$('<tr/>')
				                .append(
				                    $('<td/>')
				                        .addClass('product-thumbnail')
				                        .append(
				                            $('<img/>')
				                                .attr('src', "/EatWorld/photo/"+value.comboBean.photo)
				                                .attr('width', "150")
				                                .attr('height', "125")
				                        )
				                )
				                .append(
				                    $('<td/>').addClass('product-name')
				                        .append(
				                            $('<a/>')
				                                .attr('href', '#')
				                                .html(value.comboBean.combo_name)
				                        )
				                )
				                .append(
				                    $('<td/>').addClass('product-price-cart')
				                        .append(
				                            $('<sapn/>').addClass('amount')
				                                .html("$" + value.comboBean.price + '元')
				                        )
				                )
				                .append(
				                    $('<td/>').addClass('product-quantity')
				                        .append(
				                            $('<div/>').addClass('cart-plus-minus')
				                                .append(
													$('<span>').addClass('cart-plus-minus-box')
												                 .html(value.qulity)
												                 .append(
																	$('<a/>').addClass('cart_minus fa-solid fa-minus')
																			.css({"float":"left"})	
															                
															                .attr('onclick', 'cart_minus('+value.orderdetail_id+','+value.qulity+');')
																	)
																.append(
																	$('<a/>').addClass('cart_plus fa-solid fa-plus')
									                                    	.css({"float":"right"})
								                                        	
								                                        	.attr('onclick', 'cart_add('+value.orderdetail_id+','+value.qulity+');')
																	
																)
				                                    
				                                )
				                                
				                        )
				                )
				                .append(
				                    $('<td/>').addClass('product-subtotal')
				
				                        .html("$" + value.qulity * value.comboBean.price + '元')
				                )
				                .append(
				                    $('<td/>').addClass('product-remove')

				                        .append(
				                            $('<a/>')
				                               
				                                .append(
				                                    $('<i/>').addClass("la la-close")
				                                )
				                                .attr('onclick','cart_delete('+value.orderdetail_id+');')
				
				                        )
				                )
			            )
			            total+=value.qulity * value.comboBean.price;
			        })
			   return total;
		}
		
		function updateCartPageHTML(data){
			let total=0;
			discount_total=0;
			$.each(data, function (index, value) {
				console.log('價格'+value.discount_price);
					if(value.discount_price!=0){
						cart_price_html="<span style='text-decoration:line-through'>"+'$' + value.productBean.price + '元'+"</span>"+'<span style="color:red">$' + (value.productBean.price-value.discount_price) + '元</span>'
						discount_total+=value.discount_price*value.qulity;
						
					}else{
						cart_price_html="<span >"+'$' + value.productBean.price + '元'+"</span>"
					}
						console.log("數量="+value.qulity);
			            $('#cart_show_list').append(
							$('<tr/>')
				                .append(
				                    $('<td/>')
				                        .addClass('product-thumbnail')
				                        .append(
				                            $('<img/>')
				                                .attr('src', "/EatWorld/photo/"+value.productBean.photo)
				                                .attr('width', "150")
				                                .attr('height', "125")
				                        )
				                )
				                .append(
				                    $('<td/>').addClass('product-name')
				                        .append(
				                            $('<a/>')
				                                .attr('href', '#')
				                                .html(value.productBean.name)
				                        )
				                )
				                .append(
				                    $('<td/>').addClass('product-price-cart')
				                        .append(
				                            $('<sapn/>').addClass('amount')
				                                .html(cart_price_html)
				                        )
				                )
				                .append(
				                    $('<td/>').addClass('product-quantity')
				                        .append(
				                            $('<div/>').addClass('cart-plus-minus')
				                                .append(
													$('<span>').addClass('cart-plus-minus-box')
												                 .html(value.qulity)
												                 .append(
																	$('<a/>').addClass('cart_minus fa-solid fa-minus')
																			.css({"float":"left"})	
															                
															                .attr('onclick', 'cart_minus('+value.orderdetail_id+','+value.qulity+');')
																	)
																.append(
																	$('<a/>').addClass('cart_plus fa-solid fa-plus')
									                                    	.css({"float":"right"})
								                                        	
								                                        	.attr('onclick', 'cart_add('+value.orderdetail_id+','+value.qulity+');')
																	
																)
				                                    
				                                )
				                                
				                        )
				                )
				                .append(
				                    $('<td/>').addClass('product-subtotal')
				
				                        .html("$" + value.qulity * (value.productBean.price-value.discount_price) + '元')
				                )
				                .append(
				                    $('<td/>').addClass('product-remove')

				                        .append(
				                            $('<a/>')
				                               
				                                .append(
				                                    $('<i/>').addClass("la la-close")
				                                )
				                                .attr('onclick','cart_delete('+value.orderdetail_id+');')
				
				                        )
				                )
			            )
			            total+=value.qulity * value.productBean.price;
			            
			        })
			        //更新折價表
					$("#id_li_event").html('<span>-$'+discount_total+'元</span>')
			   return total;
		}
		
		
		//購物車商品數量減
		function cart_minus(detail_id,qulity){
			if(qulity>1){
				$.ajax({
					type:"POST",
					url:"/EatWorld/OrderController/updateCartQulity",
					async:"true",
					data:"detail_id="+detail_id+"&qulity="+(qulity-1),
					success:function(resopnse,status,xhr){
						console.log("JQUERY連線成功");
						console.log(xhr.status);
						console.log(xhr.readyState);
						//判斷新增是否成功
						if(xhr.readyState==4&&xhr.status==200){
							if(xhr.responseText=="ok"){
								console.log("修改cart數量");
								updateCartPage();
	
							}else{
								console.log("修改cart數量失敗!");
							}
						}
						
					}
				});
			}
	
		}
		//購物車數量增
		function cart_add(detail_id,qulity){
			$.ajax({
						type:"POST",
						url:"/EatWorld/OrderController/updateCartQulity",
						async:"true",
						data:"detail_id="+detail_id+"&qulity="+(qulity+1),
						success:function(resopnse,status,xhr){
							console.log("新增連線成功");
							console.log(xhr.status);
							console.log(xhr.readyState);
							//判斷新增是否成功
							if(xhr.readyState==4&&xhr.status==200){
								if(xhr.responseText=="ok"){
									console.log("修改cart數量");
									updateCartPage();
		
								}else{
									swal.fire({
									     title: '已超過可購買數量',
									     icon: 'warning',
									     confirmButtonText: '好',
									     
									   })
			
								}
							}
							
						}
					});
		}
		function cart_delete(detail_id){
			swal.fire({
				     title: '是否刪除此商品?',
				     icon: 'warning',
				     showCancelButton: true,
				     confirmButtonText: '好',
				     cancelButtonText: '不要',
				     reverseButtons: true
				   }).then((result) => {
				     if (result.isConfirmed) {
				       	$.ajax({
							type:"POST",
							url:"/EatWorld/OrderController/deleteOrderDetail",
							async:"true",
							data:"detail_id="+detail_id,
							success:function(resopnse,status,xhr){
								
								//判斷新增是否成功
								if(xhr.readyState==4&&xhr.status==200){
									if(xhr.responseText=="ok"){
										console.log("刪除cart數量");
										//更新購物車頁面
										updateCartPage();
										//更新右側購物車頁面
										updateCart();
										
									}else{
										console.log("刪除cart數量失敗!");
									}
								}
								
							}
						});
				       
				     } else if (
				       /* Read more about handling dismissals below */
				       	result.dismiss === Swal.DismissReason.cancel
				     ) {
				       swal.fire(
				         '取消刪除',
				         '已取消'
				       )
				     }
				   })

		}
		function gotoCheckPage(){
			swal.fire({
				     title: '是否前往結帳頁面?',
				     icon: 'warning',
				     showCancelButton: true,
				     confirmButtonText: '好',
				     cancelButtonText: '不要',
				     reverseButtons: true
				   }).then((result) => {
				     if (result.isConfirmed) {
					
				       	window.location ="/EatWorld/OrderController/goToCheckPage";
				       
				     } else if (
				       /* Read more about handling dismissals below */
				       	result.dismiss === Swal.DismissReason.cancel
				     ) {
				       swal.fire(
				         '取消前往',
				         '已取消'
				       )
				     }
				   })
			
		}
		//前往結帳按鈕傾聽
	 	function onclickGoToCheck(){
		swal.fire({
				     title: '是否確定結帳?',
				     icon: 'warning',
				     showCancelButton: true,
				     confirmButtonText: '好',
				     cancelButtonText: '不要',
				     reverseButtons: true
				   }).then((result) => {
				     if (result.isConfirmed) {
						//信用卡付款前往綠界
						if(pay_type==1){
							let form=$(document.createElement('form')).css({display:'none'}).attr("method","POST").attr("action","goToCheckEcPay");
							
							$("body").append(form);
							form.submit();
						}else{
							console.log('33332');
						}
						
				       
				     } else if (
				       /* Read more about handling dismissals below */
				       	result.dismiss === Swal.DismissReason.cancel
				     ) {
				       swal.fire(
				         '取消結帳',
				         '已取消'
				       )
				     }
				   })
		}
		
				
		
