package cn.bookpedia.model;

public class Order extends Book{
	private int id_order;
	private int id_user;
	private int quantity;
	private String date;
	
	public Order() {}

	public Order(int id_order, int id_user, int quantity, String date) {
		super();
		this.id_order = id_order;
		this.id_user = id_user;
		this.quantity = quantity;
		this.date = date;
	}

	public Order(int id_user, int quantity, String date) {
		super();
		this.id_user = id_user;
		this.quantity = quantity;
		this.date = date;
	}

	public int getId_order() {
		return id_order;
	}

	public void setId_order(int id_order) {
		this.id_order = id_order;
	}

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Order [id_order=" + id_order + ", id_user=" + id_user + ", quantity=" + quantity + ", date=" + date
				+ "]";
	}
	
	
}
