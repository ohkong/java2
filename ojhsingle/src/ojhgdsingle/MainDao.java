package ojhgdsingle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import ojhgdsingle.mapper.MainMapper;


public class MainDao {
	private Class<MainMapper> cls = MainMapper.class;
	private Map<String,Object> map = new HashMap<>();
	
	//member
	public int insert(Member mem) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(mem);
		}catch(Exception e) {
			e.printStackTrace();
		} finally{
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	//member
	public Member selectOne(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("id",id);
			return session.getMapper(cls).select(map).get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	//member
	public int update(Member mem) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).update(mem);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	//member
	public int updatePass(String id, String pass) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).updatePass(id,pass);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	//member
	public int delete(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(id); 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	//member
	public String idSearch(String name, String tel) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).idSearch(name,tel);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	//member
	public String pwSearch(String id, String name, String tel) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("id",id);
			map.put("name",name);
			map.put("tel",tel);
			return session.getMapper(cls).pwSearch(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	//member
	public List<Member> list() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).select(null);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	
	//board
	public int maxnum() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	//board
	public boolean boardinsert(Board board) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).boardinsert(board);
			return true; 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	//board
	public int boardCount(String column, String find, String btype) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("btype",btype);
			if(column != null) {
				String[] cols = column.split(",");
				switch(cols.length) {
				case 3 : map.put("col3", cols[2]); 
				case 2 : map.put("col2", cols[1]); 
				case 1 : map.put("col1", cols[0]); break; 
				}
				map.put("find", find);
			}
			return session.getMapper(cls).boardcount(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	//board
	public List<Board> boardList(int pageNum, int limit, String column, String find,String btype) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("btype",btype);
			map.put("start",(pageNum -1)*limit);
			map.put("limit",limit);
			if(column != null) {
				String[] cols = column.split(",");
				switch(cols.length) {
				case 3 : map.put("col3", cols[2]); 
				case 2 : map.put("col2", cols[1]); 
				case 1 : map.put("col1", cols[0]); break; 
				}
				map.put("find", find);
			}
			return session.getMapper(cls).selectboard(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	public List<Board> boardList2(int pageNum, int limit, String column, String find,int i) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("btype",i);
			map.put("start",(pageNum -1)*limit);
			map.put("limit",limit);
			if(column != null) {
				String[] cols = column.split(",");
				switch(cols.length) {
				case 3 : map.put("col3", cols[2]); 
				case 2 : map.put("col2", cols[1]); 
				case 1 : map.put("col1", cols[0]); break; 
				}
				map.put("find", find);
			}
			return session.getMapper(cls).selectboard(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	//board
	public Board selectOne2(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectboard2(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	//board
	public void readcntAdd(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).readcntAdd(num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
	}

	public boolean deleteboard(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).deleteboard(num);
			if(cnt > 0) return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public boolean bupdate(Board board) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).bupdate(board);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public List<Board> boardList2(int pageNum, int limit, String column, String find, String btype, String tradetype) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("btype",btype);
			map.put("tradetype",tradetype);
			map.put("start",(pageNum -1)*limit);
			map.put("limit",limit);
			if(column != null) {
				String[] cols = column.split(",");
				switch(cols.length) {
				case 3 : map.put("col3", cols[2]); 
				case 2 : map.put("col2", cols[1]); 
				case 1 : map.put("col1", cols[0]); break; 
				}
				map.put("find", find);
			}
			return session.getMapper(cls).selectboard(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	
	public int maxseq() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxseq();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public boolean replyinsert(Reply re) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).replyinsert(re);
			return true; 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public List<Reply> replylist(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectreply(num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public List<Board> selectOne3(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectboard3(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	
}
