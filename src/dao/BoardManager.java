package dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;
import beans.BoardRecord;

public class BoardManager {
	
	private Map<Long, BoardRecord> boardTable = new ConcurrentHashMap<Long, BoardRecord>();
	private Long boardId = 1L;
	
	
	public Long getBoardId () {
		return boardId;
	}
	
	//글 삽입
	public void insertBoardRecord(BoardRecord boardRecord) {
		System.out.println("#################insertBoardRecord(boardRecord)#################");
		boardRecord.setRecordId(getBoardId());
		boardRecord.setModifiedTime(new Date());
		boardTable.put(boardId, boardRecord);
		boardId++;
	}
	
	//글 찾기
	public BoardRecord findBoardRecord(Long boardId) {
		 BoardRecord br=  boardTable.get(boardId);
		 System.out.println("#################findBoardRecord(boardId)#################");
		 return br;
	}

	//글 삭제
	public BoardRecord removeBoardRecord(Long boardId) {
		return boardTable.remove(boardId);
	}

	//글 수정
	public BoardRecord updateBoardRecord(BoardRecord newBR) {
		BoardRecord br = boardTable.get(newBR.getRecordId());
		newBR.setModifiedTime(new Date());
		return boardTable.put(br.getRecordId(), newBR);
	}

	
	//글 조회수 증가
	public void updateHit(Long boardId) {
		BoardRecord br= boardTable.get(boardId);
		int hit = br.getHit();
		br.setHit(hit+1);
		boardTable.put(boardId, br);
	}
	
	//모든 글 조회
	public List<BoardRecord> findAllBoardRecord() {
		List<BoardRecord> recordList = new ArrayList<BoardRecord>();
		Iterator<Long> iter = new TreeMap<Long, BoardRecord>(boardTable).descendingKeySet().iterator();
		System.out.println("#################findallBoardRecord()#################");
		while (iter.hasNext()) {
			Long key = iter.next();
			BoardRecord br = boardTable.get(key);
			recordList.add(br);
			//System.out.println("#: " + br.getRecordId() + ", subject:" + br.getSubject() + ", content:"
				//	+ br.getContent() + ", writer:" + br.getUserId());
		}
		return recordList;
	}

}
