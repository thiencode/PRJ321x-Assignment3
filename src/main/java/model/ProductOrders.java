package model;

public class ProductOrders {

	private int orderId;
	private int productId;
	private double amountProduct; //quantity of selected product
	private String nameProduct;
	
	public ProductOrders(int orderId, int productId, double amountProduct, String nameProduct) {
		this.orderId = orderId;
		this.productId = productId;
		this.amountProduct = amountProduct;
		this.nameProduct = nameProduct;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public double getAmountProduct() {
		return amountProduct;
	}

	public void setAmountProduct(int amountProduct) {
		this.amountProduct = amountProduct;
	}

	public String getNameProduct() {
		return nameProduct;
	}

	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}
	
	@Override
	public String toString() {
		return orderId + " " + productId + " " + amountProduct + " " + nameProduct;
	}
	
}