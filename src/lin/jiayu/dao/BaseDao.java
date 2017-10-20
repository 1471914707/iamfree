package lin.jiayu.dao;

import java.io.Serializable;
import java.util.List;

/**
 * dao层基类，实现增删改查
 * @param <T>
 */
public interface BaseDao<T> {

    //添加一个对象
    void save(T entity);
    //更新一个对象，所有属性
    void update(T entity);
    //更新一个对象，部分属性
   // void partUpdate(int id, String[] names, Object[] values);
    //删除一个对象
    void delete(Serializable id);
    //根据id查找一个对象
    T findById(Serializable id);
    //根据HQL返回对象List
    List<T> findByHQL(String hql, Object... params);
    //分页查询
    List<T> queryPage(String hql, int pageNo, int pageSize);
    //查询数量
    public int getCountByHQL(String hql, Object... params);
    //获得指定数量的结果
    public List<T> findByHQL2(String hql,int pageNow,int pageSize, Object... params);
}