package bean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class RentcarDAO {
    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;

    //데이터베이스에 커넥션 Pool을 사용 메서드
    public void getCon() {
        try {
            // JNDI를 사용하여 외부 리소스에 접근하기 위한 초기 컨텍스트를 생성
            Context initContext = new InitialContext();

            // java:/comp/env는 JNDI 네이밍의 표준 루트 컨텍스트
            // 이를 통해 톰캣 서버의 환경 설정에 접근
            Context envContext = (Context) initContext.lookup("java:/comp/env");

            // JNDI 이름으로 DataSource 객체를 찾음
            //데이터소스 객체 선언. context.xml 파일의 Resource name 값을 찾아옴.
            DataSource ds = (DataSource) envContext.lookup("jdbc/pool");

            // DataSource로부터 데이터베이스 연결(Connection) 객체를 얻음
            // 이 방식은 커넥션 풀을 사용하여 효율적으로 DB 연결을 관리
            con = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //예약하기 (CarReserveMain.jsp) 에서 호출,, 3개의 차량만 Return 한다.
     public Vector<RentcarBean> getSelectCar() {
        Vector<RentcarBean> vec = new Vector<>();
        try {
            getCon();
            String sql = "select * from rentcar ORDER BY NO DESC";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            int count = 1;
            while (rs.next()) {
                RentcarBean bean = new RentcarBean();
                bean.setNo(rs.getInt(1));
                bean.setName(rs.getString(2));
                bean.setCategory(rs.getInt(3));
                bean.setPrice(rs.getInt(4));
                bean.setUsepeople(rs.getInt(5));
                bean.setCompany(rs.getString(6));
                bean.setImg(rs.getString(7));
                bean.setInfo(rs.getString(8));
                //벡터에 빈 클래스를 저장
                vec.add(bean);
                count ++;
                if (count >= 4){
                    break;
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
         return vec;
     }

    //carCategory에서 호출...소형/중형/대형에 따른 차량 bean객체를 리턴한다.
    public Vector<RentcarBean>  getCategoryCar(String category) {
    Vector<RentcarBean> vec = new Vector<>();
    try {
        getCon();
        String sql = "select * from rentcar where category=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, category);
        rs = pstmt.executeQuery();
        while(rs.next()){
            RentcarBean bean = new RentcarBean();
            bean.setNo(rs.getInt(1));
            bean.setName(rs.getString(2));
            bean.setCategory(rs.getInt(3));
            bean.setPrice(rs.getInt(4));
            bean.setUsepeople(rs.getInt(5));
            bean.setCompany(rs.getString(6));
            bean.setImg(rs.getString(7));
            bean.setInfo(rs.getString(8));
            vec.add(bean);
        }

    }catch (Exception e) {
        e.printStackTrace();
    }
        return vec;
    }
}
