package Qwerty.qwerty.WorldCup.shopping.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import Qwerty.qwerty.WorldCup.shopping.vo.CartVO;
import Qwerty.qwerty.WorldCup.shopping.vo.ShoppingVO;

@Repository("shoppingDAO")
public class ShoppingDAOImpl implements ShoppingDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List listItems(Map pagingMap) throws DataAccessException {
		List itemLists = null;
		itemLists = sqlSession.selectList("mapper.shopping.listItems", pagingMap);
		return itemLists;
	}


	@Override
	public int totItems() throws DataAccessException {
		int totItems = 0;
		totItems = sqlSession.selectOne("mapper.shopping.selectTotArticles");
		return totItems;
	}


	@Override
	public int categoryItems(int category) throws DataAccessException {
		int categoryItems = 0;
		categoryItems = sqlSession.selectOne("mapper.shopping.selectTotArticles", category);
		return categoryItems;
	}
	@Override
	public List itemDetail(String i_name) throws DataAccessException {
		List itemDetail = null;
		System.out.println("DAO  " + i_name);
		itemDetail = sqlSession.selectList("mapper.shopping.itemDetail", i_name);
		return itemDetail;
	}
	
	@Override
	public int selectItemNo(String i_name) throws DataAccessException {
		int i_num = sqlSession.selectOne("mapper.shopping.selectItemNo", i_name);
		return i_num;
	}
	
	@Override
	public String selectItemName(int i_num) throws DataAccessException {
		String i_name = sqlSession.selectOne("mapper.shopping.selectItemName", i_num);
		return i_name;
	}
	

	@Override
	public int findItemNo(String i_name, String i_option) throws DataAccessException {
		Map<String, String> NameOption = new HashMap<String, String>();
		NameOption.put("i_name", i_name);
		NameOption.put("i_option", i_option);
		int result = sqlSession.selectOne("mapper.shopping.findItemNo", NameOption);
		return result;
	}
	
	@Override
	public ShoppingVO itemInfo(int i_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.shopping.itemInfo",i_num);
	}
	
	@Override
	public void addCart(CartVO cartVO) throws DataAccessException {
		int c_num = createNewNum();
		cartVO.setC_num(c_num);
		sqlSession.insert("mapper.shopping.addCart", cartVO);
	}
	
	private int createNewNum() throws DataAccessException {
		int newNum = sqlSession.selectOne("mapper.shopping.newNum");
		return newNum;
	}
	
	@Override
	public List cartList(String id) throws DataAccessException {
		List cartList = null;
		cartList = sqlSession.selectList("mapper.shopping.selecCartList",id);
		return cartList;
	}


	@Override
	public ShoppingVO getItemInfo(int i_num) throws DataAccessException {
		ShoppingVO itemInfo = sqlSession.selectOne("mapper.shopping.getItemInfo",i_num);
		return itemInfo;
	}
	
    @Override
    public List selectAllItemName() throws DataAccessException {
      return sqlSession.selectList("mapper.shopping.allItemName");
    }
}
