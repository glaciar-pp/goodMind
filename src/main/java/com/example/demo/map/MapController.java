package com.example.demo.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Map;
import com.example.demo.service.MapService;

@Controller
@RequestMapping("/goodM/map")
public class MapController {
	@Value("${naver.accessId}")
	private String accessId;

	@Value("${naver.secretKey}")
	private String secretKey;

	@Value("${roadAddrKey}")
	private String roadAddrKey;

	@Autowired
	private MapService mapService;	

	@GetMapping("/kakaoMap")
	public String list(@ModelAttribute Map map, Model model) throws Exception {
		List<Map> mapList = mapService.getMapList();
		model.addAttribute("mapList", mapList);

		return "map/kakaoMap";
	}
	
	@PostMapping("/kakaoMap")
	public String searchWord(@RequestParam String searchWord, Model model) {
		List<Map> searchList = mapService.getSearchList(searchWord);
		model.addAttribute("searchList", searchList);
		return "map/kakaoMap";
	}
}
