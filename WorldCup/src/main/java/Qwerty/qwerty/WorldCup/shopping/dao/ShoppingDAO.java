package Qwerty.qwerty.WorldCup.shopping.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import Qwerty.qwerty.WorldCup.shopping.vo.CartVO;
import Qwerty.qwerty.WorldCup.shopping.vo.ShoppingVO;

public interface ShoppingDAO {

	public List listItems(Map pagingMap) throws DataAccessException;
	public int totItems() throws DataAccessException;
	public int categoryItems(int category) throws DataAccessException;
	public List itemDetail(String i_name) throws DataAccessException;
	public int selectItemNo(String i_name) throws DataAccessException;
	public String selectItemName(int i_num) throws DataAccessException;
	public int findItemNo(String i_name, String i_option) throws DataAccessException;
	public ShoppingVO itemInfo(int i_num) throws DataAccessException;
	public void addCart(CartVO cartVO) throws DataAccessException;
	public List cartList(String id) throws DataAccessException;
	public ShoppingVO getItemInfo(int i_num) throws DataAccessException;
    public List selectAllItemName() throws DataAccessException;
}
