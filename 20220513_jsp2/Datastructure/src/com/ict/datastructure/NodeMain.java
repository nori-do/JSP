package com.ict.datastructure;

public class NodeMain {

	public static void main(String[] args) {
		
		Node n1 = new Node();
		Node n2 = new Node();
		Node n3 = new Node();
		Node n4 = new Node();
		n1.data = 100;
		n1.next = n2;
		n1.prev = null;
		n2.data = 200;
		n2.next = n3;
		n2.prev = n1;
		n3.data = 300;
		n3.next = n4;
		n3.prev = n2;
		n4.data = 400;
		n4.next = null;
		n4.prev = n3;
		
		Node start = n1;
		System.out.println(start.next.prev.data);


	}

}
