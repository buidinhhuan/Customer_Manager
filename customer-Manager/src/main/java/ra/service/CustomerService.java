package ra.service;

import ra.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerService implements IGennericService<Customer, Integer> {
    private List<Customer> customers;

    public CustomerService() {
        customers = new ArrayList<>();
    }

    @Override
    public List<Customer> fillALl() {
        return customers;
    }

    @Override
    public void save(Customer customer) {
        if (findById(customer.getId()) == null) {
            //thêm mới
            customers.add(customer);
        } else {
            customers.set(customers.indexOf(findById(customer.getId())), customer);
        }

    }

    @Override
    public Customer findById(Integer integer) {
        for (Customer c : customers
        ) {
            if (c.getId() == integer) {
                return c;
            }
        }
        return null;
    }
    public  int getNewId(){
        int maxId = 0;
        for (Customer c : customers) {
            if (c.getId() > maxId) {
                maxId = c.getId();
            }
        }
        return maxId +1;
    }

    @Override
    public void deleteById(Integer integer) {
        customers.remove(findById(integer));
    }
}
