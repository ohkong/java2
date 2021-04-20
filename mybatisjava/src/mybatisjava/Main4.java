package mybatisjava;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.StudentMapper;

/*
 * Mybatis�� �������̽� ������� ����ϱ�
 */
public class Main4 {
	private final static String NS = "mapper.StudentMapper.";
	private static SqlSessionFactory sqlMap;
	static {
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");
		}catch(IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession();
		System.out.println("��� �л� ���� ��ȸ�ϱ�");
		List<Student> list = session.getMapper(StudentMapper.class).select(null);
		for(Student s : list) System.out.println(s);
		
		System.out.println("1�г� �л� ���� ��ȸ�ϱ�");
		Map<String,Object> map = new HashMap<>();
		map.put("grade",1);
		list = session.getMapper(StudentMapper.class).select(map);
		for(Student s : list) System.out.println(s);

		System.out.println("981213�й� �л� ���� ��ȸ�ϱ�");
		map = new HashMap<>();
		map.put("studno",981213);
		list = session.getMapper(StudentMapper.class).select(map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("��� �л� �߰��ϱ�");
		Student st = new Student();
		st.setStudno(1002);
		st.setName("���");
		st.setJumin("1235462345678");
		st.setId("kimsk");
		int result = session.getMapper(StudentMapper.class).insert(st);
		System.out.println(result + "�� �߰�");
		System.out.println("��� �л� ��ȸ�ϱ�");
		map.clear();
		map.put("name","���");
		list = session.getMapper(StudentMapper.class).select(map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("��� �л��� �г�:1, ������:80, Ű:175 �����ϱ�");
		st.setGrade(1);
		st.setWeight(80);
		st.setHeight(175);
		result = session.getMapper(StudentMapper.class).update(st);
		System.out.println(result + "�� ����");
		System.out.println("��� �л� ��ȸ�ϱ�");
		map.clear();
		map.put("name","���");
		list = session.getMapper(StudentMapper.class).select(map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("1002�� �л� �����ϱ�");
		result = session.getMapper(StudentMapper.class).delete(1002);
		System.out.println(result + "�� ����");
		list = session.getMapper(StudentMapper.class).select(map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("101�� �а� �л��� 1�г� �л� ��ȸ�ϱ�");
		list = session.getMapper(StudentMapper.class).select2(101,1);
		for(Student s : list) System.out.println(s);
	}
}
