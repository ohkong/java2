package ojhgdsingle.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ojhgdsingle.Board;
import ojhgdsingle.Member;
import ojhgdsingle.Reply;

public interface MainMapper {

	//member
	@Insert("insert into billmember"
			+ " (id,pass,name,tel,cue,region,picture,kind1,"
			+ "kind2,kind3,score1,score2,score3)"
			+ " values (#{id},#{pass},#{name},#{tel},#{cue},#{region},"
			+ "#{picture},#{kind1},#{kind2},#{kind3},#{score1},#{score2},#{score3})")
	int insert(Member mem);

	//member
	@Select({"<script>",
			"select * from billmember",
			"<if test='id != null'>where binary id = #{id}</if>",
			 "</script>"})
	List<Member> select(Map<String, Object> map);

	//member
	@Update("update billmember set name=#{name},"
			+ " cue=#{cue}, region=#{region},"
			+ " tel=#{tel}, picture=#{picture},"
			+ " kind1=#{kind1}, kind2=#{kind2},"
			+ " kind3=#{kind3}, score1=#{score1},"
			+ " score2=#{score2}, score3=#{score3} where id=#{id}")
	int update(Member mem);

	//member
	@Update("update billmember set pass=#{pass} where id=#{id}")
	int updatePass(@Param("id")String id, @Param("pass")String pass);
	
	//member
	@Delete("delete from billmember where id=#{id}")
	int delete(String id);
	
	//member
	@Select("select id from billmember where name=#{name} and tel=#{tel}")
	String idSearch(@Param("name")String name, @Param("tel")String tel);

	//member
	@Select("select pass from billmember where id=#{id}"
			+ " and name=#{name} and tel=#{tel}")
	String pwSearch(Map<String, Object> map);

	
	//board
	@Select("select ifnull(max(num),0) from billboard")
	int maxnum();
	
	//board
	@Insert("insert into billboard"
			+ " (num,id,pass,title,content,file1,"
			+ "regdate,readcnt,btype,tradetype)"
			+ " values(#{num},#{id},#{pass},#{title},#{content},"
			+ "#{file1},now(),0,#{btype},#{tradetype})")
	void boardinsert(Board board);

	//board
	@Select({"<script>",
		"select count(*) from billboard where btype=#{btype}",
		"<if test='col1 != null'> or ${col1} like '%${find}%'</if>",
		"<if test='col2 != null'> or ${col2} like '%${find}%'</if>",
		"<if test='col3 != null'> or ${col3} like '%${find}%'</if>",
		"</script>"})
	int boardcount(Map<String, Object> map);

	//board
	@Select({"<script>",
		"select * from billboard "
		+ "<if test='btype != null'>where btype = #{btype}</if>",
		"<if test='tradetype != null'> and tradetype=#{tradetype}</if>",
		"<if test='col1 != null'> or ${col1} like '%${find}%'</if>",
		"<if test='col2 != null'> or ${col2} like '%${find}%'</if>",
		"<if test='col3 != null'> or ${col3} like '%${find}%'</if>",
		"<if test='num != null'> and num = #{num}</if>",
		"<if test='start != null'> order by num desc limit #{start},#{limit}</if>",
		"</script>"})
	List<Board> selectboard(Map<String, Object> map);

	//board
	@Update("update billboard set readcnt=readcnt+1 where num = #{num}")
	void readcntAdd(int num);

	//board
	@Delete("delete from billboard where num=#{num}")
	int deleteboard(int num);
	
	//board
	@Select("select * from billboard where num=#{num}")
	Board selectboard2(int num);

	//board
	@Update("update billboard set id=#{id},title=#{title},"
			+ "content=#{content},file1=#{file1},tradetype=#{tradetype},selltype=#{selltype} where num=#{num}")
	void bupdate(Board board);

	//reply
	@Select("select ifnull(max(seq),0) from billreply")
	int maxseq();

	//reply
	@Insert("insert into billreply"
			+ " (seq,id2,rcontent,rregdate,rtype,num)"
			+ " values(#{seq},#{id2},#{rcontent},now(),#{rtype},#{num})")
	void replyinsert(Reply re);

	//reply
	@Select("select * from billreply where num=#{num}"
			+ " order by seq desc")	
	List<Reply> selectreply(int num);

	@Select("select * from billboard where id=#{id}")
	List<Board> selectboard3(String id);


}
