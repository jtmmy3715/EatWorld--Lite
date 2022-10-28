let data = {
    store_id: null
}
function ReadStore() {
    data.store_id = $(".searchInput").val()
    $.ajax({
        url: "gotoReadStore",
        method: "POST",
        dataType: "JSON",
        contentType: 'application/json; charset=UTF-8',
        data: JSON.stringify(data),
        success: function (array) {

            console.log(array)
            $(".showStoreProduct").empty();
            array.forEach(function (storeProductBean, index, array) {

                $(".showStoreProduct").append(createStoreProductHTML(storeProductBean));
            })
        }
    })
}
function createStoreProductHTML(storeProductBean) {
    let storeProduct = `
<tr>
<td><input type="radio" name="idSelected" value="${storeProductBean.product_id}" checked></td>
<td width="55">${storeProductBean.product_id}</td>
<td>${storeProductBean.name}</td>
<td>${storeProductBean.content}</td>
<td width="55">${storeProductBean.price}</td>										
<td width="55">${storeProductBean.store}</td>										
</tr>
`
    return storeProduct;
}
