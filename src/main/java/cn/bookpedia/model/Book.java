package cn.bookpedia.model;

public class Book {
	private int id_product;
	private String product_name;
	private String category;
	private double price;
	private String image;
	
	public Book() {}

	public Book(int id_product, String product_name, String category, double price, String image) {
		this.id_product = id_product;
		this.product_name = product_name;
		this.category = category;
		this.price = price;
		this.image = image;
	}

	public int getId_product() {
		return id_product;
	}

	public void setId_product(int id_product) {
		this.id_product = id_product;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Book [id_product=" + id_product + ", product_name=" + product_name + ", category=" + category
				+ ", price=" + price + ", image=" + image + "]";
	}
	
	

}
