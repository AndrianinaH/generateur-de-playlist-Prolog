package M1.main;

import java.util.ArrayList;

/**
 * Created by Andrianina_pc on 09/01/2018.
 */
public class Result {
    public int l1;
    public int l2;
    public int l3;
    public int l4;

    public Result(){}

    public Result(int l1, int l2, int l3, int l4){
        this.l1 = l1;
        this.l2 = l2;
        this.l3 = l3;
        this.l4 = l4;
    }

    public static void afficher(ArrayList<Result> results){
        for (Result res: results) {
            afficher(res.l1);
            afficher(res.l2);
            afficher(res.l3);
            afficher(res.l4);
            System.out.println("");
        }
    }

    public static void afficher(int l){
        for(int i=1; i<5; i++){
            if(i==l){
                System.out.print("|");
                System.out.print("X");
            }else{
                System.out.print("|");
                System.out.print(" ");
            }
        }
        System.out.println("|");
    }

}
