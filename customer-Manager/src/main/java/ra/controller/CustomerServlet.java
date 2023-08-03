package ra.controller;

import ra.model.Customer;
import ra.service.CustomerService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    protected CustomerService customerService;

    @Override
    public void init() throws ServletException {
        customerService = new CustomerService();
        customerService.save(new Customer(1, "Bui Dinh Huan", "huan@gamil.com", "ninh binh"));
        customerService.save(new Customer(2, "Đào Duy Nam", "nam@gamil.com", "Hải Dương"));
        customerService.save(new Customer(3, "KHánh Sky", "khanh@gamil.com", "Thanh Hoá"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "GETALL":
                    showListCustomers(customerService.fillALl(), request, response);
                    break;
                case "DELETE":
                    int idDel = Integer.parseInt(request.getParameter("id"));
                    customerService.deleteById(idDel);
                    break;
                case "EDIT":
                    int idEdit = Integer.parseInt(request.getParameter("id"));
                    Customer customer = customerService.findById(idEdit);
                    request.setAttribute("customer", customer);
                    request.getRequestDispatcher("/WEB-INF/editCustomer.jsp").forward(request, response);
                    // Kết thúc ngay để không chuyển hướng đến trang mặc định
                    break;
                case "CREATE":
                    request.getRequestDispatcher("/WEB-INF/newCustomer.jsp").forward(request, response);
                    break;
                case "SEARCH":
                    String searchText = request.getParameter("searchText");
                    List<Customer> searchResults = new ArrayList<>();
                    for (Customer c : customerService.fillALl()
                    ) {
                        if (c.getName().toLowerCase().contains(searchText.toLowerCase())) {
                            searchResults.add(c);
                        }
                    }
                    request.setAttribute("customers", searchResults);
                    request.getRequestDispatcher("/WEB-INF/newListCustomer.jsp").forward(request,response);
                    break;
            }
            showListCustomers(customerService.fillALl(), request, response);
        }
    }


    protected void showListCustomers(List<Customer> list, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("customers", list);
        req.getRequestDispatcher("/WEB-INF/newListCustomer.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Vào post");
        request.setCharacterEncoding("UTF-8");

//        phân tích action gửi lên là  gi
        String action = request.getParameter("action");
        switch (action) {
            case "ADD":
                // thêm mới
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                int id = customerService.getNewId();
                customerService.save(new Customer(id, name, email, address));
                break;
            case "UPDATE":
                int updateId = Integer.parseInt(request.getParameter("id"));
                String updateName = request.getParameter("updateName");
                String updateEmail = request.getParameter("updateEmail");
                String updateAddress = request.getParameter("updateAddress");
                customerService.save(new Customer(updateId, updateName, updateEmail, updateAddress));
                break;
            default:
                break;
        }
        showListCustomers(customerService.fillALl(), request, response);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}