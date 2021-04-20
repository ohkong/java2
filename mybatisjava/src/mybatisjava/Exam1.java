package mybatisjava;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/*
 *  1. �л����̺��� ��ϵ� ���ڵ��� �Ǽ��� ����ϱ�
 *  2. �л����̺��� ��ϵ� ���ڵ��� ������ ����ϱ�
 *  3. �л����̺��� ��ϵ� ���ڵ��� 1�г� �л��� ������ ����ϱ�
 *  4. �л����̺��� ��ϵ� ���ڵ��� �̸��� ������ �л��� ������ ����ϱ�
 *  5. �л����̺��� ��ϵ� ���ڵ��� 2�г� �л� �� �ֹι�ȣ ���� ���л��� ������ ����ϱ�
 */
public class Exam1 {
	public static void main(String[] args) {
		SqlSessionFactory sqlMap = null;
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
		}catch(IOException e) {
			e.printStackTrace();
		}
		int x = 0;
		SqlSession session = sqlMap.openSession();
		x = (Integer)session.selectOne("student.count");
		System.out.println("  1. �л����̺��� ��ϵ� ���ڵ��� �Ǽ��� ����ϱ� : " + x);
		
		System.out.println("  2. �л����̺��� ��ϵ� ���ڵ��� ������ ����ϱ�");
		List<Student> list = session.selectList("student.list");
		for(Student s : list)System.out.println(s);
		
		System.out.println("  3. �л����̺��� ��ϵ� ���ڵ��� 1�г� �л��� ������ ����ϱ�");
		list = session.selectList("student.grade",1);
		for(Student s : list)System.out.println(s);
		
		System.out.println("  4. �л����̺��� ��ϵ� ���ڵ��� �̸��� ������ �л��� ������ ����ϱ�");
		list = session.selectList("student.2name","__");
		for(Student s : list)System.out.println(s);
		
		System.out.println("  5. �л����̺��� ��ϵ� ���ڵ��� 3�г� �л� �� �ֹι�ȣ ���� ���л��� ������ ����ϱ�");
		Map<String,Object> map = new HashMap<>();
		map.put("grade",3);
		map.put("jumin",2);
		list = session.selectList("student.selectgradegender",map);
		for(Student s : list)System.out.println(s);
	}
}
