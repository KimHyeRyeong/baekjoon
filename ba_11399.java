import java.util.Scanner;
import java.util.*;

public class Main {
	
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		
		int n = sc.nextInt();
		
		int[] peopleInLine = new int[n];
		for(int i = 0 ; i<peopleInLine.length; i++) {
			peopleInLine[i] = sc.nextInt();
		}
		
		Arrays.sort(peopleInLine);
		
		int[] minArray = new int[n];
		int sum = 0;

		for(int i = 0 ; i < peopleInLine.length; i++) {
			for(int j = 0 ; j <= i; j++) {
				sum += peopleInLine[j];
			}
			minArray[i] = sum;
			
		}
		
		System.out.println(sum);
		
	}

}