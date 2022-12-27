package Qwerty.qwerty.WorldCup.shopping.Service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import Qwerty.qwerty.WorldCup.shopping.vo.CartVO;
import Qwerty.qwerty.WorldCup.shopping.vo.ShoppingVO;

public interface ShoppingService {
	public List itemLists(Map pagingMap) throws DataAccessException;
	public int totItems() throws DataAccessException;
	public int categoryItems(int category) throws DataAccessException;
	public List detail(String i_name) throws DataAccessException;
	public int itemNo(String i_name) throws DataAccessException;
	public String itemName(int i_num) throws DataAccessException;
	public int findItemNo(String i_name, String i_option) throws Exception;
	public ShoppingVO itemInfo(int i_num) throws Exception;
	public void addCart(CartVO cartVO) throws Exception;
	public List cartList(String id) throws Exception;
	public ShoppingVO getShopVO(int i_num) throws Exception;
	public List allItemName() throws Exception;
}
