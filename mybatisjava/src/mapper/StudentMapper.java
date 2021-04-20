package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import mybatisjava.Student;
/*
 * interface ������� Mybatis ����ϱ�
 * 	���ӽ����̽� : �������̽��� �̸�. mapper.StudentMapper
 * 	id �Ӽ��� : sql ������ �����ϱ� ���� ������ ��
 * 				�޼����� �̸��� sql ������ ������.
 * 				=> �޼��� �����ε��� �Ǹ� ����� ���� �߻�
 * 	parameterType : �Ű�����
 * 			�ΰ��̻��� ���� �Ű������� ������ ��� map�� �̿�
 * 			=> ������̼��� �̿��Ͽ� �ΰ��̻��� ���� �Ű������� ��������
 * 	returnType : ����Ÿ������ ����. 
 */
public interface StudentMapper {
//	@Select("select * from student")
//	List<Student select();
	
	@Select({"<script>",
			"select * from student",
			"<if test='grade != null'>where grade=#{grade}</if>",
			"<if test='studno != null'>where studno=#{studno}</if>",
			"<if test='name != null'>where name=#{name}</if>",
			"</script>"})
	List<Student> select(Map map);
	
	@Insert("insert into student (studno,name,jumin,id)"
			+ " values (#{studno},#{name},#{jumin},#{id})")
	int insert(Student st);
	
	@Update("update student set grade = #{grade},"
			+ " weight = #{weight}, height = #{height}"
			+ " where studno=#{studno}")
	int update(Student st);
	
	@Delete("delete from student where studno=#{value}")
	int delete(int i);
	
	@Select("select * from student" 
			+" where major1=#{major1} and grade=#{grade}")
	List<Student> select2(@Param("major1")int i, @Param("grade")int j);
			
}
