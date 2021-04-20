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

/*
 * Mybatisjava를 이용한 insert, update, delete
 */
public class Main2 {
	private final static String NS="student.";
	private static SqlSessionFactory sqlMap;
	static {	//static 초기화블럭. 메인 호출되기전에 먼저 실행
		InputStream input =null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");
		}catch(IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession();
		System.out.println("Student 테이블에 레코드 추가하기");
		Student st = new Student();
		st.setStudno(1002);
		st.setName("홍길동");
		st.setGrade(1);
		st.setId("hongkd3");
		st.setJumin("1234561234567");
		st.setMajor1(101);
		int cnt = session.insert(NS + "insert", st);
		System.out.println("student 레코드 추가 "+cnt);
		Student dispst = session.selectOne(NS + "selectno",st.getStudno());
		System.out.println(dispst);
		/*
		 * 1001번 학생의 학년을 2학년으로 몸무게80, 키는 175
		 * 지도교수 1001로 수정하기
		 */
		st.setGrade(2);
		st.setWeight(80);
		st.setHeight(175);
		st.setProfno(1002);
		cnt = session.update(NS + "update",st);
		System.out.println("student 테이블의 레코드 수정 : "+ cnt);
		dispst = session.selectOne(NS + "selectno",st.getStudno());
		System.out.println(dispst);
		System.out.println("1001번 학생 삭제하기");
		cnt = session.delete(NS + "delete",st.getStudno());
		dispst = session.selectOne(NS + "selectno",st.getStudno());
		System.out.println(dispst);
		//학년이 2학년 이상인 학생의 정보 출력하기
		System.out.println("2학년 이상인 학생 정보출력");
		Map<String,Object> map = new HashMap<>();
		map.put("col","grade");
		map.put("value",2);
		List<Student> list = session.selectList(NS+"select2",map);
		for(Student s :list)System.out.println(s);
		//키가 180이상이 학생의 정보 출력하기
		System.out.println("키가 180 이상인 학생 정보출력");
		map.clear();
		map.put("col","height");
		map.put("value",180);
		list = session.selectList(NS+"select2",map);
		for(Student s :list)System.out.println(s);
		
		//session.commit();
	}
}
