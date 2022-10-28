package tw.eatworld.event.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.eatworld.event.model.Event;
import tw.eatworld.event.model.EventService;
import tw.eatworld.event.model.Product;

@Controller
@RequestMapping("/Event")
public class FrontendController {
	
	@Autowired
	private EventService dao;
	
	@GetMapping("/front")	
	public String frontend(Model m) {
		Date today = new Date();
		List<Event> todayEvents = dao.ReadToday(today);
		List<Event> nextdayEvents = dao.ReadNextday(today);
		System.out.println("今天:" + today);
		System.out.println("陣列： " + todayEvents.toString());
		for(Event item:todayEvents) {
			System.out.println("Event todayEvents:   " + item.getEvent_Name());
			for(Product p:item.getAllProducts()) {
				System.out.println("Product Name:  " + p.getName());
			}
		}
		for(Event item:nextdayEvents) {
			System.out.println("Event nextdayEvents:   " + item.getEvent_Name());
			for(Product p:item.getAllProducts()) {
				System.out.println("Product Name:  " + p.getName());
			}
		}
		m.addAttribute("todayEvents", todayEvents);
		m.addAttribute("nextdayEvents", nextdayEvents);
		
		
		return "frontJsp/frontEvent/eventList";
	}
	
	@PostMapping("/frontSearch")
	public String frontSearch(@RequestParam("searchName")String searchName, Model m) {
		Date today = new Date();
		List<Event> todayEvents = dao.ReadToday(today);
		List<Event> nextdayEvents = dao.ReadNextday(today);
		
		m.addAttribute("todayEvents", todayEvents);
		m.addAttribute("nextdayEvents", nextdayEvents);
		m.addAttribute("searchName", searchName);
		
		
		return "frontJsp/frontEvent/eventSearchList";
	}

}
