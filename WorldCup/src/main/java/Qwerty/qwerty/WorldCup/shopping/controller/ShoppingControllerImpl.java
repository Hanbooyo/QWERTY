package Qwerty.qwerty.WorldCup.shopping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Qwerty.qwerty.WorldCup.board.service.QboardService;
import Qwerty.qwerty.WorldCup.member.vo.MemberVO;
import Qwerty.qwerty.WorldCup.shopping.Service.ShoppingService;
import Qwerty.qwerty.WorldCup.shopping.vo.CartVO;
import Qwerty.qwerty.WorldCup.shopping.vo.ShoppingVO;

@Controller("shoppingController")
public class ShoppingControllerImpl implements ShoppingController {

	@Autowired
	private ShoppingService shoppingService;
	
	@Autowired
	private QboardService qboardService;

	@Override
	@RequestMapping(value = "/shop.do", method = RequestMethod.GET)
	public ModelAndView listItems(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();	
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		int section = Integer.parseInt((_section == null ? "1" : _section));
		int pageNum = Integer.parseInt((_pageNum == null ? "1" : _pageNum));
		String _category = request.getParameter("category");
		System.out.println(section + "  " + pageNum + " ���� pg ��");
		Map<String, Integer> pagingMap = new HashMap<String, Integer>();
		int totItems;
		if(_category != null) {
			int category = Integer.parseInt(_category);
			pagingMap.put("category", category);
			mav.addObject("category", category);
			totItems = shoppingService.categoryItems(category);
		}else {
			totItems = shoppingService.totItems();
		}
		pagingMap.put("section", section);
        pagingMap.put("pageNum", pageNum);
		List articleList = shoppingService.itemLists(pagingMap);
		System.out.println(totItems);
		mav.addObject("totArticles" ,totItems);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("articleList", articleList);
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/shopdetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView detail(@RequestParam("i_name") String i_name, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		System.out.println(i_name);
		List<ShoppingVO> itemDetail = shoppingService.detail(i_name);
		mav.addObject("itemDetail", itemDetail);
		int i_num = shoppingService.itemNo(i_name);
		System.out.println(i_num);
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		int section = Integer.parseInt((_section==null?"1":_section));
		int pageNum = Integer.parseInt((_pageNum==null?"1":_pageNum));
		Map<String, Integer> pagingMap = new HashMap<String, Integer>();
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
	 	pagingMap.put("i_num", i_num);
	 	List q_articleList = qboardService.listArticles(pagingMap);
	 	mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("q_articleList", q_articleList);
		return mav;
	}
	
	
		@Override
		@RequestMapping(value = "/order.do", method = RequestMethod.GET)
		public ModelAndView order(@RequestParam("i_name") String i_name,
				@RequestParam("optionList") String i_option, 
				@RequestParam("amount") String amount, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView();
			int i_num = shoppingService.findItemNo(i_name, i_option);
			System.out.println("번호 : " + i_num);
			ShoppingVO itemInfo = shoppingService.itemInfo(i_num);
			System.out.println(itemInfo);
			mav.addObject("itemInfo", itemInfo);
			mav.addObject("amount", amount);
			mav.addObject("i_option", i_option);
			mav.addObject("i_num", i_num);
			mav.setViewName(viewName);
			return mav;
		}
		
		
		@Override
		@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
		public ModelAndView cart(@RequestParam("i_name") String i_name,
				@RequestParam("optionList") String i_option, 
				@RequestParam("amount") String amount, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView();
			int i_num = shoppingService.findItemNo(i_name, i_option);
			ShoppingVO itemInfo = shoppingService.itemInfo(i_num);
			int c_count = Integer.parseInt(amount);
			HttpSession session = request.getSession();
			MemberVO memberVO = (MemberVO)session.getAttribute("member");
			String id = memberVO.getId();
			System.out.println(id);
			CartVO cartVO = new CartVO();
			cartVO.setI_num(i_num);
			cartVO.setC_count(c_count);
			cartVO.setId(id);
			shoppingService.addCart(cartVO);
			mav.setViewName("redirect:/cartlist.do");
			return mav;
		}
		
		@Override
		@RequestMapping(value = "/cartlist.do", method = RequestMethod.GET)
		public ModelAndView cartlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView();
			HttpSession session = request.getSession();
			MemberVO memberVO = (MemberVO)session.getAttribute("member");
			String id = memberVO.getId();
			List<CartVO> cartlist = shoppingService.cartList(id);
			System.out.println("받아온거 : " + cartlist.get(1).getI_num());
			List shopVOList = new ArrayList<ShoppingVO>();
			for(int i=0; i<cartlist.size(); i++) {
				shopVOList.add(shoppingService.getShopVO(cartlist.get(i).getI_num()));
			}
			System.out.println("찍을거 : " + shopVOList);
			mav.addObject("cartlist", cartlist);
			mav.addObject("shopVOList",shopVOList);
			mav.setViewName(viewName);
			return mav;
		}
		

}
