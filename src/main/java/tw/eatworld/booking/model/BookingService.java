package tw.eatworld.booking.model;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class BookingService {

	@Autowired
	private BookingRepository BookingRep;
	@Autowired
	private StoreRepository StoreRep;
	@Autowired
	private ClientRepository ClientRep;
	
	//List Booking
	public List<BookingBean> BookingListAll(){
		return BookingRep.findAll();
	}
	//List Store
	public List<StoreMemberBean> StoreListAll(){
		return StoreRep.findAll();
	}
	//List Client
	public List<ClientMemberBean> ClientListAll(){
		return ClientRep.findAll();
	}
	//List BookingBySid
	public List<BookingBean> FindStorelistBySId(int sid){
		return BookingRep.FindStorelistBySId(sid);
	}
	//List BookingByCid
	public List<BookingBean> FindClientlistByCId(int cid) {
		return BookingRep.FindClientlistByCId(cid);
	}
	
	
	
	//Save
	public void save (BookingBean booking) {
		BookingRep.save(booking);
	}
	//FindByBId
	public BookingBean FindById (int bid) {
		return BookingRep.findById(bid).get();
	}
	//FindBySId
	public StoreMemberBean FindBySId (int sid) {
		return StoreRep.findById(sid).get();
	}
	//FindByCId
	public ClientMemberBean FindByCId (int cid) {
		return ClientRep.findById(cid).get();
	}
	//DeleteByBId
	public void deleteById (int bid) {
		BookingRep.deleteById(bid);
	}

	
	//booking storeBySid 該店家,日期,時段 總訂位數-訂位數
	public int FindStoreBySID(int sid, String date, String period) {
		int store_people = StoreRep.findById(sid).get().getStore_people();
		int store_bookingPeople = BookingRep.FindStoreBySID(sid, date, period);
		//總訂位人數>訂位數
		if(store_people > store_bookingPeople) { 
			return store_people - BookingRep.FindStoreBySID(sid, date, period);
			//總訂位<=訂位數
		}else{
			return 0;
		}
	}
	
}
