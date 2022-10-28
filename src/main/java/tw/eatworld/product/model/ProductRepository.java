package tw.eatworld.product.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface ProductRepository extends JpaRepository<ProductBean, Integer> {
	@Query(value = "from ProductBean WHERE store_id = ?1")
	public Optional<List<ProductBean>> findAllProductByStore(Integer store_id);
	
	@Query(value = "from ProductBean WHERE store_id = ?1 and sold =1")
	public Optional<List<ProductBean>> findFrontAllProductByStore(Integer store_id);
	
	//加這備註才能修改資料庫內容
	@Modifying
	@Query(value = "update ProductBean set photo=?2 where product_id = ?1")
	public void editProductPhoto(Integer product_id, String file_name);
	
	//修改資料庫內容
	@Modifying
	@Query(value = "update ProductBean set sold=?2 where product_id = ?1")
	public Integer updateSoldStatus(Integer product_id, Integer sold);
	
	public List<ProductBean> findBySoldAndStoreid(int sold,int store_id);
	
	@Query(value = "select * from product where store_id = ?1 and sold =1 order by price desc",nativeQuery = true)
	public List<ProductBean> findDescPriceProductByStore(int store_id);
	
	@Query(value = "select * from product where store_id = ?1 and sold =1 order by price asc",nativeQuery = true)
	public List<ProductBean> findAscPriceProductByStore(int store_id);
	
	@Query(value = "select * from product where store_id = ?1 and sold =1 order by count_sale desc",nativeQuery = true)
	public List<ProductBean> findDescSaleProductByStore(int store_id);
	
	
	
}
