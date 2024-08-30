/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.BookDetails;
import java.util.List;

/**
 *
 * @author jyoti
 */
public interface BookDao {
    public boolean addBooks(BookDetails b);
    public List<BookDetails> getAllBook();
    public BookDetails getBookbyId(int id);
    public boolean updateEditBooks(BookDetails b);
    public boolean bookDeletebyId(int id);
    public List<BookDetails> getNewBook();
    public List<BookDetails> getRecentBook();
    public List<BookDetails> getOldtBook();
    public List<BookDetails> getAllRecentBook();
    public List<BookDetails> getAllNewtBook();
    public List<BookDetails> getAllOldBook();
    public List<BookDetails> getUserOldBook(String email ,String cate);
    public boolean deleteUserOldBook(String email,int  bid ,String cate);
    public List<BookDetails> getSearchBook(String chr);
}
