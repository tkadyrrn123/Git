package com.kh.www.comment.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.www.comment.model.exception.CommentException;
import com.kh.www.comment.model.service.CommentService;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.Comment2;

@Controller
public class CommentController {
	
	
	@Autowired
	CommentService cService;
	// 댓글 추가	
			@RequestMapping("insertComment.co")
			@ResponseBody
			public ArrayList<Comment> insertComments(@RequestParam("userId") String userId, 
													 @RequestParam(value="boardNo", required=false) Integer boardNo, 
													 @RequestParam("content") String content, 
													 @RequestParam(value="voteId", required=false) Integer voteId,
													 HttpServletResponse response) {
				int no = 0;
				Comment c = new Comment();
				c.setrContent(content);
				c.setrUserId(userId);
				if(boardNo != null) {
					no = boardNo;
					c.setBoardNo(no);
				}else if(voteId != null) {
					no = voteId;
					c.setVoteId(no);
				}

				int result = cService.insertComment(c);
				
				if(result > 0) {
					if(boardNo != null) {
					ArrayList<Comment> comment = cService.selectComment(boardNo);
					return comment;
					}else {
						return null;
					}
				}else {
					throw new CommentException("댓글 등록에 실패했습니다.");
				}
				
			}
		
        //	댓글 수정
		@RequestMapping("updateComment.co")
		@ResponseBody
		public ArrayList<Comment> updateComments(@RequestParam("boardNo") int boardNo, @RequestParam("content") String content, @RequestParam("rNo") int rNo, HttpServletResponse response) {
			Comment c = new Comment();
			c.setrNo(rNo);
			c.setBoardNo(boardNo);
			c.setrContent(content);
			
			int result = cService.updateComment(c);
			
			if(result > 0) {
				ArrayList<Comment> comment = cService.selectComment(boardNo);
				return comment;
				
			}else {
				throw new CommentException("댓글 수정에 실패했습니다.");
			}
			
		}
		
		// 투표 전용 댓글 수정
		@RequestMapping("updateVoteComment.co")
		@ResponseBody
		public String updateVopeComment(@RequestParam("voteId") int vId, @RequestParam("content") String content, @RequestParam("rNo") int rNo) {
			Comment c = new Comment();
			c.setrNo(rNo);
			c.setVoteId(vId);
			c.setrContent(content);
			int result = cService.updateVoteComment(c);
			
			if(result > 0) {
				return "success";
			}else {
				throw new CommentException("댓글 수정에 실패했습니다.");
			}
		}
		
		// 댓글 삭제	
		@RequestMapping("deleteComment.co")
		public String deleteComment(@RequestParam("clubName") String clubName, @RequestParam("userId") String userId, @RequestParam("boardNo") Integer boardNo, Model mv, @RequestParam("rNo") int rNo) {
			
			
			int result = cService.deleteComment(rNo);
			if(result > 0 ) {
				mv.addAttribute("clubName", clubName);
				mv.addAttribute("boardNo", boardNo);
				mv.addAttribute("userId", userId);
				return "redirect:clubDetail.co";
			
			}else {
				throw new CommentException("댓글 삭제에 실패했습니다.");
			}
		}
		@RequestMapping("deleteComment2.co")
		@ResponseBody
		public int deleteComment2(@RequestParam("rNo") int rNo) {
			
			int result = cService.deleteComment(rNo);
			return result;
		}
		
		// 투표 전용 댓글 삭제
		@RequestMapping("deleteVoteComment.co")
		@ResponseBody
		public String deleteVoteComment(@RequestParam("voteId") int voteId, @RequestParam("rNo") int rNo) {
			int result = cService.deleteComment(rNo);
			if(result > 0) {
				return "success";
			}else {
				throw new CommentException("댓글 삭제에 실패했습니다.");
			}
		}
		
		// 대댓글 추가	
		@RequestMapping("insertComment2.co")
		@ResponseBody
		public ArrayList<Comment2> insertComments2(@RequestParam("userId") String userId, @RequestParam("rNo") int rNo, @RequestParam("content") String content, HttpServletResponse response) {
			Comment2 c = new Comment2();
			c.setrNo(rNo);
			c.setrContent(content);
			c.setrUserId(userId);

			int result = cService.insertComment2(c);
			
			if(result > 0) {
				ArrayList<Comment2> comment2 = cService.selectComment2(rNo);
				return comment2;
				
			}else {
				throw new CommentException("댓글 등록에 실패했습니다.");
			}
			
		}
		
		//투표 전용 대댓글 추가
		@RequestMapping("insertVoteReComment.co")
		@ResponseBody
		public String insertVoteReComment(@RequestParam("userId") String userId, @RequestParam("rNo") int rNo, @RequestParam("content") String content, HttpServletResponse response) {
			Comment2 c = new Comment2();
			c.setrNo(rNo);
			c.setrContent(content);
			c.setrUserId(userId);

			int result = cService.insertComment2(c);
			
			if(result > 0) {
				return "success";
			}else {
				throw new CommentException("댓글 등록에 실패했습니다.");
			}
			
		}
		// 대댓글 삭제	
		@RequestMapping("deleteComment3.co")
		@ResponseBody
		public int deleteComment3(@RequestParam("rrNo") int rrNo) {
			
			int result = cService.deleteComment3(rrNo);
			return result;
		}
		
		//	대댓글 수정
		@RequestMapping("updateComment3.co")
		@ResponseBody
		public int updateComment2(@RequestParam("content") String content, @RequestParam("rrNo") int rrNo, HttpServletResponse response) {
			Comment2 c = new Comment2();
			c.setRrNo(rrNo);
			c.setrContent(content);
			
			int result = cService.updateComment2(c);
			
			if(result > 0) {

				return result;
				
			}else {
				throw new CommentException("댓글 수정에 실패했습니다.");
			}
			
		}	
		
		// 댓글 좋아요
		@RequestMapping("CommentLike.co")
		@ResponseBody
		public String CommentLike(@RequestParam("rNo") int rNo, @RequestParam("userId") String userId) {
			Comment c = new Comment();
			c.setrNo(rNo);
			c.setrUserId(userId);
			int result = cService.CommentLike(c);
			if(result > 0) {
				return "success";
			}else {
				throw new CommentException("댓글 좋아요 에 실패하였습니다.");
			}
		}
		// 댓글 좋아요 취소
		@RequestMapping("CommentNotLike.co")
		@ResponseBody
		public String CommentNotLike(@RequestParam("rNo") int rNo, @RequestParam("userId") String userId) {
			Comment c = new Comment();
			c.setrNo(rNo);
			c.setrUserId(userId);
			int result = cService.CommentNotLike(c);
			if(result > 0) {
				return "success";
			}else {
				throw new CommentException("좋아요 안하기 에 실패하였습니다.");
			}
		}
}
