package baseTest;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import javax.sql.DataSource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class BaseTest extends AbstractTransactionalJUnit4SpringContextTests {

    @Autowired
    protected SqlSession sqlSession;

    @Override
    @Resource(name = "dataSource")
    public void setDataSource(DataSource dataSource) {
        super.setDataSource(dataSource);
    }


}
