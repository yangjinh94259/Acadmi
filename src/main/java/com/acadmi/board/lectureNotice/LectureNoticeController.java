package com.acadmi.board.lectureNotice;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.board.BoardVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.util.FileVO;
import com.acadmi.util.Pagination;

@Controller
@RequestMapping("/lectureNotice/*")
public class LectureNoticeController {

	@Autowired
	private LectureNoticeService lectureNoticeService;
	
	@ModelAttribute("board")
	public String getBoardName() {
		return "lectureNotice";
	}
	
	@GetMapping("list")
	public ModelAndView getList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<LectureNoticeVO> list = new ArrayList<>();
		
		List<BoardVO> ar = lectureNoticeService.getList(pagination);
		
		List<ProfessorVO> professors = lectureNoticeService.getProfessor();
		
		mv.addObject("professors", professors);
		mv.addObject("list", ar);
		mv.setViewName("board/list");
		
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setInsert(LectureNoticeVO lectureNoticeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/add");
		
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setInsert(@RequestParam("lectureNum") Long lectureNum, LectureNoticeVO lectureNoticeVO, MultipartFile [] addfiles) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = lectureNoticeService.setInsert(lectureNoticeVO, addfiles);
		
		mv.setViewName("redirect:./list?lectureNum=" + lectureNum);
		
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(LectureNoticeVO lectureNoticeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		lectureNoticeVO = (LectureNoticeVO)lectureNoticeService.getDetail(lectureNoticeVO);
		
		int result = lectureNoticeService.setLectureNoticeHit(lectureNoticeVO);
		
		mv.addObject("boardVO", lectureNoticeVO);
		mv.setViewName("board/detail");
		                        
		return mv;
	}
	
	@GetMapping("fileDown")
	public ModelAndView getFileDown(FileVO fileVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		fileVO = lectureNoticeService.getFileDetail(fileVO);
		
		mv.addObject("fileVO", fileVO);
		mv.setViewName("fileManager");
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(LectureNoticeVO lectureNoticeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		lectureNoticeVO = (LectureNoticeVO)lectureNoticeService.getDetail(lectureNoticeVO);
		
		mv.addObject("dto", lectureNoticeVO);
		mv.setViewName("board/update");
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(ModelAndView mv, LectureNoticeVO lectureNoticeVO, MultipartFile [] addfiles) throws Exception {
		
		int result = lectureNoticeService.setUpdate(lectureNoticeVO, addfiles);
		
		lectureNoticeVO = (LectureNoticeVO)lectureNoticeService.getDetail(lectureNoticeVO);
		
		mv.setViewName("redirect:./list?lectureNum=" + lectureNoticeVO.getLectureNum());
		
		return mv;
	}
	
	@GetMapping("delete")
	public ModelAndView setDelete(BoardVO boardVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = lectureNoticeService.setDelete(boardVO);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@PostMapping("boardFileDelete")
	public ModelAndView setBoardFileDelete(FileVO fileVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = lectureNoticeService.setBoardFileDelete(fileVO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
}
