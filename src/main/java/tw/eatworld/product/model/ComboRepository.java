package tw.eatworld.product.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface ComboRepository extends JpaRepository<ComboBean, Integer> {

	//給程式碼使用JPA方法刪除combo資料表用
//	@Modifying
//	@Query(value = "delete from ComboBean where store_id = ?1 and combo_name= ?2")
//	public ComboBean deleteCombo(int store_id, String comboName);
//	@Query(value = "select combo_name from ComboBean where store_id = ?1")
//	public List<String> getProductAllComboName(int store_id);
	
//	@Query(value = "from ComboBean where combo_name=?1")
//	public ComboBean findComboByName(String comboName);
	
}
