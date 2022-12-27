package Qwerty.qwerty.WorldCup.shopping.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import Qwerty.qwerty.WorldCup.shopping.dao.ShoppingDAO;
import Qwerty.qwerty.WorldCup.shopping.vo.CartVO;
import Qwerty.qwerty.WorldCup.shopping.vo.ShoppingVO;

@Service("shoppingService")
public class ShoppingServiceImpl implements ShoppingService {
	@Autowired
	private ShoppingDAO shoppingDAO;
	@Autowired
	private ShoppingVO shoppingVO;
	@Autowired
	private CartVO cartVO;

	@Override
	public List itemLists(Map pagingMap) throws DataAccessException{
		List itemLists = null;
		itemLists = shoppingDAO.listItems(pagingMap);	
		return itemLists;
	}

	@Override
	public int totItems() throws DataAccessException {
		int totItems = 0;
		totItems = shoppingDAO.totItems();
		return totItems;
	}

	@Override
	public int categoryItems(int category) throws DataAccessException {
		int categoryItems =0;
		categoryItems = shoppingDAO.categoryItems(category);
		return categoryItems;
	}

	@Override
	public List detail(String i_name) throws DataAccessException {
		List itemDetail = shoppingDAO.itemDetail(i_name);
		return itemDetail;
	}
	
	@Override
	public int itemNo(String i_name) throws DataAccessException {
		int itemNo = shoppingDAO.selectItemNo(i_name);
		return itemNo;
	}
	
	@Override
	public String itemName(int i_num) throws DataAccessException {
		String i_name = shoppingDAO.selectItemName(i_num);
		return i_name;
	}

	@Override
	public int findItemNo(String i_name, String i_option) throws Exception {
		return shoppingDAO.findItemNo(i_name, i_option);
	}
	
	@Override
	public ShoppingVO itemInfo(int i_num) throws Exception {
		return shoppingDAO.itemInfo(i_num);
	}

	@Override
	public void addCart(CartVO cartVO) throws Exception {
		shoppingDAO.addCart(cartVO);
	}

	@Override
	public List cartList(String id) throws Exception {
		List cartList = shoppingDAO.cartList(id);
		return cartList;
	}

	@Override
	public ShoppingVO getShopVO(int i_num) throws Exception{
		return shoppingDAO.getItemInfo(i_num);
	}
	@Override
	public List allItemName() throws Exception {
		List allItemList = shoppingDAO.selectAllItemName();
		return allItemList;
	}
	
}
