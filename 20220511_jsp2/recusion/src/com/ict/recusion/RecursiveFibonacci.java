package com.ict.recusion;

public class RecursiveFibonacci {
	// 메모이제이션
    static long[] memo;
    public static long fibonacci(int n) {
        if (n <= 1)
            return n;
        else if (memo[n] != 0)
            return memo[n];
        else
        	memo[n] = fibonacci(n - 1) + fibonacci(n - 2);
            return memo[n];
 
    }
    
    public static void main(String[] args) {
        memo = new long[2001];
        System.out.println(fibonacci(2000));
    }

}
