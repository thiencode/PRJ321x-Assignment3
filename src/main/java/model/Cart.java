package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<Product> items; //List of item in cart
	private int count;
	
	public Cart() {
		items = new ArrayList<Product>();
	}
	
	//add a new product to cart
	public void add(Product ci) {
		for (Product x : items) {
			if (ci.getId() == x.getId()) {
				x.setNumber(x.getNumber() + 1);
				return;
			}
		}
		items.add(ci);
	}
	
	//minus a product to cart
	public int minus(int id) {
		int num = 0;
		for (Product x : items) {
			if (id == x.getId()) {
				x.setNumber(x.getNumber() - 1);
				num = x.getNumber();			
			}
		}
		return num;
	}
	
	//Remove a product from cart
	public void remove(int id) {
		for (Product x : items) {
			if (x.getId() == id) {
				items.remove(x);
				return;
			}
		}
	}
	
	//Return total amount of cart
	public double getAmount() {
		double s = 0;
		for (Product x : items) {
			s += x.getPrice() * x.getNumber();
		}
		return Math.round(s * 100.0)/100.0;
	}
	
	
	//Return Quantity product of cart
	public int getCount() {
		count = 0;
		for (Product p : items) {
			count += p.getNumber();
		}
		return count;
	}
	
	//Return list of products in cart
	public List<Product> getItems(){
		return items;
	}
}
