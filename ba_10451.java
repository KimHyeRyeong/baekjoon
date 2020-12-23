import java.util.Scanner;
import java.util.*;

public class Main {
	
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		//백준 10451 - 순열 사이클
		int t = sc.nextInt();
		
		while(t > 0) {
			int n = sc.nextInt();
			int[] array = new int[n+1];
			boolean[] array2 = new boolean[n+1];
			for(int i = 1 ; i <= n; i++) {
				array[i] = sc.nextInt();
				array2[i] = false;
			}

			
			int getNumber = 0;
			
			int k = 1;
			while(k < n+1) {
				int firstNumber = k;
				int j = k;
				while(j <= n && array2[j] == false) {
					if(firstNumber == array[j]) {
						array2[j] = true;
						getNumber++;
						break;
					}
					else {
						array2[j] = true;
						j = array[j];
					}
				}
				k++;
			}
			System.out.println(getNumber);

			t--;
		}
		
	
	}

}