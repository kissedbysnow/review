package entity;

import java.util.List;

/**
 * 分页对象
 */
public class PageBean<T> {
    private int currentPage ;   //当前页码
    private int rows;           //每页显示的记录数
    private int totalPage ;     // 总页码
    private int totalRows;     // 总记录数
    private List<T> list ;      // 每页的数据

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalRows() {
        return totalRows;
    }

    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "currentPage=" + currentPage +
                ", rows=" + rows +
                ", totalPage=" + totalPage +
                ", totalRows=" + totalRows +
                ", list=" + list +
                '}';
    }
}
