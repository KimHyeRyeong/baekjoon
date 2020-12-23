import java.util.Scanner;
import java.util.*;

public class Main {
	
	public static void main(String[] args) {
		//큐를 이용해서 문제해결하기
		Queue<Integer> cardlist = new LinkedList<>();
		Scanner sc = new Scanner(System.in);
		
		int n = sc.nextInt();
		
		for(int i = 0 ; i < n ; i ++) {
			cardlist.add(i+1);
		}
		
		while(cardlist.size() > 1) {
			cardlist.remove();
			cardlist.add(cardlist.remove());
		}
		
		System.out.println(cardlist.poll());
	}

}