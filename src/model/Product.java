package model;

public class Product {
	private int id;
	private String name;
	private String category;
	private Double price;
	private String image;
	private int quantity;
	private int categoryId;
	private int promotion;
	
	public int getPromotion() {
		return promotion;
	}


	public void setPromotion(int promotion) {
		this.promotion = promotion;
	}


	public int getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}


	public Product() {
	}

	
	public Product(int id, String name, String category, Double price, String image) {
		super();
		this.id = id;
		this.name = name;
		this.category = category;
		this.price = price;
		this.image = image;
		
	}
	
	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public Product(int id, String name, String category, Double price, String image, int quantity) {
		super();
		this.id = id;
		this.name = name;
		this.category = category;
		this.price = price;
		this.image = image;
		this.quantity = quantity;
	}


	public Product(int id,String name, Double price, String image) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
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
		return "Product [id=" + id + ", name=" + name + ", category=" + category + ", price=" + price + ", image="
				+ image + "]";
	}
	
	
}
