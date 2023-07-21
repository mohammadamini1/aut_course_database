package src;

import java.io.*;
import java.util.Scanner;
import redis.clients.jedis.Jedis;
public class Main {
    public static void main(String[] args) throws Exception {
        Jedis jedis = new Jedis("localhost"); 
        String line = "";
        String splitBy = ",";
        try {
            BufferedReader br = new BufferedReader(new FileReader("src//NYSE_20210301.csv"));
            while ((line = br.readLine()) != null) {
                String[] q = line.split(splitBy);
                jedis.set(q[0], q[1]);
            }
            br.close();
        }
        catch (IOException e){
            e.printStackTrace();
        }
        System.out.println("connected and set csv file\nwait for user input");

        Scanner input = new Scanner(System.in);
        splitBy = " ";
        while (true){
            String user_input_line = input.nextLine();
            String[] user_input = user_input_line.split(splitBy);

            if (user_input[0].equals("create")){
                String key = null;
                String value = null;
                try{
                    key   = user_input[1];
                    value = user_input[2];
                } catch (Exception e) {
                    System.out.println("false\n");
                    // System.out.println("bad input");
                    continue;
                }

                try{
                    jedis.get(key).getClass();
                } catch (Exception e){
                    jedis.set(key, value);
                    System.out.println("true\n");
                    continue;
                }
                System.out.println("false\n");

            }

            else if (user_input[0].equals("fetch")){
                String key = null;
                try{
                    key   = user_input[1];
                } catch (Exception e) {
                    System.out.println("false\n");
                    // System.out.println("bad input");
                    continue;
                }

                try{
                    jedis.get(key).getClass();
                } catch (Exception e){
                    System.out.println("false\n");
                    continue;
                }

                System.out.println("true");
                System.out.println(jedis.get(key));
                System.out.println("");
            }

            else if (user_input[0].equals("update")){
                String key = null;
                String value = null;
                try{
                    key   = user_input[1];
                    value = user_input[2];
                } catch (Exception e) {
                    System.out.println("false\n");
                    // System.out.println("bad input");
                    continue;
                }

                try{
                    jedis.get(key).getClass();
                } catch (Exception e){
                    System.out.println("false\n");
                    continue;
                }

                jedis.set(key, value);
                System.out.println("true\n");
            }

            else if (user_input[0].equals("delete")){
                String key = null;
                try{
                    key   = user_input[1];
                } catch (Exception e) {
                    System.out.println("false\n");
                    // System.out.println("bad input");
                    continue;
                }

                try{
                    jedis.get(key).getClass();
                } catch (Exception e){
                    System.out.println("false\n");
                    continue;
                }
                jedis.del(key);
                System.out.println("true\n");
            }

            else if (user_input[0].equals("exit")){
                jedis.close();
                input.close();
            }

            else {
                System.out.println("false\n");
                // System.out.println("bad input");
            }

        }

    }
}



