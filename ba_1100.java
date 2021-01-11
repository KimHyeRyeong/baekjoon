package com.company;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
	// write your code here
        final int chessRow = 8;
        String chessGame ;
        Scanner sc = new Scanner(System.in);
        int sum = 0;

        for(int i = 0 ; i < chessRow; i++){
            chessGame = sc.nextLine();
            for(int j = 0 ; j < chessRow; j++){
                if(i % 2 == 0 && j % 2 ==0){
                    if(chessGame.charAt(j) == 'F'){
                        sum ++;
                    }
                }else if(i % 2 == 1 && j % 2 ==1){
                    if(chessGame.charAt(j) == 'F'){
                        sum ++;
                    }
                }
            }
        }

        System.out.println(sum);
    }
}
