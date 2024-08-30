/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.BookDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jyoti
 */
public class BookDaoClass implements BookDao {

    private Connection conn;

    public BookDaoClass(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addBooks(BookDetails b) {
        boolean f = false;
        try {
            String sql = "insert into book_details(bookname,author,price,bookCategory,status,photo,userEmail) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setString(6, b.getPhotoName());
            ps.setString(7, b.getEmail());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the error in the server console
        }
        return f;
    }

    @Override
    public List<BookDetails> getUserOldBook(String email, String cate) {
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String sql = "select * from book_details where userEmail=? and bookCategory=? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, cate);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDetails();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDetails> getAllBook() {
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String sql = "select * from book_details";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDetails();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDetails> getNewBook() {
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String sql = "select * from book_details where bookCategory=? and status=?  order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDetails();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDetails> getRecentBook() {
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String sql = "select * from book_details where status=?  order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDetails();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDetails> getOldtBook() {
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String sql = "select * from book_details where bookCategory=? and status=?  order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDetails();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public BookDetails getBookbyId(int id) {
        BookDetails b = null;
        try {
            String sql = "select * from book_details where bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDetails();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean updateEditBooks(BookDetails b) {
        boolean f = false;
        try {
            String sql = "update book_details set bookname=? , author=?,price=?,status=? where bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setInt(5, b.getBookId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean bookDeletebyId(int id) {
        boolean f = false;
        try {
            String sql = "delete from book_details where bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<BookDetails> getAllRecentBook() {
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String sql = "select * from book_details where status=?  order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new BookDetails();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDetails> getAllNewtBook() {
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String sql = "select * from book_details where bookCategory=? and status=?  order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDetails();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDetails> getAllOldBook() {
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String sql = "select * from book_details where bookCategory=? and status=?  order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new BookDetails();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean deleteUserOldBook(String email,int bid, String cate) {
        boolean f=false;
        try {
            String sql = "delete from book_details where userEmail=? and bookId=? and bookCategory=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setInt(2, bid);
            ps.setString(3, cate);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<BookDetails> getSearchBook(String chr) {
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String sql = "select * from book_details where bookName like ? or author like ? or bookCategory like ? and status=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+chr+"%");
            ps.setString(2, "%"+chr+"%");
            ps.setString(3, "%"+chr+"%");
            ps.setString(4, "Active");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new BookDetails();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    

}
