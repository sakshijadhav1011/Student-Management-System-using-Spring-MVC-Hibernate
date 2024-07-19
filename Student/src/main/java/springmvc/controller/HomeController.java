package springmvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sakshi.dao.StdDao;
import com.sakshi.dao.StdDaoImpl;
import com.sakshi.entity.Student;


@Controller
public class HomeController {
	private StdDao stdDao =new StdDaoImpl();
	
	@RequestMapping(path = "/home")
	public String home(Model m) {
		List<Student> list = stdDao.getAllStd();
		int i = 1;
		for(Student std : list) {
			System.out.println("LIST " + std);
			m.addAttribute("std" + i, std);
			i++;
		}
		m.addAttribute("stdList", list);
		return "home";
	}
	
	@RequestMapping(path = "/addStd")
	public String displyAddEmpPage(Model m) {
		return "add_std";
	}
	
	@RequestMapping(path = "/createStd", method = RequestMethod.POST)
	public String createEmp(@ModelAttribute Student std, Model m) {
		System.out.println(std);
		int i = stdDao.saveStd(std);
		if(i>0) {
			System.out.println("No. of rows inserted : " + i);
			m.addAttribute("success-add-msg", "Student Added Successfully");
		}
		return "redirect:/home";  //if u want to move from controller to controller
	}
	
	@RequestMapping(path = "/editStd/{id}")
	public String editEmp(@PathVariable int id, Model m) { //path variable fetch data from url & store in id
		Student std = stdDao.getStdById(id);
		System.out.println("GET BY ID : " + std);
		m.addAttribute("std", std);
		return "edit_std";
	}

	@RequestMapping(path = "/updateStd", method = RequestMethod.POST)
	public String updateStd(@ModelAttribute Student std) {
		stdDao.update(std);
		return "redirect:/home";
	}
	
	@RequestMapping("/deleteStd/{id}")
	public String deleteStd(@PathVariable int id) {
		stdDao.deleteStd(id);
		return "redirect:/home";
	}
	
	@RequestMapping("/search")
	public String openSearchStdPage() {
		return "search";
	}
	
	@RequestMapping("/search/{name}")
	public String searchStudentByPathvar(@PathVariable String name, Model m) {
		System.out.println("I AM SEARCHING FOR -------------------- : " + name);
		Student std = stdDao.getStdByName(name);
		System.out.println("SEARCHED : " + std);
		m.addAttribute("std", std);
		return "search";
	}
}
