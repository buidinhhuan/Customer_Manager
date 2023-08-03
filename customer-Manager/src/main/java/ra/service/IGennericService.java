package ra.service;

import java.util.List;

public interface IGennericService<T,E> {
    List<T> fillALl();
    void  save(T t);
    T findById(E e);
    void  deleteById(E e);
}
